import 'package:flutter/material.dart';

class CTermsOfUse extends StatelessWidget {
  const CTermsOfUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Пользовательское соглашение"
          ),
        ),
      ),
    );
  }
}
