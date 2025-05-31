import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled18/users/presentation/signup.dart';

import 'login.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.amber,
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 22,
                  ),
                  const Text(
                    "welcome",
                    style: TextStyle(fontSize: 33,fontFamily: 'my_font'),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  SvgPicture.asset('assets/icons/chat.svg'),
                  const SizedBox(
                    height: 33,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>const Login() ),);
                    },

                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.purple[900]),
                      padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 79, vertical: 10)),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                    ),
                    child: const Text(
                      "login",
                      style: TextStyle(fontSize: 24,color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>const Signup()));
                    },

                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.purple),
                      padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 63, vertical: 10)),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                    ),
                    child: const Text(
                      "SIGNUP",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Positioned(
                  left: 0,
                  child: Image.asset(
                    'assets/images/main_top.png',
                    width: 133,
                    color: Colors.white70,
                  )),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/login_bottom.png',
                    width: 200,
                    color: Colors.white70,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
