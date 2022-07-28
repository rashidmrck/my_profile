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
                    "Hi, my name is Simon Doe and I'm a senior software engineer. Welcome to my personal website!",
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
                )
              ],
            ),
          ),
        ],
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
