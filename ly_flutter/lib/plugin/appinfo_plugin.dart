import 'package:flutter/services.dart';

class PluginAppInfo {

  static String environment = "";

  //获取到插件与原生的交互通道
  static const appInfoPlugin =
      const MethodChannel('com.lvyuetravel.huazhu.client/appInfoPlugin');

  static Future getEnvironment() async {
    var result = await appInfoPlugin.invokeMethod('ENVIRONMENT_INFO');
    environment = result;
    print(result);
  }

  static Future<String> getCookie() async {
    var cookiesMap = await appInfoPlugin.invokeMapMethod<String, String>('COOKIE_JAR');
    print(cookiesMap);
    String cookieResult = "";
    cookiesMap.forEach((key, value){
      cookieResult = cookieResult + key + "=" + value + "; ";
    });
    return cookieResult;
  }

  static Future<Map<String, dynamic>> getHeader() async {
    var headInfo = await appInfoPlugin.invokeMapMethod<String, dynamic>('HEADER_INFO');
    print(headInfo);
    return headInfo;
  }
}
