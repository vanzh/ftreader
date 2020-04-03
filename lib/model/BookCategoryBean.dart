import 'package:json_annotation/json_annotation.dart';

part 'BookCategoryBean.g.dart';
/// CategoryName : "玄幻奇幻"
/// CategoryId : 1

@JsonSerializable()
class BookCategoryBean {

	factory BookCategoryBean.fromJson(Map<String, dynamic> json) => _$BookCategoryBeanFromJson(json);
	Map<String, dynamic> toJson( instance) => _$BookCategoryBeanToJson(this);
  String CategoryName;
  int CategoryId;

  BookCategoryBean(this.CategoryName, this.CategoryId);

  BookCategoryBean.map(dynamic obj) {
    this.CategoryName = obj["CategoryName"];
    this.CategoryId = obj["CategoryId"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["CategoryName"] = CategoryName;
    map["CategoryId"] = CategoryId;
    return map;
  }

}