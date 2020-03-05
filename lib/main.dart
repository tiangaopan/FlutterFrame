import 'package:flutter/material.dart';
import 'package:ly_flutter/config/router_config.dart';
import 'package:ly_flutter/provider/provider_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
//  if (Platform.isAndroid) {
//    SystemUiOverlayStyle systemUiOverlayStyle =
//        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//  }
}

class MyApp extends StatelessWidget {

  MyApp() {
    //初始化路由
    Provider.debugCheckInvalidValueType = null;
  }

  @override
  Widget build(BuildContext context) {
    return ProviderManager.init(
        context: context,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routers.generateRoute,
        ));
  }

}
