import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftreader/http/BaseImg.dart';
import 'package:ftreader/model/BookBean.dart';
import 'package:ftreader/model/BookListBean.dart';
import 'package:ftreader/model/CityCategoryBean.dart';
import 'package:ftreader/res.dart';
import 'package:ftreader/widget/PageBookWidget.dart';

/// 更多
class CityCardMore extends StatelessWidget {
  final CityCategoryBean cityCategoryBean;

  CityCardMore(this.cityCategoryBean);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 3,
        color: Res.colorDivide,
      ),
      getCardTop(),
      Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: getBooks())
    ]);
  }

  /// 卡片顶部View
  Widget getCardTop() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 8, maxHeight: 20),
                  color: Res.colorBlueFont,
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
    var ret;
    switch (cityCategoryBean.Category) {
      case "热门连载":
        ret = getBookLayout7(cityCategoryBean.Books);
        break;
      case "火热新书":
        ret = getBookLayout5(cityCategoryBean.Books);
        break;
      case "完本精选":
        ret = getBookLayout6(cityCategoryBean.Books);
        break;
      case "重磅推荐":
        ret = PageBookWidget(cityCategoryBean.Books);
        break;
      default:
        ret = Text("无内容");
        break;
    }
    return ret;
  }

  /// 重推书单
  Widget getBookList(BookListBean bookListBean) {
    if (bookListBean == null) {
      return Text("无内容");
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(bookListBean.Title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, color: Res.colorBaseTitle)),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 4),
          child: Text(bookListBean.Description,
              maxLines: 1,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 10, color: Res.colorContent)),
        ),
        Container(
          height: 150,
          child: Image.network(
            bookListBean.ImgUrl,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  Widget getBookLayout7(List<BookBean> books) {
    if (books == null || books.length <= 0) {
      return Text("无内容");
    }
    return Column(
      children: <Widget>[
        getOneDetailBookLayout(books[0]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            getOneSimpleBookLayout(books[1]),
            getOneSimpleBookLayout(books[2]),
            getOneSimpleBookLayout(books[3]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            getOneSimpleBookLayout(books[4]),
            getOneSimpleBookLayout(books[5]),
            getOneSimpleBookLayout(books[6])
          ],
        ),
      ],
    );
  }

  Widget getBookLayout6(List<BookBean> books) {
    if (books == null || books.length <= 0) {
      return Text("无内容");
    }
    return Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              getOneSimpleBookLayout(books[0]),
              getOneSimpleBookLayout(books[1]),
              getOneSimpleBookLayout(books[2]),
            ]),
        Row(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: getOneSimpleBookLayout(books[3]),
            ),
            Expanded(
              flex: 1,
              child: getOneSimpleBookLayout(books[4]),
            ),
            Expanded(
              flex: 0,
              child: getOneSimpleBookLayout(books[5]),
            )
          ],
        ),
      ],
    );
  }

  Widget getBookLayout5(List<BookBean> books) {
    if (books == null || books.length <= 0) {
      return Text("无内容");
    }
    return Column(
      children: <Widget>[
        getOneDetailBookLayout(books[0]),
        getOneDetailBookLayout(books[1]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            getOneSimpleBookLayout(books[2]),
            getOneSimpleBookLayout(books[3]),
            getOneSimpleBookLayout(books[4])
          ],
        ),
      ],
    );
  }

  Widget getOneDetailBookLayout(BookBean bookBean) {
    return GestureDetector(
      onTap: () => onClick(bookBean),
      child: Container(
        margin: EdgeInsets.only(top: 8),
        child: Row(
          children: <Widget>[
            Container(
                width: 75,
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
                                  left: 5, top: 0, right: 5, bottom: 0),
                              child: Text(
                                bookBean.CName,
                                style: TextStyle(
                                    color: Res.colorBlue, fontSize: 10),
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
      ),
    );
  }

  Widget getOneSimpleBookLayout(BookBean bookBean) {
    return GestureDetector(
      onTap: () => onClick(bookBean),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 75,
            height: 100,
            child: Image.network(
              BaseImg.getUrl(bookBean.Img),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 75,
            child: Text(
              bookBean.Name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Res.colorBaseTitle),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            width: 75,
            child: Text(
              bookBean.Author,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, color: Res.colorSubTitle),
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }

  void onClick(BookBean bookBean) {
    print("onClick:" + bookBean.Name);
  }
}
