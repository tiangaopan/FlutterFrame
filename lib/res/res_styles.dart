import 'package:flutter/material.dart';
import 'package:ly_flutter/res/res_color.dart';
import 'package:ly_flutter/res/res_dimens.dart';

class ResTextStyles {
  static const TextStyle listTitle = TextStyle(
    fontSize: ResDimens.font_sp16,
    color: ResColors.text_dark,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle listContent = TextStyle(
    fontSize: ResDimens.font_sp14,
    color: ResColors.text_normal,
  );
  static const TextStyle listExtra = TextStyle(
    fontSize: ResDimens.font_sp12,
    color: ResColors.text_gray,
  );
  static const TextStyle appTitle = TextStyle(
    fontSize: ResDimens.font_sp18,
    color: ResColors.text_dark,
  );
}

class Decorations {
  static const Decoration bottom = BoxDecoration(
      border: Border(
          bottom: BorderSide(
              width: ResDimens.border_width, color: ResColors.divider)));
}

class _Gaps {
  static Widget hGap3 = new SizedBox(width: ResDimens.gap_dp3);
  static Widget hGap5 = new SizedBox(width: ResDimens.gap_dp5);
  static Widget hGap10 = new SizedBox(width: ResDimens.gap_dp10);
  static Widget hGap15 = new SizedBox(width: ResDimens.gap_dp15);

  static Widget vGap5 = new SizedBox(height: ResDimens.gap_dp5);
  static Widget vGap10 = new SizedBox(height: ResDimens.gap_dp10);
  static Widget vGap15 = new SizedBox(height: ResDimens.gap_dp15);
}
