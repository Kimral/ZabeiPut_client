import 'package:flutter/material.dart';

import 'ui/CMainMap.dart';
import 'ui/CPasswordRecovery.dart';
import 'ui/–°Authorization.dart';
import 'ui/CRegistration.dart';
import 'ui/CTermsOfUse.dart';
import 'ui/CPhotoView.dart';

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
      initialRoute: 'authorization',
      routes: {
        'registration': (context) => const CRegistration(),
        'authorization': (context) => const CAuthorization(),
        'password_recovery': (context) => const CPasswordRecovery(),
        'terms_of_use': (context) => const CTermsOfUse(),
        'main_map': (context) => CMainMap(),
        'photo_view' : (context) => const CPhotoViewPage(),
      },
      home: const CAuthorization(),
    );
  }
}
