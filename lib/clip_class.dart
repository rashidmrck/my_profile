import 'package:flutter/material.dart';

class FaceOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint _paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    Path path = drawStar(size);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(FaceOutlinePainter oldDelegate) => false;
}

Path drawStar(Size size) {
  // Method to convert degree to radians
  final path = Path();
  path.moveTo(0, 0);
  path.lineTo(5, 0);
  path.lineTo(5, -15);
  path.lineTo(10, 0);
  path.lineTo(15, -15);
  path.lineTo(15, 0);
  path.lineTo(20, 0);
  path.lineTo(20, -30);
  path.lineTo(10, -20);
  path.lineTo(0, -30);
  path.lineTo(0, 0);
  path.close();

  path.moveTo(25, 0);
  path.lineTo(25, -15);
  path.lineTo(35, -15);
  path.lineTo(35, -10);
  path.lineTo(30, -10);
  path.lineTo(30, 0);
  path.lineTo(30, 0);
  path.close();

  path.moveTo(40, 0);
  path.lineTo(60, 0);
  path.lineTo(60, -5);
  path.lineTo(45, -5);
  path.lineTo(45, -25);
  path.lineTo(60, -25);
  path.lineTo(60, -30);
  path.lineTo(40, -30);
  path.lineTo(40, 0);
  path.close();

  path.moveTo(65, 0);
  path.lineTo(65, -30);
  path.lineTo(70, -30);
  path.lineTo(70, 0);
  path.close();

  path.moveTo(80, 0);
  path.lineTo(85, 0);
  path.lineTo(75, -15);
  path.lineTo(70, -15);
  path.close();
  path.moveTo(70, -15);
  path.lineTo(80, -30);
  path.lineTo(85, -30);
  path.lineTo(75, -15);
  return path;
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(size.width * 0.0335000, size.height);
    path0.lineTo(size.width * 0.0333333, size.height * 0.7000000);
    path0.lineTo(size.width * 0.0666667, size.height * 0.8000000);
    path0.lineTo(size.width * 0.1000000, size.height * 0.8000000);
    path0.lineTo(size.width * 0.1333333, size.height * 0.7000000);
    path0.lineTo(size.width * 0.1333333, size.height);
    path0.lineTo(size.width * 0.1666667, size.height);
    path0.lineTo(size.width * 0.1666667, size.height * 0.5000000);
    path0.lineTo(size.width * 0.0833333, size.height * 0.6900000);
    path0.lineTo(0, size.height * 0.5000000);
    path0.lineTo(0, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
