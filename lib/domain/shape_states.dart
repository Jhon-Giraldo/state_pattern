import 'package:flutter/material.dart';

import '../infrastructure/repository/shape_state_repository.dart';
import 'shape_context.dart';

class SmallRedCircleState implements ShapeState {
  @override
  void handleShapeChange(ShapeContext context) {
    context.setState(MediumYellowSquareState());
  }

  @override
  Color getColor() {
    return Colors.red;
  }

  @override
  double getSize() {
    return 50.0;
  }

  @override
  ShapeBorder getShape() {
    return const CircleBorder();
  }
}

class MediumYellowSquareState implements ShapeState {
  @override
  void handleShapeChange(ShapeContext context) {
    context.setState(LargeGreenRectangleState());
  }

  @override
  Color getColor() {
    return Colors.yellow;
  }

  @override
  double getSize() {
    return 100.0;
  }

  @override
  ShapeBorder getShape() {
    return const RoundedRectangleBorder();
  }
}

class LargeGreenRectangleState implements ShapeState {
  @override
  void handleShapeChange(ShapeContext context) {
    context.setState(SmallRedCircleState());
  }

  @override
  Color getColor() {
    return Colors.green;
  }

  @override
  double getSize() {
    return 150.0;
  }

  @override
  ShapeBorder getShape() {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));
  }
}
