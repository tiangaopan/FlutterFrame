
import 'package:flutter/material.dart';
import 'package:ly_flutter/config/net/http_client.dart';
import 'package:ly_flutter/constant/common_constant.dart';
import 'package:ly_flutter/constant/common_url.dart';
import 'package:ly_flutter/model/ticket_model_entity.dart';
import 'package:ly_flutter/provider/model/TicketProviderModel.dart';
import 'package:ly_flutter/provider/provider_manager.dart';
import 'package:ly_flutter/utils/print_utils.dart';

class ServiceRepository {
  static Future fetchHotelDetail(BuildContext context, Map detailMap) async {
    var response = await http.netPost(ConstantUrl.TICKET_URL,
        queryParameters: detailMap);
    if (response.code == Constant.status_success) {
      List<TicketModelEntity> list = response.data.map<TicketModelEntity>((item)=>TicketModelEntity.fromJson(item)).toList();
      ProviderManager.value<TicketProviderModel>(context).updateTicketList(list);
      printLong("list ----> " + list[0].name);
    } else {
      printLong(response.msg) ;
    }
  }

  //api/travel/store.json
  static Future updateCollect(Map detailMap) async {
    var response = await http.post(ConstantUrl.STORE_URL,
        queryParameters: detailMap);
    if (response.data.code == Constant.status_success) {
      //return response.data.data.map<TicketModelEntity>((item)=>TicketModelEntity.fromJson(item)).toList();
    } else {
      return Future.error(response.data.msg);
    }
  }
}
