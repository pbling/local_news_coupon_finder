import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:remedi_kopo/src/kopo_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';


// remedi_kopo library 활용
// kakao map 지도검색 웹뷰 출력
// 결과 kopo model로 획득

class RemidiKopoPage extends StatefulWidget {
  static const String PATH = '/alter_kopo';

  RemidiKopoPage(
      {Key? key,
        this.title = '주소검색',
        this.colour = Colors.white,
        this.apiKey = '',
        this.callback})
      : super(key: key);

  @override
  _remidiKopoPage createState() => _remidiKopoPage();

  final String title;
  final Color colour;
  final String apiKey;
  final Function? callback;
}

class _remidiKopoPage extends State<RemidiKopoPage> {
  WebViewController? _controller;
  WebViewController? get controller => _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 52.h,
        bottomOpacity : 0.0,
        backgroundColor: Colors.white,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              width: 300.w,
              height: 50.h,
              child: Row(
                children: [
                  SizedBox(width: 25.w),
                  Text(
                    '주소검색',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16.0.sp,
                        fontFamily: "Pretendard"
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              height: 1, // 회색 줄의 높이
              color: Color(0xFFF5F5F5), // 회색 줄의 색상
            ),
          ],
        ),
      ),
      body: WebView(
          initialUrl: 'https://studio-b-co-kr.github.io/kopo/assets/daum.html',
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: Set.from([
            JavascriptChannel(
                name: 'onComplete',
                onMessageReceived: (JavascriptMessage message) {
                  //This is where you receive message from
                  //javascript code and handle in Flutter/Dart
                  //like here, the message is just being printed
                  //in Run/LogCat window of android studio
                  KopoModel result = KopoModel.fromJson(jsonDecode(message.message));

                  if (widget.callback != null) {
                    widget.callback!(result);
                  }
                  Navigator.pop(context, result);
                }),
          ]),
          onWebViewCreated: (WebViewController webViewController) async {
            _controller = webViewController;
          }),
    );
  }
}
