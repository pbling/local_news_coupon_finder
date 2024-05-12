import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'full_photo_list_view.dart';

class PhotoListView extends StatefulWidget {
  final List<String> imageUrls;

  PhotoListView({Key? key, required this.imageUrls}) : super(key: key);

  @override
  _PhotoListViewState createState() => _PhotoListViewState();
}

class _PhotoListViewState extends State<PhotoListView> {
  late final int imageLength;
  late final int extraImageCount;
  late final bool overLength;

  @override
  void initState() {
    super.initState();
    if (widget.imageUrls.length > 6) {
      overLength = true;
      extraImageCount = widget.imageUrls.length - 5;
      imageLength = 5;
    } else {
      overLength = false;
      extraImageCount = 0;
      imageLength = widget.imageUrls.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: overLength ? _buildImageGrid(true) : _buildImageGrid(false),
    );
  }

  Widget _buildImageGrid(bool showMore) {
    return Container(
      height: max(220.w, 220.h),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 5.0.w,
          mainAxisSpacing: 5.0.h,
        ),
        itemCount: showMore ? imageLength + 1 : imageLength,
        itemBuilder: (context, index) {
          if (index < imageLength) {
            return _buildImageItem(widget.imageUrls[index]);
          } else {
            return _buildMoreButton();
          }
        },
      ),
    );
  }

  Widget _buildImageItem(String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => _openPhotoView(context, imageUrl),
        ));
      },
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }

  Widget _buildMoreButton() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) => FullPhotoListView(imageUrls: widget.imageUrls),
      )),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child : ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.srcATop
              ),
              child: Image.network(widget.imageUrls[5], fit: BoxFit.cover),
            )
          ),
          Center(
            child: Text(
              '더보기 + $extraImageCount',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: min(14.sp, 14.h),
                  fontFamily: "Pretendard"
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _openPhotoView(BuildContext context, String path) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PhotoView(
            imageProvider: NetworkImage(path),
            backgroundDecoration: BoxDecoration(color: Colors.black),
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.covered * 2,
            heroAttributes: PhotoViewHeroAttributes(tag: path),
          ),
          Positioned(
            top: 40.0,
            right: 10.0,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: min(25.sp, 25.h),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          )
        ],
      ),
    );
  }
}
