import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screen.width,
        height: screen.height,
        child: Stack(
          children: [
            ClipPath(
              child: Container(
                color: Colors.amber,
                height: 140,
                width: screen.width,
              ),
              clipper: WaveClipperOne(reverse: true),
            ),
            ClipPath(
              child: Container(
                color: Colors.yellow,
                height: 110,
                width: screen.width,
              ),
              clipper: WaveClipperTwo(),
            ),
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.yellow[400],
                  height: 80,
                  width: screen.width,
                ),
                clipper: WaveClipperOne(reverse: true),
                
              ),
              bottom: 0,
              left: 0,
            ),
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.yellow[700],
                  height: 90,
                  width: screen.width,
                ),
                clipper: WaveClipperTwo(reverse: true),
              ),
               bottom: 0,
              left: 0,
            )
          ],
        ),
      ),
    );
  }
}
