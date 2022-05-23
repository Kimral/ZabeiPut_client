import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CPhotoViewPage extends StatefulWidget {
  const CPhotoViewPage({Key? key}) : super(key: key);

  @override
  State<CPhotoViewPage> createState() => _CPhotoViewPageState();
}

class _CPhotoViewPageState extends State<CPhotoViewPage> {
  @override
  Widget build(BuildContext context) {
    didChangeDependencies();
    return Material(
      child: PhotoView(
        imageProvider: const CachedNetworkImageProvider(
          "https://geo-1.ru/wp-content/uploads/2018/10/0721.jpg"
        ),
      ),
    );
  }
}
