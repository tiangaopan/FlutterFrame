import 'package:ly_flutter/model/ticket_model_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "TicketModelEntity") {
      return TicketModelEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}