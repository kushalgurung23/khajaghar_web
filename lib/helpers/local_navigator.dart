import 'package:flutter/cupertino.dart';
import 'package:flutter_web/controllers/navigation_controller.dart';
import 'package:flutter_web/routing/router.dart';
import 'package:flutter_web/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: NavigationController.navigationKey,
      initialRoute: kProductPageRoute,
      onGenerateRoute: generateRoute,
    );
