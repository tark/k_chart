import 'package:flutter/material.dart' show Color, Colors;
import 'package:intl/intl.dart';

class ChartColors {
  ChartColors._();

  static const Color kLineColor = Color(0xff4C86CD);
  static const Color lineFillColor = Colors.white54;
  static const Color ma5Color = Color(0xb2007AFF);
  static const Color ma10Color = Color(0xb2ffffff);
  static const Color ma20Color = Color(0xb2F7931A);
  static const Color upColor = Color(0xFF00B865);
  static const Color dnColor = Color(0xFFFF5D52);
  static const Color upColorDark = Color(0xFF009F4C);
  static const Color dnColorDark = Color(0xFFE64439);
  static const Color volColor = Colors.white54;

  static const Color macdColor = Color(0xff4729AE);
  static const Color difColor = Color(0xffC9B885);
  static const Color deaColor = Color(0xff6CB0A6);

  static const Color kColor = Color(0xffC9B885);
  static const Color dColor = Color(0xff6CB0A6);
  static const Color jColor = Color(0xff9979C6);
  static const Color rsiColor = Color(0xffC9B885);

  static const Color defaultTextColor = Colors.white54;

  // Depth color
  static const Color depthBuyColor = Color(0xFF00B865);
  static const Color depthSellColor = Color(0xFFFF5D52);
  // Display the value border color after selection
  static const Color selectBorderColor = Colors.white12;
  // The fill color of the background of the displayed value after selection
  static const Color selectFillColor = Color(0xFF1a193a);

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
}

class ChartFormats {
  static final money = NumberFormat('#,##0.00');
  static final moneyShort = NumberFormat('\$#,##0');
  static final numberShort = NumberFormat('#,##0');
  static final date = DateFormat('dd MMM yyyy');
}
