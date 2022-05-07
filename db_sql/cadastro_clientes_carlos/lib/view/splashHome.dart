

import 'package:cadastro_clientes_carlos/view/color.dart';
import 'package:flutter/material.dart';

class SplashHome extends StatefulWidget {
  const SplashHome({Key? key}) : super(key: key);

  @override
  State<SplashHome> createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  Cores cor = Cores();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.of(context).pushReplacementNamed('/login'));
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: cor.corappbar,
      child:  Center(
        child: CircularProgressIndicator(
          color: cor.corfundo,
        ),
      ),
    );
  }
}
