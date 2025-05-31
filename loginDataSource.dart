import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../presentation/gridScreen.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;

  bool _passwordVisible = false;

  Future<void> _login() async {
    if (emailController.text.trim().isEmpty) {
      setState(() {
        errorMessage = "Email is required.";
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    final response = await http.post(
      Uri.parse("https://food-api-omega.vercel.app/api/v1/user/signin"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      }),
    );

    setState(() => isLoading = false);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProductGridScreen()),
      );
    } else {
      setState(() {
        errorMessage = "Login failed. Check your name password !!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            color: Colors.lightBlueAccent,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 55),
                    const Text(
                      "Login",
                      style: TextStyle(fontSize: 33, fontFamily: 'my_font'),
                    ),
                    const SizedBox(height: 33),
                    SvgPicture.asset('assets/icons/login.svg'),
                    const SizedBox(height: 33),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(66),
                      ),
                      width: 266,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person, color: Colors.purple[800]),
                          hintText: "Your Email:",
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(66),
                      ),
                      width: 266,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: passwordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible ? Icons.visibility_off : Icons.visibility,
                              color: Colors.purple[900],
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          icon: Icon(Icons.lock, color: Colors.purple[800]),
                          hintText: "Password:",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (errorMessage != null)
                      Text(errorMessage!, style: const TextStyle(color: Colors.red)),
                    ElevatedButton(
                      onPressed: isLoading ? null : _login,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.purple),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 106, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                        "Login",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/Signup");
                          },
                          child: const Text(
                            " Sign up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Positioned(
                  left: 0,
                  child: Image.asset(
                    'assets/images/signup_top.png',
                    width: 133,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/login_bottom.png',
                    width: 133,
                    color: Colors.white70,
                  ),
                ),
                Positioned(
                  left: 0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
