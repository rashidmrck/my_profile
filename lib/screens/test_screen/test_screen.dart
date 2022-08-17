import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  static const String classId = '/TestScreen';
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('TestScreen'),
    );
  }
}
