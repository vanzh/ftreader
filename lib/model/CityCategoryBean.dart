import 'package:json_annotation/json_annotation.dart';
import 'package:ftreader/model/BookCategoryBean.dart';
import 'package:ftreader/model/BookListBean.dart';

import 'BookBean.dart';

part 'CityCategoryBean.g.dart';

/// Category : "火热新书"
/// Books : [{"Id":510915,"Name":"我的帝国无双","Author":"录事参军","Img":"wodediguowushuang.jpg","Desc":"五代十国，唐末宋初，笑谈琵琶，醉卧沙场。\r\n\r\n 天大地大，谁伴我仗剑天涯，谱一曲帝国无双！\r\n\r\n 参军出品，必属精品！","CName":"历史军事","Score":"6.0"}]

@JsonSerializable()
class CityCategoryBean {

	factory CityCategoryBean.fromJson(Map<String, dynamic> json) => _$CityCategoryBeanFromJson(json);
	Map<String, dynamic> toJson( instance) => _$CityCategoryBeanToJson(this);
  String Category;
  List<BookBean> Books;
  List<BookCategoryBean> Categories;
  BookListBean BookList;


  CityCategoryBean(this.Category, this.Books, this.Categories, this.BookList);

  CityCategoryBean.map(dynamic obj) {
    this.Category = obj["Category"];
    this.Books = obj["Books"];
    this.Categories = obj["Categories"];
    this.BookList = obj["BookList"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["Category"] = Category;
    map["Books"] = Books;
    map["Categories"] = Categories;
    map["BookList"] = BookList;
    return map;
  }

  bool isBookList(){
    return BookList!=null;
  }
  bool isCategory(){
    return Categories!=null && Categories.length>0;
  }
  bool isBook(){
    return Books!=null && Books.length>0;
  }

}
