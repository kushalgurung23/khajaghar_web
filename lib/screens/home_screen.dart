import 'package:flutter/material.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
import 'package:flutter_web/widgets/large_screen.dart';
import 'package:flutter_web/widgets/side_menu.dart';
import 'package:flutter_web/widgets/small_screen.dart';
import 'package:flutter_web/widgets/top_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'order_list';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const SideMenu(),
      body: const ResponsiveWidget(
        smallScreen: SmallScreen(),
        largeScreen: LargeScreen(),
      ),
    );
  }
}
