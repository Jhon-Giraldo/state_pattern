import 'package:flutter/material.dart';

import '../infrastructure/repository/shape_state_repository.dart';

class ShapeContext {
  ShapeState _state;

  ShapeContext(this._state);

  void setState(ShapeState state) {
    _state = state;
  }

  void requestShapeChange() {
    _state.handleShapeChange(this);
  }

  Color getColor() {
    return _state.getColor();
  }

  double getSize() {
    return _state.getSize();
  }

  ShapeBorder getShape() {
    return _state.getShape();
  }
}
