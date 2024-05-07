import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';

class FullPhotoListView extends StatelessWidget {
  final List<String> imageUrls;

  FullPhotoListView({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(360.w, 50.h),
        child: AppBar(
          toolbarHeight: 50.h,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: min(16.h, 16.sp),
            ),
            onPressed: () {
              Navigator.pop(context); // 이전 화면으로 돌아가기
            },
          ),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
                width: 360.w,
                height: 49.h,
                child: Row(
                  children: [
                    SizedBox(width: 50.w),
                    Text(
                      "전체 사진",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: min(16.h, 16.sp),
                          fontFamily: "Pretendard"
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                height: 1.h, // 회색 줄의 높이
                color: Color(0xFFF5F5F5), // 회색 줄의 색상
              ),
            ],
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 5.0.w,
          mainAxisSpacing: 5.0.h,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => _openPhotoView(context, imageUrls[index]),
              ));
            },
            child: Image.network(imageUrls[index], fit: BoxFit.cover),
          );
        },
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
