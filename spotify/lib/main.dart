import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spotify/Home/Homepage.dart';
import 'package:spotify/Library/library.dart';
import 'package:spotify/Premium/Premium.dart';
import 'package:spotify/Search/search.dart';
import 'package:spotify/firebase_options.dart';
import 'package:spotify/splashscreen.dart';
import 'package:spotify/utils/Notify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: 'spotify',
        channelName: 'spotify notifications',
        channelDescription: 'notifications for playing/pausing audio',
        importance: NotificationImportance.High,
        channelShowBadge: true)
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Notify notify = Get.put(Notify());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/home': (context) => HomePage(),
          '/search': (context) => Search(),
          '/library': (context) => Library(),
          '/premium': (context) => Premium()
        });
  }
}
