import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/pages.dart';
import 'router.dart';
import 'theme.dart';
import 'util/util.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    const title = 'bootstrap';
    return MaterialApp(
      theme: buildTheme(),
      title: title,
      home: HomePage.withDependencies(context),
      navigatorKey: NavigatorKeyHolder.key,
      onGenerateRoute: Provider.of<Router>(context).onGenerateRoute,
    );
  }
}
