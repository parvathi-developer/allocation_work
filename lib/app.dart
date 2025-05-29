import 'package:allocation_work/main_page.dart';
import 'package:flutter/material.dart';
import 'core/routes/app_router.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MainPage(),
    );
  }
}
