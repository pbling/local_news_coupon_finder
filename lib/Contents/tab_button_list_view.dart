import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef void TabIndexChangedCallback(int index);

class TabButtonListView extends StatefulWidget {
  final List<String> tabItems;
  final TabIndexChangedCallback onTabIndexChanged;

  TabButtonListView({required this.tabItems, required this.onTabIndexChanged});

  @override
  _tabButtonListViewState createState() => _tabButtonListViewState();
}

class _tabButtonListViewState extends State<TabButtonListView> {
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
                  padding: EdgeInsets.only(left:20.w, right:20.w,top: 6.h, bottom: 6.h),

                  decoration: BoxDecoration(
                    color: index == _selectedTabIndex ? Color(0xFF191919) : Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: index == _selectedTabIndex ? Color(0xFF191919) : Color(0xFFE3E3E3), // 테두리 색상
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.tabItems[index],
                      style: TextStyle(
                        color: index == _selectedTabIndex ? Colors.white : Color(0xFF666666),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Pretendard",
                        fontSize: 14.sp,
                      ),
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
