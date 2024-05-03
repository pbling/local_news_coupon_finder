import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Pages/category_search_page.dart';

import '../Datas/models.dart';

class CategoryView extends StatefulWidget {

  final List<Category> categoryList;
  CategoryView({Key?key, required this.categoryList}) : super(key:key);

  @override
  _categoryViewwState createState() => _categoryViewwState();
}


class _categoryViewwState extends State<CategoryView> {

  @override
  Widget build(BuildContext context) {

    return GridView.count(
      shrinkWrap: true,
      primary: false,
      crossAxisCount: 5,
      childAspectRatio: 1.0,
      mainAxisSpacing: 30.h,

      children: List.generate(widget.categoryList.length, (index) {
        Category category = widget.categoryList[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 버튼
            GestureDetector(
              onTap: () {
                print('Click Category' + category.categoryName);
                print(category.subCategoryName);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategorySearchPage(mainMenu : category.categoryName, subMenuList: category.subCategoryName),
                  ),
                );
              },

              child: Image.asset(
                category.iconUrl,
                width: 30.w,
                height: 30.h,
                fit: BoxFit.fill,
              ),

            ),
            SizedBox(height: 8.h),
            Container(
              child: Text(
                category.categoryName,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                    color: Colors.black
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ],
        );
      }),
    );
  }
}