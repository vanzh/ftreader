import 'package:flutter/widgets.dart';
import 'package:ftreader/http/ApiFactory.dart';
import 'package:ftreader/model/CityCategoryBean.dart';
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
        CityCardMore(datas[0]),
        CityCardMore(datas[1]),
        CityCardMore(datas[2]),
        CityCardMore(datas[3]),
        CityCardMore(datas[4]),
        CityCardMore(datas[5])
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
