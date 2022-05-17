import 'package:flutter/material.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class CMainMap extends StatefulWidget {
  const CMainMap({Key? key}) : super(key: key);

  @override
  State<CMainMap> createState() => _CMainMapState();
}

class _CMainMapState extends State<CMainMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        panel: Center(
          child: Text("This is the sliding Widget"),
        ),
        body: Center(
          child: Text("This is the Widget behind the sliding panel"),
        ),
      )
    );
  }
}
