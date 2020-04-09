import 'package:flutter/cupertino.dart';
import 'package:ftreader/model/BookListBean.dart';
import 'package:ftreader/model/CityCategoryBean.dart';

import '../res.dart';

///重推书单
class BookSetWidget extends StatelessWidget {
  final CityCategoryBean cityCategoryBean;

  BookSetWidget(this.cityCategoryBean);

  @override
  Widget build(BuildContext context) {
    return getBookList(cityCategoryBean.BookList);
  }

  /// 重推书单
  Widget getBookList(BookListBean bookListBean) {
    if (bookListBean == null) {
      return Text("无内容");
    }
    return Column(
      children: <Widget>[
        Container(
          height: 3,
        color: Res.colorDivide,
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
          child: Column(
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
          ),
        ),
      ],
    );
  }
}
