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
    //return Text("===");
    return Row(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: Res.colorBlue),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text(categories[0].CategoryName,
                style: TextStyle(
                  fontSize: 12,
                  color: Res.colorWhite,
                ))),
      ],
    );
//    return ListView.builder(
//        itemCount: categories.length,
//        itemBuilder: (BuildContext context, int index) {
//          return Container(
//            decoration: BoxDecoration(
//                border: Border.all(color: Res.colorBlue),
//                borderRadius: BorderRadius.all(Radius.circular(20))),
//            child: Text(
//              categories[index].CategoryName,
//              style: TextStyle(
//                fontSize: 12,
//                color: Res.colorWhite,
//              ),
//            ),
//          );
//        });
  }
}
