import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ly_flutter/config/net/http_client.dart';
import 'package:ly_flutter/utils/print_utils.dart';

//class BaseInterceptor extends Interceptor {
//
//  @override
//  onRequest(RequestOptions options) {
////    options.baseUrl = baseUrl;
//    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
//        ' queryParameters: ${options.queryParameters}' + 'header : ${options.headers.toString()}');
//    return options;
//  }
//
//  @override
//  onError(DioError err) {
//    debugPrint('BaseInterceptor --- onerror --- ' + err.message);
//  }
//
//  @override
//  onResponse(Response response) {
//    printLong('---api-response---data--> ${response.data}');
//    var statusCode = response.statusCode;
//    if (statusCode != 200) {
//      //进入error
//    } else {
//      if (response.data is Map) {
//        BaseResultData respData = BaseResultData.fromJson(response.data);
//        if (respData.success && respData.data is List) {
//          response.data = respData;
//          return http.resolve(response);
//        } else {
//          return handleFailed(respData);
//        }
//      } else {
//        debugPrint('---api-response--->error--not--map---->$response');
//        BaseResultData respData = BaseResultData.fromJson(json.decode(response.data));
//        return handleFailed(respData);
//      }
//    }
//  }
//
//
//
//  Future<Response> handleFailed(BaseResultData respData) {
//    debugPrint('---api-response--->error---->$respData');
//    return http.reject(respData.msg);
//  }
//
//}

class BaseResultData {
  dynamic data;
  int code = 0;
  String msg;
  int total;
  int cost;
  var serverTime;
  dynamic errors;
  dynamic attachments;

  bool get success => 0 == code;

  BaseResultData(this.data, this.code, this.msg, this.total, this.cost,
      this.serverTime, this.errors, this.attachments);

  @override
  String toString() {
    return 'RespData{ code: $code, data: $data, msg: $msg, total: $total, cost: $cost, serverTime: $serverTime, errors: $errors, attachments: $attachments}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['data'] = this.data;
    data['total'] = this.total;
    data['cost'] = this.cost;
    data['serverTime'] = this.serverTime;
    data['errors'] = this.errors;
    data['attachments'] = this.attachments;
    return data;
  }

  BaseResultData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'];
    total = json['total'];
    cost = json['cost'];
    serverTime = json['serverTime'];
    errors = json['errors'];
    attachments = json['attachments'];
  }
}