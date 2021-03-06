import 'package:flutter/material.dart';

class SplashHome extends StatefulWidget {
  const SplashHome({Key? key}) : super(key: key);

  @override
  State<SplashHome> createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  Color corappbar = Color(0xff4f1567);
  Color corfundo = Color(0xffeeccb4);
  Color cortexto = Color(0xff116873);
  final double size = 300;
  bool isClicked = false;


@override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) => Navigator.of(context).pushReplacementNamed('/login'));
  }
  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corfundo,
      body: Center(
        child: AnimatedRotation(
          curve: Curves.easeOutSine,
          turns: turns,
          duration: const Duration(seconds: 1),
          child: GestureDetector(
            onTap: () {
              isClicked = !isClicked;
              if(isClicked ){
                setState(() => turns -= 1.5);
              }else{
                setState(() => turns += 2);
              }
            },
            child: Center(child: Text("BARTCELO", style: TextStyle(fontSize: 40, color: corappbar, fontWeight: FontWeight.w900), )),
          ),
        ),
      ),
    );
  }
}
