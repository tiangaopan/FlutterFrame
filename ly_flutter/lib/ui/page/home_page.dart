import 'package:flutter/material.dart';
import 'package:ly_flutter/config/router_config.dart';
import 'package:ly_flutter/model/ticket_model_entity.dart';
import 'package:ly_flutter/provider/model/TicketProviderModel.dart';
import 'package:ly_flutter/provider/provider_manager.dart';
import 'package:ly_flutter/res/res_color.dart';
import 'package:ly_flutter/service/service_repository.dart';
import 'package:ly_flutter/ui/widget/my_behavior.dart';
import 'package:ly_flutter/utils/print_utils.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "门票",
          style: TextStyle(color: ResColors.ff555555, fontSize: 18),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: ResColors.ff555555,
        ),
      ),
      backgroundColor: ResColors.f3f3f3,
      body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ProviderManager.connect<TicketProviderModel>(
              builder: (context, TicketProviderModel snapshot, Widget child) {
            if (snapshot.ticketList.isNotEmpty) {
              return getListView(snapshot.ticketList);
            } else {
              return Center(
                child: Text('正在加载中...'),
              );
            }
          })),
    );
  }

  @override
  void initState() {
    printLong("1111111111111111111网络请求来了");
    _handleRequest(context);
    super.initState();
  }

  Widget getListView(List list) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _cardView(list[index], context);
      },
      itemCount: list != null ? list.length : 0,
    );
  }

  Future _handleRequest(context) async {
    var detailMap = {
      "needSearchCriteria": 1,
      'ps': 40,
      'cityId': 30,
      'keyword': "北京",
      'mainCategoryId': 1,
      'pn': 1
    };

//    var statusMap = {
//      "ids": 555555863,
//      'type': 7,
//      'status': 1,
//    };
//    ServiceRepository.fetchHotelDetail(detailMap).then((data){
//      setState(() {
//        list = data;
//      });
//    });
    return ServiceRepository.fetchHotelDetail(context, detailMap);
  }

  Widget _cardView(TicketModelEntity entity, BuildContext context) {
    return GestureDetector(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
          padding: EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          height: 112,
          child: Row(
            children: <Widget>[
              Container(
                width: 96,
                height: 96,
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage(entity.cover), fit: BoxFit.cover)),
              ),
              Expanded(
                  child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        entity.name,
                        style: TextStyle(
                            color: ResColors.ff555555,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Wrap(
                          runSpacing: 4,
                          children: getLabelListView(entity.tag),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    left: 0.1,
                    bottom: 0.1,
                    child: Text(
                      "已售${entity.sellNum}+",
                      style:
                          TextStyle(fontSize: 12, color: ResColors.cFF808080),
                    ),
                  ),
                  Positioned(
                      right: 0.1,
                      bottom: 0.1,
                      child: Text(
                        "¥${entity.startingPrice / 100}起",
                        style:
                            TextStyle(fontSize: 16, color: ResColors.cffff8B00),
                      )),
                ],
              )),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
        ),
        onTap: () {
          Navigator.pushNamed(context, RouteName.second, arguments: entity);
        });
  }

  List<Widget> getLabelListView(List<TicketModelTag> tag) {
    List<Widget> widgetList = List();
    for (var i = 0; i < tag.length; i++) {
      var container = getLabelView(tag[i]);
      widgetList.add(container);
    }
    return widgetList;
  }

  Widget getLabelView(TicketModelTag tag) {
    var boxDecoration;
    var textColor;
    if (tag.type == 12) {
      boxDecoration = BoxDecoration(
          color: ResColors.c99000000, borderRadius: BorderRadius.circular(4));
      textColor = ResColors.colorWhite;
    } else {
      textColor = ResColors.ff93D7A2;
      boxDecoration = BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: ResColors.ff93D7A2, width: 0.5));
    }
    return Container(
      decoration: boxDecoration,
      margin: EdgeInsets.only(right: 4),
      padding: EdgeInsets.all(4),
      child: Text(
        tag.name,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor, fontSize: 10),
      ),
    );
  }
}
