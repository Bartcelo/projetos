import 'package:flutter/material.dart';

class DesafioStack extends StatefulWidget {
  const DesafioStack({Key? key}) : super(key: key);

  @override
  State<DesafioStack> createState() => _DesafioStackState();
}

class _DesafioStackState extends State<DesafioStack> {
  Color corappbar = Color(0xff4f1567);
  Color corfundo = Color(0xffeeccb4);
  Color cortexto = Color(0xff116873);
  final double size = 300;
  bool isClicked = false;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isClicked = true;
    });
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
                setState(() => turns -= 1);
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
