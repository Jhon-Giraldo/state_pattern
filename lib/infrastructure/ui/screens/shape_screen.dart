import 'package:flutter/material.dart';

import '../../../domain/shape_context.dart';
import '../../../domain/shape_states.dart';

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
