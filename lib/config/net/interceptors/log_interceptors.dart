import 'package:dio/dio.dart';
import 'package:ly_flutter/utils/print_utils.dart';



bool isDebug = true;
class LogsInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {
    if (isDebug) {
      print("┌────────────────────────Begin Request────────────────────────");
      print("uri = ${options.uri}");
      print("method = ${options.method}");
//      print("请求url：${options.baseUrl}");
//      print("请求path：${options.path}");
      print("query参数：${options.queryParameters}");
      print('headers: ' + options.headers.toString());
      if (options.data != null) {
        printLong('body: ' + options.data.toString());
      }
      print("└————————————————————————End Request——————————————————————————\n\n");
    }
    return options;
  }

  @override
  onResponse(Response response) {
    if (isDebug) {
      if (response != null) {
        print("┌────────────────────────Begin Response————————————————————————");
        print('status ${response.statusCode}');
        printLong('response: ' + response.toString());
        print("└————————————————————————End Response——————————————————————————\n\n");
      }
    }
    return response; // continue
  }

  @override
  onError(DioError err) {
    if (isDebug) {
      print("┌────────────────────────Begin Dio Error————————————————————————");
      print('请求异常: ' + err.toString());
      print('请求异常信息: ' + (err.response?.toString() ?? ""));
      print("└————————————————————————End Dio Error——————————————————————————\n\n");
    }
    return err;
  }


}
