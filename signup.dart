import 'package:flutter/material.dart';
class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar( leading:const BackButton()),

      ),
    );
  }
}
