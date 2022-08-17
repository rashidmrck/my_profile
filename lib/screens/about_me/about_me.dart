import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  static const String classId = '/AboutMe';
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('About Me'),
    );
  }
}
