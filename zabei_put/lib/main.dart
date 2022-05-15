import 'package:flutter/material.dart';

import 'ui/CPasswordRecovery.dart';
import 'ui/СAuthorization.dart';
import 'ui/CRegistration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'registration',
      routes: {
        'registration': (context) => const CRegistration(),
        'authorization': (context) => const CAuthorization(),
        'password_recovery': (context) => const CPasswordRecovery(),
      },
      home: const CAuthorization(),
    );
  }
}
