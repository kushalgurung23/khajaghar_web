import 'package:flutter/material.dart';
import 'package:flutter_web/controllers/menu_controller.dart';
import 'package:flutter_web/controllers/navigation_controller.dart';
import 'package:flutter_web/controllers/order_list_controller.dart';
import 'package:flutter_web/controllers/test_order_list_controller.dart';
import 'package:flutter_web/controllers/product_controller.dart';
import 'package:flutter_web/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//kushal
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MenuController()),
    ChangeNotifierProvider(create: (context) => NavigationController()),
    ChangeNotifierProvider(create: (context) => TestOrderListController()),
    ChangeNotifierProvider(create: (context) => ProductController()),
    ChangeNotifierProvider(create: (context) => OrderListController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.mulishTextTheme(
            Theme.of(context).textTheme.apply(bodyColor: Colors.black)),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primaryColor: Colors.blue,
      ),
      routes: {HomeScreen.id: (context) => const HomeScreen()},
      initialRoute: HomeScreen.id,
    );
  }
}
