mixin CandleEntity {
  double open;
  double high;
  double low;
  double close;

  // MA
  List<double> maValueList;

  // BOLL (upper, middle and bottom lines) and some bollMa parameter
  double up;
  double mb;
  double dn;
  double bollMa;
}
