import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'dart:math' as math;

class Responsive {
  final height;
  final width;
  final inch;

  Responsive({@required this.height, @required this.width, @required this.inch});

  factory Responsive.of(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final size = data.size;
    //Pitagoras
    // c2 = a2+b2 => c = sqrt(a2+b2)
    final inch = math.sqrt(math.pow(size.width, 2) + math.pow(size.height, 2));
    return Responsive(height: size.height, width: size.width, inch: inch);
  }

  double widthPercent(double percent) {
    return this.width * percent / 100;
  }

  double heightPercent(double percent) {
    return this.height * percent / 100;
  }

  double inchPercent(double percent) {
    return this.inch * percent / 100;
  }

  //implemtent for text Size
  /*
  final Responsive responsive = Responsive.of(context);
  responsive.inchPercent(2.5);
  */
}