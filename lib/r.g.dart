// IT IS GENERATED BY FLR - DO NOT MODIFY BY HAND
// YOU CAN GET MORE DETAILS ABOUT FLR FROM:
// - https://github.com/Fly-Mix/flr-cli
// - https://github.com/Fly-Mix/flr-vscode-extension
// - https://github.com/Fly-Mix/flr-as-plugin
//

// ignore: unused_import
import 'package:flutter/widgets.dart';
// ignore: unused_import
import 'package:flutter/services.dart' show rootBundle;
// ignore: unused_import
import 'package:path/path.dart' as path;
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
// ignore: unused_import
import 'package:r_dart_library/asset_svg.dart';

/// This `R` class is generated and contains references to static asset resources.
class R {
  /// package name: six
  static const package = "six";

  /// This `R.image` struct is generated, and contains static references to static non-svg type image asset resources.
  static const image = _R_Image();

  /// This `R.svg` struct is generated, and contains static references to static svg type image asset resources.
  static const svg = _R_Svg();

  /// This `R.text` struct is generated, and contains static references to static text asset resources.
  static const text = _R_Text();

  /// This `R.fontFamily` struct is generated, and contains static references to static font asset resources.
  static const fontFamily = _R_FontFamily();
}

/// Asset resource’s metadata class.
/// For example, here is the metadata of `packages/flutter_demo/assets/images/example.png` asset:
/// - packageName：flutter_demo
/// - assetName：assets/images/example.png
/// - fileDirname：assets/images
/// - fileBasename：example.png
/// - fileBasenameNoExtension：example
/// - fileExtname：.png
class AssetResource {
  /// Creates an object to hold the asset resource’s metadata.
  const AssetResource(this.assetName, {this.packageName});

  /// The name of the main asset from the set of asset resources to choose from.
  final String assetName;

  /// The name of the package from which the asset resource is included.
  final String? packageName;

  /// The name used to generate the key to obtain the asset resource. For local assets
  /// this is [assetName], and for assets from packages the [assetName] is
  /// prefixed 'packages/<package_name>/'.
  String get keyName =>
      packageName == null ? assetName : "packages/$packageName/$assetName";

  /// The file basename of the asset resource.
  String get fileBasename {
    final basename = path.basename(assetName);
    return basename;
  }

  /// The no extension file basename of the asset resource.
  String get fileBasenameNoExtension {
    final basenameWithoutExtension = path.basenameWithoutExtension(assetName);
    return basenameWithoutExtension;
  }

  /// The file extension name of the asset resource.
  String get fileExtname {
    final extension = path.extension(assetName);
    return extension;
  }

  /// The directory path name of the asset resource.
  String get fileDirname {
    var dirname = assetName;
    if (packageName != null) {
      final packageStr = "packages/$packageName/";
      dirname = dirname.replaceAll(packageStr, "");
    }
    final filenameStr = "$fileBasename/";
    dirname = dirname.replaceAll(filenameStr, "");
    return dirname;
  }
}

// ignore: camel_case_types
class _R_Image_AssetResource {
  const _R_Image_AssetResource();

  /// asset: assets/images/Discount.png
  // ignore: non_constant_identifier_names
  final discount =
      const AssetResource("assets/images/Discount.png", packageName: null);

  /// asset: assets/images/Home.png
  // ignore: non_constant_identifier_names
  final home = const AssetResource("assets/images/Home.png", packageName: null);

  /// asset: assets/images/Home_active.png
  // ignore: non_constant_identifier_names
  final home_active =
      const AssetResource("assets/images/Home_active.png", packageName: null);

  /// asset: assets/images/Profile.png
  // ignore: non_constant_identifier_names
  final profile =
      const AssetResource("assets/images/Profile.png", packageName: null);

  /// asset: assets/images/Profile_active.png
  // ignore: non_constant_identifier_names
  final profile_active = const AssetResource("assets/images/Profile_active.png",
      packageName: null);

  /// asset: assets/images/bell.png
  // ignore: non_constant_identifier_names
  final bell = const AssetResource("assets/images/bell.png", packageName: null);

  /// asset: assets/images/discoun_active.png
  // ignore: non_constant_identifier_names
  final discoun_active = const AssetResource("assets/images/discoun_active.png",
      packageName: null);

  /// asset: assets/images/home_new.png
  // ignore: non_constant_identifier_names
  final home_new =
      const AssetResource("assets/images/home_new.png", packageName: null);

  /// asset: assets/images/man.png
  // ignore: non_constant_identifier_names
  final man = const AssetResource("assets/images/man.png", packageName: null);

  /// asset: assets/images/onboarding_5.png
  // ignore: non_constant_identifier_names
  final onboarding_5 =
      const AssetResource("assets/images/onboarding_5.png", packageName: null);

  /// asset: assets/images/onboarding_6.png
  // ignore: non_constant_identifier_names
  final onboarding_6 =
      const AssetResource("assets/images/onboarding_6.png", packageName: null);

  /// asset: assets/images/onboarding_7.png
  // ignore: non_constant_identifier_names
  final onboarding_7 =
      const AssetResource("assets/images/onboarding_7.png", packageName: null);

  /// asset: assets/images/profile_new.png
  // ignore: non_constant_identifier_names
  final profile_new =
      const AssetResource("assets/images/profile_new.png", packageName: null);

  /// asset: assets/images/six_logo.png
  // ignore: non_constant_identifier_names
  final six_logo =
      const AssetResource("assets/images/six_logo.png", packageName: null);
}

// ignore: camel_case_types
class _R_Svg_AssetResource {
  const _R_Svg_AssetResource();
}

// ignore: camel_case_types
class _R_Text_AssetResource {
  const _R_Text_AssetResource();
}

/// This `_R_Image` class is generated and contains references to static non-svg type image asset resources.
// ignore: camel_case_types
class _R_Image {
  const _R_Image();

  final asset = const _R_Image_AssetResource();

  /// asset: assets/images/Discount.png
  // ignore: non_constant_identifier_names
  AssetImage discount() {
    return AssetImage(asset.discount.keyName);
  }

  /// asset: assets/images/Home.png
  // ignore: non_constant_identifier_names
  AssetImage home() {
    return AssetImage(asset.home.keyName);
  }

  /// asset: assets/images/Home_active.png
  // ignore: non_constant_identifier_names
  AssetImage home_active() {
    return AssetImage(asset.home_active.keyName);
  }

  /// asset: assets/images/Profile.png
  // ignore: non_constant_identifier_names
  AssetImage profile() {
    return AssetImage(asset.profile.keyName);
  }

  /// asset: assets/images/Profile_active.png
  // ignore: non_constant_identifier_names
  AssetImage profile_active() {
    return AssetImage(asset.profile_active.keyName);
  }

  /// asset: assets/images/bell.png
  // ignore: non_constant_identifier_names
  AssetImage bell() {
    return AssetImage(asset.bell.keyName);
  }

  /// asset: assets/images/discoun_active.png
  // ignore: non_constant_identifier_names
  AssetImage discoun_active() {
    return AssetImage(asset.discoun_active.keyName);
  }

  /// asset: assets/images/home_new.png
  // ignore: non_constant_identifier_names
  AssetImage home_new() {
    return AssetImage(asset.home_new.keyName);
  }

  /// asset: assets/images/man.png
  // ignore: non_constant_identifier_names
  AssetImage man() {
    return AssetImage(asset.man.keyName);
  }

  /// asset: assets/images/onboarding_5.png
  // ignore: non_constant_identifier_names
  AssetImage onboarding_5() {
    return AssetImage(asset.onboarding_5.keyName);
  }

  /// asset: assets/images/onboarding_6.png
  // ignore: non_constant_identifier_names
  AssetImage onboarding_6() {
    return AssetImage(asset.onboarding_6.keyName);
  }

  /// asset: assets/images/onboarding_7.png
  // ignore: non_constant_identifier_names
  AssetImage onboarding_7() {
    return AssetImage(asset.onboarding_7.keyName);
  }

  /// asset: assets/images/profile_new.png
  // ignore: non_constant_identifier_names
  AssetImage profile_new() {
    return AssetImage(asset.profile_new.keyName);
  }

  /// asset: assets/images/six_logo.png
  // ignore: non_constant_identifier_names
  AssetImage six_logo() {
    return AssetImage(asset.six_logo.keyName);
  }
}

/// This `_R_Svg` class is generated and contains references to static svg type image asset resources.
// ignore: camel_case_types
class _R_Svg {
  const _R_Svg();

  final asset = const _R_Svg_AssetResource();
}

/// This `_R_Text` class is generated and contains references to static text asset resources.
// ignore: camel_case_types
class _R_Text {
  const _R_Text();

  final asset = const _R_Text_AssetResource();
}

/// This `_R_FontFamily` class is generated and contains references to static font asset resources.
// ignore: camel_case_types
class _R_FontFamily {
  const _R_FontFamily();
}
