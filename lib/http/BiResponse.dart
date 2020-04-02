import 'package:json_annotation/json_annotation.dart';

/// status : 1
/// info : "success"
/// data : ""

@JsonSerializable()
class BiResponse<T> {
  int _status;
  String _info;
  T _data;

  int get status => _status;

  String get info => _info;

  T get data => _data;

  BiResponse(this._status, this._info, this._data);

  BiResponse.map(dynamic obj) {
    this._status = obj["status"];
    this._info = obj["info"];
    this._data = obj["data"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["status"] = _status;
    map["info"] = _info;
    map["data"] = _data;
    return map;
  }
}
