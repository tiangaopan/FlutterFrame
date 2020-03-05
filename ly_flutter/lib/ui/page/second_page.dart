import 'package:flutter/material.dart';
import 'package:ly_flutter/model/ticket_model_entity.dart';
import 'package:ly_flutter/res/res_color.dart';
import 'package:ly_flutter/res/res_images.dart';
import 'package:ly_flutter/utils/toast_util.dart';

class SecondPage extends StatefulWidget {
  final TicketModelEntity ticketModelEntity;

  SecondPage(this.ticketModelEntity);

  @override
  State<StatefulWidget> createState() {
    return _SecondState();
  }
}

class _SecondState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "门票Second",
          style: TextStyle(color: ResColors.ff555555, fontSize: 18),
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Image.asset(
            ResImages.wrapAssets('ic_back_black.png'),
            width: 15,
            height: 6,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: ResColors.f3f3f3,
      body: GestureDetector(
        child: Center(
          child: Text(widget.ticketModelEntity.name),
        ),
        onTap: () {
//          ProviderManager.value<TicketProviderModel>(context).updateTicketList([]);
          ToastUtil.showToast(widget.ticketModelEntity.name);
        },
      ),
    );
  }
}
