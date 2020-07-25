import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klearcard/ui/views/root/root_view.dart';
import 'package:klearcard/utils/themes.dart';

void main() {
  runApp(KlearCardApp());
}

class PlatformConfiguration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: Colors.white,
//      statusBarIconBrightness: Brightness.dark,
//    ));
    return KlearCardApp();
  }
}

class KlearCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: RootView(),
    );
  }
}
