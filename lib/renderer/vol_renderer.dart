import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:k_chart/formatter.dart';

import '../entity/volume_entity.dart';
import '../renderer/base_chart_renderer.dart';
import 'base_chart_renderer.dart';

class VolRenderer extends BaseChartRenderer<VolumeEntity> {
  double mVolWidth = ChartStyle.volWidth;

  /// Used to draw a shortened int in the right text
  /// like 100K instead of 100,000
  final Formatter shortFormatter;
  final String wordVolume;

  //
  Paint _volumeBadgeBackgroundPaint = Paint()
    ..isAntiAlias = true
    ..filterQuality = FilterQuality.high
    ..style = PaintingStyle.fill
    ..color = Colors.white10;

  VolRenderer(
    Rect mainRect,
    double maxValue,
    double minValue,
    double topPadding,
    int fixedLength, {
    @required this.shortFormatter,
    @required this.wordVolume,
    String fontFamily,
  }) : super(
          chartRect: mainRect,
          maxValue: maxValue,
          minValue: minValue,
          topPadding: topPadding,
          fixedLength: fixedLength,
          fontFamily: fontFamily,
        );

  @override
  void drawChart(
    VolumeEntity lastPoint,
    VolumeEntity curPoint,
    double lastX,
    double curX,
    Size size,
    Canvas canvas,
  ) {
    double r = mVolWidth / 2;
    double top = getVolY(curPoint.vol);
    double bottom = chartRect.bottom;
    if (curPoint.vol != 0) {
      canvas.drawRect(
          Rect.fromLTRB(curX - r, top, curX + r, bottom),
          chartPaint
            ..color = curPoint.close > curPoint.open
                ? ChartColors.upColor
                : ChartColors.dnColor);
    }

    if (lastPoint.MA5Volume != 0) {
      drawLine(lastPoint.MA5Volume, curPoint.MA5Volume, canvas, lastX, curX,
          ChartColors.ma5Color);
    }

    if (lastPoint.MA10Volume != 0) {
      drawLine(lastPoint.MA10Volume, curPoint.MA10Volume, canvas, lastX, curX,
          ChartColors.ma10Color);
    }
  }

  double getVolY(double value) =>
      (maxValue - value) * (chartRect.height / maxValue) + chartRect.top;

  @override
  void drawText(Canvas canvas, VolumeEntity data, double x) {
    /*TextSpan span = TextSpan(
      children: [
        TextSpan(
            text: "VOL:${NumberUtil.format(data.vol)}    ",
            style: getTextStyle(ChartColors.volColor)),
        if (NumberUtil.checkNotNullOrZero(data.MA5Volume))
          TextSpan(
              text: "MA5:${NumberUtil.format(data.MA5Volume)}    ",
              style: getTextStyle(ChartColors.ma5Color)),
        if (NumberUtil.checkNotNullOrZero(data.MA10Volume))
          TextSpan(
              text: "MA10:${NumberUtil.format(data.MA10Volume)}    ",
              style: getTextStyle(ChartColors.ma10Color)),
      ],
    );
    TextPainter tp = TextPainter(text: span, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, Offset(x, chartRect.top - topPadding));
    */

    TextSpan span = TextSpan(
      text: wordVolume,
      style: TextStyle(
        fontSize: 10.0,
        color: Colors.white.withOpacity(0.5),
        fontWeight: FontWeight.bold,
      ),
    );
    TextPainter tp = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
    );
    tp.layout();

    final yLinePlusPadding =
        chartRect.top - topPadding + rightTextAxisLinePadding;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          x - 2,
          yLinePlusPadding,
          x - 2 + tp.width + 12,
          yLinePlusPadding + tp.height + 8,
        ),
        Radius.circular(3.0),
      ),
      _volumeBadgeBackgroundPaint,
    );

    tp.paint(
      canvas,
      Offset(
        x - 2 + 6,
        yLinePlusPadding + 4,
      ),
    );
  }

  @override
  void drawRightText(canvas, textStyle, int gridRows) {
    TextSpan span = TextSpan(
      text: shortFormatter != null
          ? shortFormatter(maxValue.toInt())
          : ChartFormats.numberShort.format(maxValue),
      style: textStyle,
    );
    TextPainter tp = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(
      canvas,
      Offset(
        chartRect.width - tp.width - rightTextScreenSidePadding,
        chartRect.top - topPadding + rightTextAxisLinePadding,
      ),
    );
  }

  @override
  void drawGrid(Canvas canvas, int gridRows, int gridColumns) {
    canvas.drawLine(Offset(0, chartRect.bottom),
        Offset(chartRect.width, chartRect.bottom), gridPaint);
    double columnSpace = chartRect.width / gridColumns;
    for (int i = 0; i <= columnSpace; i++) {
      //vol垂直线
      canvas.drawLine(Offset(columnSpace * i, chartRect.top - topPadding),
          Offset(columnSpace * i, chartRect.bottom), gridPaint);
    }
  }
}
