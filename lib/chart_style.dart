import 'package:flutter/material.dart' show Color, Colors;
import 'package:intl/intl.dart';

class ChartColors {
  ChartColors._();

  static const Color kLineColor = Color(0xff4C86CD);
  static const Color lineFillColor = Colors.white54;
  static const Color ma5Color = Color(0xFF2979ff);
  static const Color ma10Color = Color(0xFFffffff);
  static const Color ma20Color = Color(0xFFffea00);
  static const Color ma5ColorOpacity70 = Color(0xBF007AFF);
  static const Color ma10ColorOpacity70 = Color(0xBFffffff);
  static const Color ma20ColorOpacity70 = Color(0xBFffea00);
  static const Color bollUp = Color(0xFF2979FF);
  static const Color bollMiddle = Color(0xFFff1744);
  static const Color bollDown = Color(0xFF2979FF);
  static const Color bollBackground = Color(0x222979FF);
  static const Color upColor = Color(0xFF00B865);
  static const Color dnColor = Color(0xFFFF5D52);
  static const Color upColorDark = Color(0xFF009F4C);
  static const Color dnColorDark = Color(0xFFE64439);
  static const Color volColor = Colors.white54;

  static const Color macdColor = Color(0xffb388ff);
  static const Color difColor = Color(0xffffea00);
  static const Color deaColor = Color(0xff18ffff);
  static const Color macdColorOpacity70 = Color(0xBFb388ff);
  static const Color difColorOpacity70 = Color(0xBFffea00);
  static const Color deaColorOpacity70 = Color(0xBF18ffff);

  static const Color kColor = Color(0xffffea00);
  static const Color dColor = Color(0xff18ffff);
  static const Color jColor = Color(0xffb388ff);
  static const Color rsiColor = Color(0xffffea00);
  static const Color kColorOpacity70 = Color(0xBFffea00);
  static const Color dColorOpacity70 = Color(0xBF18ffff);
  static const Color jColorOpacity70 = Color(0xBFb388ff);
  static const Color rsiColorOpacity70 = Color(0xBFffea00);

  static const Color defaultTextColor = Colors.white54;

  // Depth color
  static const Color depthBuyColor = Color(0xFF00B865);
  static const Color depthSellColor = Color(0xFFFF5D52);
  // Display the value border color after selection
  static const Color selectBorderColor = Colors.white12;
  // The fill color of the background of the displayed value after selection
  static const Color selectFillColor = Color(0xFF1a193a);

  static const background = Color(0xff18191d);

  static Color getMAColor(int index) {
    Color maColor = ma5Color;
    switch (index % 3) {
      case 0:
        maColor = ma5Color;
        break;
      case 1:
        maColor = ma10Color;
        break;
      case 2:
        maColor = ma20Color;
        break;
    }
    return maColor;
  }
}

class ChartStyle {
  ChartStyle._();

  //点与点的距离
  static const double pointWidth = 11.0;

  //蜡烛宽度
  static const double candleWidth = 6.0;

  //蜡烛中间线的宽度
  static const double candleLineWidth = 1.0;

  //vol柱子宽度
  static const double volWidth = 6.0;

  //macd柱子宽度
  static const double macdWidth = 3.0;

  //垂直交叉线宽度
  static const double vCrossWidth = 0.5;

  //水平交叉线宽度
  static const double hCrossWidth = 0.5;

  static const fontSize = 10.0;
}

class ChartFormats {
  static final numberShort = NumberFormat('#,##0');
  static final date = DateFormat('dd MMM yyyy');
  static final dateWithTime = DateFormat('dd MMM yy  hh:mm');

  static final money = [
    NumberFormat('#,##0'),
    NumberFormat('#,##0.0'),
    NumberFormat('#,##0.00'),
    NumberFormat('#,##0.000'),
    NumberFormat('#,##0.0000'),
    NumberFormat('#,##0.00000'),
    NumberFormat('#,##0.000000'),
    NumberFormat('#,##0.0000000'),
    NumberFormat('#,##0.00000000'),
    NumberFormat('#,##0.000000000'),
    NumberFormat('#,##0.0000000000'),
  ];

}
