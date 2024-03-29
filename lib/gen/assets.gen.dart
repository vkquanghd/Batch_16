/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class Assets {
  Assets._();

  static const AssetGenImage email1 = AssetGenImage('assets/email 1.png');
  static const AssetGenImage felmale = AssetGenImage('assets/felmale.png');
  static const AssetGenImage icons8Github1201 =
      AssetGenImage('assets/icons8-github-120 1.png');
  static const AssetGenImage icons8Google481 =
      AssetGenImage('assets/icons8-google-48 1.png');
  static const AssetGenImage icons8Password1001 =
      AssetGenImage('assets/icons8-password-100 1.png');
  static const AssetGenImage icons8ShowPassword321 =
      AssetGenImage('assets/icons8-show-password-32 1.png');
  static const AssetGenImage icons8User641 =
      AssetGenImage('assets/icons8-user-64 1.png');
  static const AssetGenImage linkedin1 = AssetGenImage('assets/linkedin 1.png');
  static const AssetGenImage women = AssetGenImage('assets/women.png');

  /// List of all assets
  static List<AssetGenImage> get values => [
        email1,
        felmale,
        icons8Github1201,
        icons8Google481,
        icons8Password1001,
        icons8ShowPassword321,
        icons8User641,
        linkedin1,
        women
      ];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
