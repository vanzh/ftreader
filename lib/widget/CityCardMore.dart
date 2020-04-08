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
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
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
      ),
    );
  }

  Widget getBooks() {
    if (cityCategoryBean.Books != null && cityCategoryBean.Books.length > 0) {
      var ret;
      switch (cityCategoryBean.Category) {
        case "热门连载":
          ret = getBookLayout7();
          break;
        case "火热新书":
          ret = getBookLayout5();
          break;
        case "完本精选":
          ret = getBookLayout6();
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
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[1]),
                ),
                Expanded(
                  flex: 1,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[2]),
                ),
                Expanded(
                  flex: 0,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[3]),
                )
              ],
            )),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[4]),
                ),
                Expanded(
                  flex: 1,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[5]),
                ),
                Expanded(
                  flex: 0,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[6]),
                )
              ],
            )),
      ],
    );
  }

  Widget getBookLayout6() {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[0]),
                ),
                Expanded(
                  flex: 1,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[1]),
                ),
                Expanded(
                  flex: 0,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[2]),
                )
              ],
            )),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[3]),
                ),
                Expanded(
                  flex: 1,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[4]),
                ),
                Expanded(
                  flex: 0,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[5]),
                )
              ],
            )),
      ],
    );
  }

  Widget getBookLayout5() {
    return Column(
      children: <Widget>[
        getOneDetailBookLayout(cityCategoryBean.Books[0]),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[1]),
                ),
                Expanded(
                  flex: 1,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[2]),
                ),
                Expanded(
                  flex: 0,
                  child: getOneSimpleBookLayout(cityCategoryBean.Books[3]),
                )
              ],
            )),
      ],
    );
  }

  Widget getOneDetailBookLayout(BookBean bookBean) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 8, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              color: Colors.black,
              width: 80,
              height: 100,
              child: Image.network(
                BaseImg.getUrl(bookBean.Img),
                fit: BoxFit.cover,
              )),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(bookBean.Name,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(color: Res.colorBaseTitle, fontSize: 14)),
                  Container(
                    padding: EdgeInsets.only(top: 6, bottom: 6),
                    child: Text(bookBean.Desc,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(color: Res.colorContent, fontSize: 12)),
                  ),
                  Row(
                    children: <Widget>[
                      Text(bookBean.Author,
                          style: TextStyle(
                              color: Res.colorSubTitle, fontSize: 10)),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue[200]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 5, top: 1, right: 5, bottom: 1),
                            child: Text(
                              bookBean.CName,
                              style:
                                  TextStyle(color: Res.colorBlue, fontSize: 10),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getOneSimpleBookLayout(BookBean bookBean) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Image.network(
            BaseImg.getUrl(bookBean.Img),
            width: 80,
            height: 100,
          ),
        ),
        Container(
          width: 80,
          child: Text(
            bookBean.Name,
            style: TextStyle(
              fontSize: 11,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          bookBean.Author,
          style: TextStyle(fontSize: 10),
          maxLines: 1,
        )
      ],
    );
  }
}
