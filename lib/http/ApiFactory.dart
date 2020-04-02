import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ftreader/http/BiResponse.dart';
import 'package:ftreader/model/BookCity.dart';
import 'dart:convert';

import 'package:ftreader/model/book_entity.dart';

var api = new ApiFactory();

class ApiFactory {
  ApiFactory._internal() {
    _dio = new Dio();
//    _dio.options.baseUrl = "https://appbdsc.cdn.bcebos.com";
//    _dio.options.connectTimeout = 8000;
//    _dio.options.receiveTimeout = 8000;
  }

  static ApiFactory _singleton = new ApiFactory._internal();

  factory ApiFactory() => _singleton;

  Dio _dio;

  bookCity() async {
    _request("https://appbdsc.cdn.bcebos.com/v6/base/man.html",
        (var list) {
      print("hello list:");
    });
  }

  _request(String url, Function callback) async {
    Response response = await _dio.get(url);
    debugPrint(response.data.toString());
    if (response.statusCode != 0) {
      BiResponse biResponse = BiResponse.map(jsonDecode(response.data.toString()));

      print("1");
      callback(biResponse.data);
    }
  }
}
