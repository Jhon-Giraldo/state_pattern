import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ShapeChangerScreen(),
    );
  }
}

class ShapeChangerScreen extends StatefulWidget {
  const ShapeChangerScreen({super.key});

  @override
  ShapeChangerScreenState createState() => ShapeChangerScreenState();
}

class ShapeChangerScreenState extends State<ShapeChangerScreen> {
  final ShapeContext _context = ShapeContext(SmallRedCircleState());

  void _changeShape() {
    setState(() {
      _context.requestShapeChange();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Pattern Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: _context.getSize(),
              height: _context.getSize(),
              decoration: ShapeDecoration(
                color: _context.getColor(),
                shape: _context.getShape(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeShape,
              child: const Text('Change Shape'),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class ShapeState {
  void handleShapeChange(ShapeContext context);
  Color getColor();
  double getSize();
  ShapeBorder getShape();
}

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
