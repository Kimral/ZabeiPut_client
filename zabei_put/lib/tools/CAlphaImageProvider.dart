import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class _CAlphaImageProvider{
  final Object providerCacheKey;

  const _CAlphaImageProvider(this.providerCacheKey);

  @override
  bool operator ==(Object other) {
    if(other.runtimeType != runtimeType) {
      return false;
    }
    return other is _CAlphaImageProvider && other.providerCacheKey == providerCacheKey;
  }

  @override
  int get hashCode => providerCacheKey.hashCode;
}

class CAlphaImageProvider extends ImageProvider<_CAlphaImageProvider> {
  final ImageProvider imageProvider;

  const CAlphaImageProvider(this.imageProvider);

  @override
  ImageStreamCompleter load(_CAlphaImageProvider key, DecoderCallback decode) {
    final Decoder = (
      Uint8List bytes,
      {
        bool allowUpscaling = false,
        int? cacheWidth,
        int? cacheHeight,
      }
    ) async {
      return decode(
        await whiteToAlpha(bytes),
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight
      );
    };
    return imageProvider.load(key.providerCacheKey, Decoder);
  }

  @override
  Future<_CAlphaImageProvider> obtainKey(ImageConfiguration configuration) {
    late Completer<_CAlphaImageProvider> completer;
    late SynchronousFuture<_CAlphaImageProvider> result;
    imageProvider.obtainKey(configuration).then((Object key) {
      if(completer == null) {
        result =
            SynchronousFuture<_CAlphaImageProvider>(_CAlphaImageProvider(key));
      } else {
        completer.complete(_CAlphaImageProvider(key));
      }
    });
    if (result != null) {
      return result;
    }
    completer = Completer<_CAlphaImageProvider>();
    return completer.future;
  }

  @override
  Future<Uint8List> whiteToAlpha(Uint8List bytes) async {
    final image = decodeImageFromList(bytes);
    image.
    final pixek = image.getBytes(format: PixelFormat.rgba8888);

    return encodePng(image);
  }
}
