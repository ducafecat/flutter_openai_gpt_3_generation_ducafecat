import 'package:flutter/material.dart';
import 'package:flutter_openapi_gen_ducafecat/utils/wp_http.dart';

import 'pages/index.dart';

void main() {
  DioHttpUtil().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GenIndexPage(),
    );
  }
}
