import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:six/app/data/config/encryption.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/storage_keys.dart';
import 'package:six/app/data/models/user_entity.dart';

class UserProvider {
  static UserEntity? _userEntity;
  static String? _authToken;
  static late bool _isLoggedIn;
  static String? _staticRole;

  static UserEntity? get currentUser => _userEntity;
  static String? get authToken => _authToken ?? '';
  static String? get role => currentUser?.role ?? _staticRole;
  static bool get isLoggedIn => _isLoggedIn;

  static set staticRole(String currentRole) {
    logWTF(currentRole);
    logW(currentUser.runtimeType);
    _staticRole = currentRole;
  }

  ///Set [currentUser] and [authToken]
  static Future<void> onLogin(UserEntity user, String userAuthToken) async {
    logI('####@@@$userAuthToken');
    _isLoggedIn = true;
    _userEntity = user;
    _authToken = userAuthToken;
    await GetStorage().write(StorageKeys.userDataKey,
        AppEncryption.encrypt(plainText: user.toJson()));
    await GetStorage().write(StorageKeys.authTokenKey, userAuthToken);
  }

  ///Load [currentUser] and [authToken]
  static void loadUser() {
    var encryptedUserData = GetStorage().read<String>(StorageKeys.userDataKey);

    if (encryptedUserData != null) {
      _isLoggedIn = true;
      var userData = AppEncryption.decrypt(cipherText: encryptedUserData);
      logI(userData.runtimeType);
      logI(userData);
      logI(jsonDecode(userData).runtimeType);
      _userEntity =
          UserEntity.fromMap(jsonDecode(userData) as Map<String, dynamic>);
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
