import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:six/app/data/config/encryption.dart';
import 'package:six/app/data/local/storage_keys.dart';
import 'package:six/app/data/remote/api_service/service.dart';

class UserProvider {
  static late UserEntity? _userEntity;
  static late String? _authToken;
  static late bool _isLoggedIn;

  static UserEntity? get currentUser => _userEntity;
  static String? get authToken => _authToken;
  static bool get isLoggedIn => _isLoggedIn;

  ///Set [currentUser] and [authToken]
  static Future<void> onLogin(UserEntity user, String userAuthToken) async {
    _isLoggedIn = true;
    _userEntity = user;
    _authToken = userAuthToken;
    await GetStorage().write(StorageKeys.userDataKey,
        AppEncryption.encrypt(plainText: jsonEncode(user.toJson())));
    await GetStorage().write(StorageKeys.authTokenKey, userAuthToken);
  }

  ///Load [currentUser] and [authToken]
  static void loadUser() {
    var encryptedUserData = GetStorage().read<String>(StorageKeys.userDataKey);

    if (encryptedUserData != null) {
      _isLoggedIn = true;
      _userEntity = UserEntity.fromJson(
          jsonDecode(AppEncryption.decrypt(cipherText: encryptedUserData))
              as Map<String, dynamic>);
      _authToken = GetStorage().read<String>(StorageKeys.authTokenKey)!;
    } else {
      _isLoggedIn = false;
    }
  }

  ///Remove [currentUser] and [authToken] from local storage
  static Future<void> onLogout() async {
    _isLoggedIn = false;
    _userEntity = null;
    _authToken = null;
    await GetStorage().remove(StorageKeys.userDataKey);
    await GetStorage().remove(StorageKeys.authTokenKey);
  }
}
