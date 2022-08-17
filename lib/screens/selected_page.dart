import 'package:flutter/material.dart';
import 'package:my_profile/screens/about_me/about_me.dart';
import 'package:my_profile/screens/resume/resume.dart';
import 'package:my_profile/screens/test_screen/test_screen.dart';
import 'package:provider/provider.dart';

import '../model/navigation_item.dart';
import '../providers/navigation_provider.dart';

class SelectedPage extends StatefulWidget {
  const SelectedPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectedPage> createState() => _SelectedPageState();
}

class _SelectedPageState extends State<SelectedPage> {
  @override
  Widget build(BuildContext context) {
    return _selectedPage();
  }

  Widget _selectedPage() {
    NavigationItem currentPage =
        Provider.of<NavigationProvider>(context).selectedItem;
    Widget selectedPage = const TestScreen();
    switch (currentPage) {
      case NavigationItem.test:
        selectedPage = const TestScreen();
        break;
      case NavigationItem.resume:
        selectedPage = const Resume();
        break;
      case NavigationItem.aboutMe:
        selectedPage = const AboutMe();
        break;
      default:
        selectedPage = const TestScreen();
    }
    return selectedPage;
  }
}
