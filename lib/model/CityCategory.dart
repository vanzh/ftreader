import 'package:json_annotation/json_annotation.dart';
import 'Book.dart';

part 'CityCategory.g.dart';

/// Category : "火热新书"
/// Books : [{"Id":510915,"Name":"我的帝国无双","Author":"录事参军","Img":"wodediguowushuang.jpg","Desc":"五代十国，唐末宋初，笑谈琵琶，醉卧沙场。\r\n\r\n 天大地大，谁伴我仗剑天涯，谱一曲帝国无双！\r\n\r\n 参军出品，必属精品！","CName":"历史军事","Score":"6.0"}]

@JsonSerializable()
class CityCategory {

	factory CityCategory.fromJson(Map<String, dynamic> json) => _$CityCategoryFromJson(json);
	Map<String, dynamic> toJson( instance) => _$CityCategoryToJson(this);
  String Category;
  List<Book> Books;

  CityCategory(this.Category, this.Books);

  CityCategory.map(dynamic obj) {
    this.Category = obj["Category"];
    this.Books = obj["Books"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["Category"] = Category;
    map["Books"] = Books;
    return map;
  }
}
