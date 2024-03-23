import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notiication/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyDo-c1-gcTv3R1D-4gprD28tlNKHm8prFo",
      appId: "1:228772730789:android:cd4d0378194713e1e0ba4c",
      messagingSenderId: "228772730789",
    
      projectId: "flutter-notification-d574d",
    ),
  );
  FirebaseMessaging.onBackgroundMessage(_firbaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firbaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    // // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyDo-c1-gcTv3R1D-4gprD28tlNKHm8prFo",
      appId: "1:228772730789:android:cd4d0378194713e1e0ba4c",
      messagingSenderId: "228772730789",
      projectId: "flutter-notification-d574d",
    ),
  );

  print(message.notification!.title.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeSceen(),
    );
  }
}
