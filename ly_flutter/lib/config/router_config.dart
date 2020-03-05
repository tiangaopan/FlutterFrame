import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ly_flutter/model/ticket_model_entity.dart';
import 'package:ly_flutter/ui/page/home_page.dart';
import 'package:ly_flutter/ui/page/second_page.dart';
import 'package:ly_flutter/ui/widget/page_route_anim.dart';

class RouteName {
  static const String home = 'home';
  static const String second = 'second';
}

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return NoAnimRouteBuilder(HomePage());
      case RouteName.second:
        var model = settings.arguments as TicketModelEntity;
                return CupertinoPageRoute(
            builder: (_) => SecondPage(model));
//        return SizeRoute(SecondPage(model));
//        return SlideTopRouteBuilder(SecondPage(model));
//        return FadeRouteBuilder(SecondPage(model));

      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

//Navigator.of(context).pushNamed(RouteName.home, arguments: TicketModelEntity);

// Navigator.of(context).pushNamed(RouteName.structureList, arguments: [tree, index]);

//var list = settings.arguments as List;
//Tree tree = list[0] as Tree;
//int index = list[1];

/// Pop路由
class PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
