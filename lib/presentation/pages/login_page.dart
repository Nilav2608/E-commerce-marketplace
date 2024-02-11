import 'package:flutter/material.dart';
import 'package:fluxestore/presentation/authentication/bloc/auth_page_bloc.dart';

class LoginPage extends StatelessWidget {
  final AuthPageBloc bloc;
  const LoginPage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    const Text(
                      "Login Into",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "your account",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    //* Email
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                          return "Enter Your Email";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter Your Email",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //* Password
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value)) {
                          return "Enter valid password";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black87),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(0),
                            fixedSize: MaterialStatePropertyAll(Size(147, 51)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black87),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Submitting form")));
                            }
                          },
                          child: const Center(
                              child: Text(
                            "LOG IN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          )),
                        )),
                    // child: GestureDetector(
                    //   onTap: () {
                    //     print("clicked");
                    //   },
                    //   child: Container(
                    //     width: 147,
                    //     height: 51,
                    //     // alignment: Alignment.center,
                    //     decoration: BoxDecoration(
                    //         color: const Color(0xff2D201C),
                    //         borderRadius: BorderRadius.circular(30)),
                    //     child: const Center(
                    //         child: Text(
                    //       "SIGN UP",
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.w700,
                    //           fontSize: 16),
                    //     )),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                      child: Text(
                    "or sign up with",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: const Color(0xffE2E0DF))),
                          child: Center(
                            child: Image.asset(
                              "assets/images/apple.png",
                              width: 22,
                              height: 22,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: const Color(0xffE2E0DF))),
                          child: Center(
                            child: Image.asset(
                              "assets/images/google.png",
                              width: 22,
                              height: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      InkWell(
                        onTap: () => bloc.add(AuthPageShowSignUpPageEvent()),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
