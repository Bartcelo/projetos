import 'package:flutter/material.dart';

class LoginControle {
  String? _email;
  setEmail(String value) => _email = value;
  String? _pass;
  setPass(String value) => _pass = value;
  String? _empresa;
  setEmpresa(String value) => _empresa = value;

  Future<bool> auth() async {
    return  _email == "a" && _pass == 1;
  }
}
