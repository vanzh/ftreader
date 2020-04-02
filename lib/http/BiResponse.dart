/// status : 1
/// info : "success"
/// data : ""

class BiResponse<T> {
  int status;
  String info;
  T data;

  BiResponse.map(dynamic obj) {
    this.status = obj["status"];
    this.info = obj["info"];
    this.data = obj["data"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["status"] = status;
    map["info"] = info;
    map["data"] = data;
    return map;
  }
}
