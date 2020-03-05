import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:ly_flutter/config/net/base_result.dart';
import 'package:ly_flutter/config/net/interceptors/header_interceptors.dart';
import 'package:ly_flutter/config/net/interceptors/log_interceptors.dart';
import 'package:ly_flutter/utils/print_utils.dart';

final Http http = Http();

class Http extends Dio {
  static Http instance;

  factory Http() {
    if (instance == null) {
      instance = Http._().._init();
    }
    return instance;
  }

  /// 表示私有化
  Http._();

  /// 初始化 加入app通用处理
  _init() {
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    interceptors
      // 基础设置
      ..add(HeaderInterceptor())
      // JSON处理
      ..add(LogsInterceptors());
    // cookie持久化 异步
    //..add(CookieManager(cookieInfo));
  }

  Future<BaseResultData> netGet(String path,
      {Map<String, dynamic> queryParameters}) async {
    Response response = await http.get(path, queryParameters: queryParameters);
    return _response(response);
  }

  Future<BaseResultData> netPost<T>(String path,
      {Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken}) async {
    Response response = await http.post(path,
        queryParameters: queryParameters, cancelToken: cancelToken);
    return _response(response);
  }

  /// 网络请求过程中出错已在Interceptor中处理 .
  Future<BaseResultData> _response(Response response) {
    var statusCode = response.statusCode;
    if (statusCode == 200 && response.data is Map) {
      BaseResultData respData = BaseResultData.fromJson(response.data);
      response.data = respData;
      return Future.value(response.data);
    } else {
      printLong("statusCode : $statusCode ---> response.data ${response.data}");
    }
  }
}

// 必须是顶层函数
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}
