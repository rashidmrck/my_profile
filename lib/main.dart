import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_profile/const_items.dart';
import 'package:my_profile/providers/navigation_provider.dart';
import 'package:my_profile/providers/theme_provider.dart';
import 'package:my_profile/screens/about_me/about_me.dart';
import 'package:my_profile/screens/resume/resume.dart';
import 'package:my_profile/screens/selected_page.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'package:url_launcher/url_launcher.dart';
import 'package:url_strategy/url_strategy.dart';

import 'model/navigation_item.dart';

void main() {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized(); // Required
  runApp(const MyApp());
}

final Uri _urlGithub = Uri.parse('https://github.com/rashidmrck');
final Uri _urlInsta = Uri.parse('https://www.instagram.com/rashidmrck/');
final Uri _urlTwitter = Uri.parse('https://twitter.com/Rashidmrck');
final Uri _urlLinkdin =
    Uri.parse('https://www.linkedin.com/in/mohammed-rashid-c-k-4812321aa/');

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<NavigationProvider>(
          create: (context) => NavigationProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          title: 'Mohammed Rashid C.K',
          theme: value.themeData,
          home: const MyHomePage(),
          routes: {
            Resume.classId: (context) => const Resume(),
            AboutMe.classId: (context) => const AboutMe(),
          },
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
                  child: SelectableText(
                    'Mohammed Rashid C.K',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
                CircleAvatar(
                  radius: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset('images/profile_pic.jpg'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(
                    defaultPadding,
                  ),
                  child: SelectableText(
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
                      icon: FontAwesomeIcons.linkedin,
                      onPressed: () => _launchUrl(Uri.parse(
                          'https://www.linkedin.com/in/mohammed-rashid-c-k-4812321aa/')),
                    ),
                    SocialIconButton(
                      icon: FontAwesomeIcons.github,
                      onPressed: () => _launchUrl(
                          Uri.parse('https://github.com/rashidmrck')),
                    ),
                    SocialIconButton(
                      icon: FontAwesomeIcons.instagram,
                      onPressed: () => _launchUrl(
                          Uri.parse('https://www.instagram.com/rashidmrck/')),
                    ),
                    SocialIconButton(
                      icon: FontAwesomeIcons.twitter,
                      onPressed: () => _launchUrl(
                          Uri.parse('https://twitter.com/Rashidmrck')),
                    ),
                  ],
                ),
                const Divider(
                  endIndent: 20,
                  indent: 20,
                  color: Colors.white,
                ),
                const HovertextIconButton(
                  icon: Icons.person,
                  title: 'About Me',
                  routeName: NavigationItem.aboutMe,
                ),
                const HovertextIconButton(
                  icon: Icons.insert_drive_file_sharp,
                  title: 'Resume',
                  routeName: NavigationItem.resume,
                ),
                const Divider(
                  endIndent: 20,
                  indent: 20,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(FontAwesomeIcons.circleHalfStroke),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Dark Mode')
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
          // Container(
          //   child: CustomPaint(
          //     painter: FaceOutlinePainter(),
          //   ),
          // ),
          const Expanded(child: SelectedPage())
        ],
      ),
      floatingActionButton: Stack(
        children: [
          ConfettiWidget(
            confettiController: _controllerCenter,
            // blastDirectionality: BlastDirectionality.explosive,
            blastDirection: 180,
            particleDrag: 0.05,
            emissionFrequency: 0.05,
            numberOfParticles: 6,
            gravity: 0.05,
            shouldLoop: true,
            createParticlePath: drawStar,
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple,
              Colors.black,
              Colors.amber,
              Colors.yellow,
              Colors.cyan,
              Colors.red,
              Colors.grey,
            ], // manually specify the colors to be used
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: IconButton(
              icon: const Icon(Icons.celebration),
              onPressed: () {
                _controllerCenter.play();
                Future.delayed(const Duration(seconds: 2), () {
                  _controllerCenter.stop();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HovertextIconButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final NavigationItem? routeName;
  const HovertextIconButton({
    Key? key,
    required this.icon,
    required this.title,
    this.routeName,
  }) : super(key: key);

  @override
  State<HovertextIconButton> createState() => _HovertextIconButtonState();
}

class _HovertextIconButtonState extends State<HovertextIconButton> {
  bool _hoverDetect = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            _hoverDetect = value;
          });
        },
        onTap: () => Provider.of<NavigationProvider>(context, listen: false)
            .setSelectedNavigation(
          widget.routeName!,
        ),
        hoverColor: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: _hoverDetect ? Colors.white : Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: _hoverDetect ? Colors.white : Colors.black,
              ),
            )
          ],
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

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}
