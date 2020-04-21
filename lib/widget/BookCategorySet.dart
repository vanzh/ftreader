import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftreader/model/BookCategoryBean.dart';
import 'package:ftreader/model/CityCategoryBean.dart';
import '../res.dart';

class BookCategorySet extends StatelessWidget {
  final List<Color> colors = [
    Colors.green[800],
    Colors.orange[800],
    Colors.lime[800],
    Colors.lightBlue[800]
  ];
  final CityCategoryBean cityCategoryBean;

  BookCategorySet(this.cityCategoryBean);

  @override
  Widget build(BuildContext context) {
    if (cityCategoryBean == null ||
        cityCategoryBean.Categories == null ||
        cityCategoryBean.Categories.length == 0) {
      return Text("无数据");
    }
    return getCityCategorySetLayout(cityCategoryBean.Categories);
  }

  Widget getCityCategorySetLayout(List<BookCategoryBean> categories) {
    if (categories == null || categories.length == 0) {
      return Text("");
    }
    List<Widget> items= List();
    for (int i = 0; i < categories.length; i++) {
      items.add(oneItemWidget(i, categories[i]));
    }
    //return Text("===");
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 8),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, children: items),
    );
  }

  Widget oneItemWidget(int index, BookCategoryBean bookCategoryBean) {
    return GestureDetector(
      onTap: () => onClick(bookCategoryBean),
      child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
          decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Text(bookCategoryBean.CategoryName,
              style: TextStyle(
                fontSize: 12,
                color: Res.colorWhite,
              ))),
    );
  }

  void onClick(BookCategoryBean bookCategoryBean) {
    print("onClick:" + bookCategoryBean.CategoryName);
  }
}
