import 'package:flutter/widgets.dart';
import 'package:ftreader/http/ApiFactory.dart';
import 'package:ftreader/model/CityCategoryBean.dart';
import 'package:ftreader/widget/BookCategorySet.dart';
import 'package:ftreader/widget/BookSetWidget.dart';
import 'package:ftreader/widget/CityCardMore.dart';

class BookCityTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookCityState();
  }
}

class _BookCityState extends State<BookCityTab>
    with AutomaticKeepAliveClientMixin {
  List<CityCategoryBean> datas;

  @override
  void initState() {
    super.initState();
    api.bookCityList().then((result) {
      print(result);
      datas = result;
      setNewState();
    });
  }

  void setNewState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (datas == null || datas.length == 0) {
      return Text("数据请求中...");
    }
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        CityCardMore(findCategoryBean("重磅推荐")),
        CityCardMore(findCategoryBean("火热新书")),
        BookCategorySet(findCategoryBean("分类导航")),
        CityCardMore(findCategoryBean("热门连载")),
        BookSetWidget(findCategoryBean("重推书单")),
        CityCardMore(findCategoryBean("完本精选")),
      ]),
    );
  }

  CityCategoryBean findCategoryBean(String categoryStr) {
    CityCategoryBean firstWhere = datas?.firstWhere(
        (cate) => cate.Category == categoryStr,
        orElse: () => null);
    return firstWhere;
  }



  @override
  bool get wantKeepAlive => true;
}
