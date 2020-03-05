import 'package:flutter/material.dart';
import 'package:ly_flutter/provider/model/TicketProviderModel.dart';
import 'package:provider/provider.dart';

class ProviderManager {
  static BuildContext context;

  ///  我们将会在main.dart中runAPP实例化init
  static init({context, child}) {
    context = context;
    return MultiProvider(
      providers: [
//        Provider<TicketProviderModel>.value(value: TicketProviderModel())
        ChangeNotifierProvider(builder: (_) => TicketProviderModel()),
      ],
      child: child,
    );
  }

  ///  通过Provider.value<T>(context)获取状态数据
  static T value<T>(context) {
    return Provider.of(context);
  }

  ///  通过Consumer获取状态数据
  static Consumer connect<T>({builder, child}) {
    return Consumer<T>(builder: builder, child: child);
  }


}
