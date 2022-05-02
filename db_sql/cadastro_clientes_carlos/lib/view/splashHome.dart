import 'dart:ffi';

import 'package:flutter/material.dart';

class SplashHome extends StatefulWidget {
  const SplashHome({Key? key}) : super(key: key);

  @override
  State<SplashHome> createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  static const Color corappbar = Color(0xff4f1567);
  static const Color corfundo = Color(0xffeeccb4);
  static const Color cortexto = Color(0xff116873);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.of(context).pushReplacementNamed('/login'));
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: corappbar,
      child: const Center(
        child: CircularProgressIndicator(
          color: corfundo,
        ),
      ),
    );
  }
}
