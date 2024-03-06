import 'package:flutter/material.dart';
import 'package:for_provider/logic/providers/plus_provider.dart';
import 'package:for_provider/ui/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'logic/providers/loading_provider.dart';
///provider
///likes: 9562
///pub points: 140
///popularity: 100
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoadingProvider()),
          ChangeNotifierProvider(create: (_) => PlusProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.teal,
              appBarTheme: const AppBarTheme(centerTitle: true)),
          home: const SplashScreen(),
        ));
  }
}
