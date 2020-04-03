import 'package:json_annotation/json_annotation.dart';
/// ImgUrl : "https://imgapi.jiaston.com/shudan/images/36047.jpg"

part 'BookListBean.g.dart';
/// ListId : 36047
/// Title : "奇葩主角的上下五千年"
/// Description : "唐尧虞舜夏商周，春秋战国…今天穿越哪个朝代呢？好难选啊！"

@JsonSerializable()
class BookListBean {

	factory BookListBean.fromJson(Map<String, dynamic> json) => _$BookListBeanFromJson(json);
	Map<String, dynamic> toJson( instance) => _$BookListBeanToJson(this);
  String ImgUrl;
  int ListId;
  String Title;
  String Description;

  BookListBean(this.ImgUrl, this.ListId, this.Title, this.Description);

  BookListBean.map(dynamic obj) {
    this.ImgUrl = obj["ImgUrl"];
    this.ListId = obj["ListId"];
    this.Title = obj["Title"];
    this.Description = obj["Description"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["ImgUrl"] = ImgUrl;
    map["ListId"] = ListId;
    map["Title"] = Title;
    map["Description"] = Description;
    return map;
  }

}