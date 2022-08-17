import 'package:flutter/material.dart';
import 'package:my_profile/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class Resume extends StatelessWidget {
  static const String classId = '/resume';
  const Resume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Mohammed Rashid CK',
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: Provider.of<ThemeProvider>(context).selectedTheme
                          ? Colors.white
                          : Colors.blue.shade900,
                      fontSize: 25,
                    ),
                  ),
                  Text('Senior Software Engineer')
                ],
              ),
              Column(
                children: [],
              ),
            ],
          ),
          Text('Resume'),
        ],
      ),
    );
  }
}
