import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_profile/const_items.dart';
import 'package:my_profile/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Required
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          title: 'Mohammed Rashid C.K',
          theme: value.themeData,
          home: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Ink(
            width: 320,
            height: double.infinity,
            color: Colors.grey,
            child: ListView(
              children: [
                const Center(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: defaultPadding + 10),
                  child: Text(
                    'Mohammed Rashid C.K',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
                const CircleAvatar(
                  radius: 90,
                ),
                const Padding(
                  padding: EdgeInsets.all(
                    defaultPadding,
                  ),
                  child: Text(
                    "Hi, my name is Mohammed Rashid and I'm a experianced software Developer. Welcome to my personal website!",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SocialIconButton(
                      icon: FontAwesomeIcons.twitter,
                      onPressed: () {},
                    ),
                    SocialIconButton(
                      icon: FontAwesomeIcons.linkedin,
                      onPressed: () {},
                    ),
                    SocialIconButton(
                      icon: FontAwesomeIcons.github,
                      onPressed: () {},
                    ),
                    SocialIconButton(
                      icon: FontAwesomeIcons.twitter,
                      onPressed: () {},
                    ),
                    SocialIconButton(
                      icon: FontAwesomeIcons.twitter,
                      onPressed: () {},
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.circleHalfStroke),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Dark Mode')
                  ],
                ),
                Switch(
                  value: Provider.of<ThemeProvider>(context).selectedTheme,
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changeThemeData();
                  },
                ),
              ],
            ),
          ),
          Container(
            child: CustomPaint(
              painter: FaceOutlinePainter(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controllerCenter.play();
          Future.delayed(Duration(seconds: 2), () {
            _controllerCenter.stop();
          });
        },
        child: ConfettiWidget(
          confettiController: _controllerCenter,
          blastDirectionality: BlastDirectionality.explosive,
          particleDrag: 0.05,
          emissionFrequency: 0.05,
          numberOfParticles: 10,
          gravity: 0.05,
          shouldLoop: true,
          createParticlePath: drawStar,
          colors: const [
            Colors.green,
            Colors.blue,
            Colors.pink,
            Colors.orange,
            Colors.purple
          ], // manually specify the colors to be used
        ),
      ),
    );
  }
}

class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const SocialIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(22),
        child: Ink(
          height: 44,
          width: 44,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: defaultPadding + 5,
          ),
        ),
      ),
    );
  }
}

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
