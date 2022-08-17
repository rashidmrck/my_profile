import 'package:flutter/foundation.dart';

import '../model/navigation_item.dart';

class NavigationProvider with ChangeNotifier {
  NavigationItem _selectedItem = NavigationItem.resume;

  NavigationItem get selectedItem => _selectedItem;

  void setSelectedNavigation(NavigationItem selectedItem) {
    _selectedItem = selectedItem;
    notifyListeners();
  }
}
