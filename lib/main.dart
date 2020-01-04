import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import 'app.dart';
import 'redux/redux.dart';
import 'router.dart';
import 'util/util.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => Store<AppState>(
            appReducer,
            initialState: AppState.initialize(),
            middleware: appMiddleware(navigatorKey: NavigatorKeyHolder.key),
          ),
        ),
        Provider(
          create: (context) => Router(),
        )
      ],
      child: const App(),
    ),
  );
}
