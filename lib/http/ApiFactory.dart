import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ftreader/http/BiResponse.dart';
import 'package:ftreader/model/CityCategory.dart';

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

  Future<List<CityCategory>> bookCityList() async {
    var list =
        await _request("https://appbdsc.cdn.bcebos.com/v6/base/man.html");
    return list
        ?.map((e) =>
            e == null ? null : CityCategory.fromJson(e as Map<String, dynamic>))
        ?.toList();
  }

  Future<List<dynamic>> _request(String url) async {
    Response response = await _dio.get(url);
    debugPrint(response.data.toString());
    if (response.statusCode != 0) {
      BiResponse biResponse =
          BiResponse.map(jsonDecode(response.data.toString()));
      print("1");
      return biResponse.data;
    }
    return null;
  }
}
