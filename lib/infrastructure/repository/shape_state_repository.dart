import 'package:flutter/material.dart';

import '../../domain/shape_context.dart';

abstract class ShapeState {
  void handleShapeChange(ShapeContext context);
  Color getColor();
  double getSize();
  ShapeBorder getShape();
}
