import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ly_flutter/config/net/http_client.dart';
import 'package:ly_flutter/plugin/appinfo_plugin.dart';

/// 添加常用Header
class HeaderInterceptor extends InterceptorsWrapper {

  @override
  onRequest(RequestOptions options) async {
    if (!options.path.startsWith("http")) {
      if (PluginAppInfo.environment == ""){
        await PluginAppInfo.getEnvironment();
      }
      options.baseUrl = getBaseUrl(PluginAppInfo.environment);
    }
    options.connectTimeout = 1000 * 30;
    options.receiveTimeout = 1000 * 30;
    var headerInfo = await PluginAppInfo.getHeader();
    var cookieInfo = await PluginAppInfo.getCookie();
    options.headers.addAll(headerInfo);
    options.headers['Cookie'] = cookieInfo;
    return options;
  }

  @override
  onError(DioError err) {
    debugPrint(err.toString());
    if (err.response == null) {
      return http.reject(err.message);
    }
    int statusCode = err.response?.statusCode;
    String errorMsg = err.response?.statusMessage;
    switch (statusCode) {
      case -9999:
        errorMsg = '服务器繁忙';
        break;
      case -9997:
        errorMsg = 'code:$statusCode\n未登录';
        break;
      default:
        errorMsg = 'code:$statusCode\n$errorMsg';
        break;
    }
    return http.reject(errorMsg);
  }

  String getBaseUrl(environment) {
    var baseUrl;
    if (environment == "test") {
      baseUrl = 'http://test.m.lvyuetravel.com/';
    } else if (environment == "online") {
      baseUrl = 'https://app.lvyuetravel.com/';
    } else if (environment == "integrate") {
      baseUrl = 'http://integrate.m.lvyuetravel.com/';
    } else {
      baseUrl = 'http://dev.m.lvyuetravel.com/';
    }
    return baseUrl;
  }
}
