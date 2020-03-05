import 'package:flutter/material.dart';
import 'package:ly_flutter/model/ticket_model_entity.dart';

class TicketProviderModel with ChangeNotifier {

  List<TicketModelEntity> _TicketList = List();

  List<TicketModelEntity> get ticketList => _TicketList;

  void updateTicketList(List<TicketModelEntity> list) {
    _TicketList = list;
    notifyListeners();
  }

}
