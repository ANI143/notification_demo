import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:push_notiication/notification_service.dart';
import 'package:http/http.dart' as http;

class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  NotificarionServices notificarionServices = NotificarionServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Firebase.initializeApp;
    // notificarionServices.isTokenRefresh();
    notificarionServices.requstNotificationPermission();
    notificarionServices.firebaseInit(context);
    notificarionServices.setupInteractMessage(context);
    notificarionServices.getDeviceToken().then((value) {
      debugPrint("divaice token");
      debugPrint(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Notification"),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              notificarionServices.getDeviceToken().then((value) async {
                var data = {
                  'to': value.toString(),
                  'priority': 'high',
                  'notification': {
                    'title': 'aniruddha',
                    'body': 'Subcribe to my chenal',
                  }
                };

                await http.post(
                    Uri.parse('https://fcm.googleapis.com/fcm/send'),
                    body: jsonEncode(data),
                    headers: {
                      'Content-Type': 'aplication/json; charset=UTF-8',
                      'Authorization':
                          'key=AAAANUPq16U:APA91bF5-4g2L0olwMMVs5YH_sqzs2WI3DDCCZSIdItZRrXRzfElP0449buGIR3CZxsjv7cqmszkAOO2Ib1khxN8z4wm3W7-qwNt34qJyXzct00UQGUI04_42W9x8TnEtyNdcvi-SAPO',
                    });
              });
            },
            child: const Text("Send Notification")),
      ),
    );
  }
}
