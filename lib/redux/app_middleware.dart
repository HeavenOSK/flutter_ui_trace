import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_navigator/redux_navigator.dart';

import 'app_state.dart';
import 'middleware/middleware.dart';

List<Middleware<AppState>> appMiddleware({
  @required GlobalKey<NavigatorState> navigatorKey,
}) {
  return [
    LoggingMiddleware<AppState>.printer(),
    ...counterMiddleware(),
    ...navigatorMiddleware(navigatorKey),
  ];
}
