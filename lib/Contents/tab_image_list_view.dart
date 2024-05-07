import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef void TabIndexChangedCallback(int index);

class TabWithImageListView extends StatefulWidget {
  final List<String> tabItems;
  final List<String> tabImages;
  final TabIndexChangedCallback onTabIndexChanged;

  TabWithImageListView({required this.tabItems, required this.tabImages, required this.onTabIndexChanged});

  @override
  _tabWithImageListViewState createState() => _tabWithImageListViewState();
}

class _tabWithImageListViewState extends State<TabWithImageListView> {
  late int _selectedTabIndex;


  @override
  void initState() {
    super.initState();
    // 페이지가 로드될 때 초기 선택된 탭 인덱스를 0으로 설정
    _selectedTabIndex = 0;
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: Colors.white,
        child : Row(
          children: List.generate(widget.tabItems.length, (index) {
            return InkWell(
                onTap: () {
                  // 탭을 눌렀을 때의 동작
                  setState(() {
                    // 선택된 탭 인덱스 업데이트
                    _selectedTabIndex = index;
                    widget.onTabIndexChanged(index);
                  });
                  print('Tab: $index clicked');
                },
                child: Container(
                  margin: EdgeInsets.only(right : 7.w),
                  padding: EdgeInsets.only(left:15.w, right:15.w,top: 7.h, bottom: 7.h),

                  decoration: BoxDecoration(
                    color: index == _selectedTabIndex ? Color(0xFF191919) : Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: index == _selectedTabIndex ? Color(0xFF191919) : Color(0xFFE3E3E3), // 테두리 색상
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 이미지
                        widget.tabImages[index]!=''? Image.asset(
                          widget.tabImages[index], // 이미지 경로 설정
                          width: 20.w,
                          height: 20.h,
                        ) : SizedBox(),
                        widget.tabImages[index]!=''? SizedBox(width: 3.w) : SizedBox(),
                        // 텍스트
                        Text(
                          widget.tabItems[index],
                          style: TextStyle(
                            color: index == _selectedTabIndex ? Colors.white : Color(0xFF666666),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Pretendard",
                            fontSize: min(14.h, 14.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            );
          }).toList(),
        ),
      ),
    );
  }
}
