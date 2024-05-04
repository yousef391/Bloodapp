import 'package:blood_donation/const.dart';
import 'package:flutter/material.dart';

import 'widgets/Login_view_body.dart';

class Login_view extends StatelessWidget {
  const Login_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Login_view_body() ,
    );
  }
}