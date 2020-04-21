import 'package:flutter/cupertino.dart';
import 'package:ftreader/http/BaseImg.dart';
import 'package:ftreader/model/BookBean.dart';

import '../res.dart';

class PageBookWidget extends StatelessWidget {
  final List<BookBean> books;
  final int OnePageColumn = 3;

  PageBookWidget(this.books);

  @override
  Widget build(BuildContext context) {
    if(books==null || books.length <=0){
      return Text("无数据");
    }
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding:  EdgeInsets.all(20.0),
      children: <Widget>[
         Text('I\'m dedicating every day to you'),
         Text('Domestic life was never quite my style'),
         Text('When you smile, you knock me out, I fall apart'),
         Text('And I thought I was so smart'),
      ],
    );
//    return ListView(
//      scrollDirection: Axis.horizontal,
//      padding: const EdgeInsets.all(8),
//      children: getListItems(),
//      shrinkWrap: true,
//    );
  }

  List<Widget> getListItems() {
    List<Widget> items = List();
    for (int i = 0; i < books.length; i += OnePageColumn) {
      items.add(onePageWidget(books.sublist(i,i+OnePageColumn)));
    }
    return items;
  }

  Widget onePageWidget(List<BookBean> pageSubItems) {
    List<Widget> subItems = List();
    pageSubItems.forEach((it)=>{
      subItems.add(getOneSimpleBookLayout(it))
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: subItems,
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
        ],
      ),
    );
  }

  void onClick(BookBean bookBean) {
    print("onClick:" + bookBean.Name);
  }
}
