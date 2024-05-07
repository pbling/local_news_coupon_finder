import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsDetailPage extends StatefulWidget {
  final String path;

  const TermsDetailPage({Key? key, required this.path}) : super(key: key);
  @override
  _TermsDetailPageState createState() => _TermsDetailPageState();
}

class _TermsDetailPageState extends State<TermsDetailPage> {

  late Future<String> _markdownFuture;

  @override
  void initState() {
    super.initState();
    _markdownFuture = _loadMarkdown(widget.path);
  }

  Future<String> _loadMarkdown(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                          "약관 상세페이지",
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

          body: FutureBuilder<String>(
            future: _markdownFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Markdown(data: snapshot.data ?? '');
              } else if (snapshot.hasError) {
                return Center(child: Text('약관을 불러오는 중 오류가 발생했습니다.'));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
    );
  }
}

