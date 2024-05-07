import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Contents/store_list_view.dart';
import '../Datas/models.dart';

class PickStoresPage extends StatefulWidget {

  final List<Store> pickStoreList;
  PickStoresPage({required this.pickStoreList});

  @override
  _pickStoresPageState createState() => _pickStoresPageState();
}

class _pickStoresPageState extends State<PickStoresPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print(widget.pickStoreList);

    return SafeArea(
        child: Scaffold(
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
                  width: 360.w,
                  height: 50.h,
                  child:  Stack(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 50.w),
                          Text(
                            '나의 Pick 상점',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16.0.sp,
                                fontFamily: "Pretendard"
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Color(0xFFF5F5F5), // 회색 줄의 높이
                  height: 1, // 회색 줄의 색상
                ),
              ],
            ),
          ),
          body : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.pickStoreList.isEmpty?
                Center(
                  child: Text('저장한 상점이 없습니다.')) :
                StoreListView(storeList: widget.pickStoreList),
              ],
            ),
          ),
        ),
    );
  }
}