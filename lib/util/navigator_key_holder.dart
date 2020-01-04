import 'package:flutter/cupertino.dart';

// ignore: avoid_classes_with_only_static_members
class NavigatorKeyHolder {
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static NavigatorState get navigator => key.currentState;

  static BuildContext get context => navigator.overlay.context;
}
