import 'package:flutter/material.dart';
import 'package:teste/app/view/calendario.dart';
import 'package:teste/app/view/contact_form.dart';
import 'package:teste/app/view/contact_list.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/' ;
  static const FORM = 'form' ;
  static const CALENDARIO = 'calendario';

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
     routes: {
       HOME:(context) => ContactList(),
       FORM:(context) => ContactForm(),
       CALENDARIO:(context)=> Calendario(),

       }
    );
  }
}