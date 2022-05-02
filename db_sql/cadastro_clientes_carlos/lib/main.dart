import 'package:cadastro_clientes_carlos/view/homePage.dart';
import 'package:cadastro_clientes_carlos/view/splashHome.dart';
import 'package:flutter/material.dart';

import 'view/loginPrincipal.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes:{ 
      '/': (_)=> const SplashHome(),
      '/login': (_)=>  LoginPrincipal(),
      '/homePag': (_)=>  HomePage(),
    
    }

,
  ));
}