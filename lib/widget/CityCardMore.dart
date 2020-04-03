import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftreader/http/BaseImg.dart';
import 'package:ftreader/model/BookBean.dart';
import 'package:ftreader/model/CityCategoryBean.dart';
import 'package:ftreader/res.dart';

/// 更多
class CityCardMore extends StatelessWidget {
  final CityCategoryBean cityCategoryBean;

  CityCardMore(this.cityCategoryBean);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[getCardTop(), getBooks()]);
  }

  /// 卡片顶部View
  Widget getCardTop() {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                constraints: BoxConstraints(maxWidth: 8, maxHeight: 20),
                color: Colors.blue[300],
              ),
            )),
        Expanded(
          flex: 1,
          child: Text(cityCategoryBean.Category,
              style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w600,
                  fontSize: 20)),
        ),
        Expanded(
          flex: 0,
          child: Padding(
              padding: EdgeInsets.only(left: 5, right: 10),
              child: Row(
                children: <Widget>[
                  Text("更多",
                      style: TextStyle(color: Colors.black12, fontSize: 15)),
                  Image.asset(
                    Res.ic_citycard_more,
                    width: 15,
                    height: 15,
                  )
                ],
              )),
        )
      ],
    );
  }

  Widget getBooks() {
    if (cityCategoryBean.Books != null && cityCategoryBean.Books.length > 0) {
      var ret;
      switch (cityCategoryBean.Books.length) {
        case 7:
          ret = getBookLayout7();
          break;
        default:
          ret = Text("无内容");
          break;
      }
      return ret;
    }

    return Text("无内容");
  }

  Widget getBookLayout7() {
    return Column(
      children: <Widget>[
        getOneDetailBookLayout(cityCategoryBean.Books[0]),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child:

        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: getOneSimpleBookLayout(cityCategoryBean.Books[1]),
            ),
            Expanded(
              flex: 1,
              child: getOneSimpleBookLayout(cityCategoryBean.Books[2]),
            ),
            Expanded(
              flex: 1,
              child: getOneSimpleBookLayout(cityCategoryBean.Books[3]),
            )
          ],
        )),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: getOneSimpleBookLayout(cityCategoryBean.Books[4]),
            ),
            Expanded(
              flex: 1,
              child: getOneSimpleBookLayout(cityCategoryBean.Books[5]),
            ),
            Expanded(
              flex: 1,
              child: getOneSimpleBookLayout(cityCategoryBean.Books[6]),
            )
          ],
        ),
      ],
    );
  }

  Widget getOneDetailBookLayout(BookBean bookBean) {
    return Padding(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Container(
                width: 70,
                height: 100,
                child: Image.network(
                  BaseImg.getUrl(bookBean.Img),
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Text(bookBean.Name),
                Text(
                  bookBean.Desc,
                  maxLines: 2,
                ),
                Row(
                  children: <Widget>[
                    Text(bookBean.Author),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue[200]),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 5, top: 2, right: 5, bottom: 2),
                          child: Text(bookBean.CName),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getOneSimpleBookLayout(BookBean bookBean) {

    return Column(
      children: <Widget>[
        Container(
          child: Image.network(
            BaseImg.getUrl(bookBean.Img),
            width: 70,
            height: 100,
          ),
        ),
        Text(bookBean.Name, style: TextStyle(fontSize: 12,),maxLines: 1,),
        Text(bookBean.Author, style: TextStyle(fontSize: 10),maxLines: 1,)
      ],
    );
  }


}
