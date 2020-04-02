import 'package:json_annotation/json_annotation.dart';
/// Id : 510915

part 'Book.g.dart';
/// Name : "我的帝国无双"
/// Author : "录事参军"
/// Img : "wodediguowushuang.jpg"
/// Desc : "五代十国，唐末宋初，笑谈琵琶，醉卧沙场。\r\n\r\n 天大地大，谁伴我仗剑天涯，谱一曲帝国无双！\r\n\r\n 参军出品，必属精品！"
/// CName : "历史军事"
/// Score : "6.0"

@JsonSerializable()
class Book {

	factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
	Map<String, dynamic> toJson( instance) => _$BookToJson(this);
  int Id;
  String Name;
  String Author;
  String Img;
  String Desc;
  String CName;
  String Score;

  Book(this.Id, this.Name, this.Author, this.Img, this.Desc, this.CName,
      this.Score);

  Book.map(dynamic obj) {
    this.Id = obj["Id"];
    this.Name = obj["Name"];
    this.Author = obj["Author"];
    this.Img = obj["Img"];
    this.Desc = obj["Desc"];
    this.CName = obj["CName"];
    this.Score = obj["Score"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["Id"] = Id;
    map["Name"] = Name;
    map["Author"] = Author;
    map["Img"] = Img;
    map["Desc"] = Desc;
    map["CName"] = CName;
    map["Score"] = Score;
    return map;
  }
}
