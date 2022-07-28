import 'package:flutter/material.dart';
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
          title: 'Theme Manager Demo',
          theme: value.themeData,
          home: MyHomePage(),
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
          Container(
            width: 300,
            height: double.infinity,
            color: Colors.grey,
            child: ListView(
              children: [
                Text('Mohammed Rashid C.K')
                // Container(
                //   child: Ci,
                // )
              ],
            ),
          ),
          TextButton(
            onPressed: () => Provider.of<ThemeProvider>(context, listen: false)
                .changeThemeData(),
            child: Text('dark'),
          ),
        ],
      ),
    );
  }
}
