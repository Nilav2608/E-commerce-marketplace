import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
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
                    const SizedBox(
                      height: 70,
                    ),
                    const Text(
                      "Create",
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
                    //* Name
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return "Enter Correct Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter Your Name",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //* Email
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
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
                            RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                                .hasMatch(value)) {
                          return "Enter Your Email";
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
                    //*Confirm Password
                    TextFormField(
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return "Enter Your Email";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Confirm password",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                              final snackBar =
                                  SnackBar(content: Text("Submitting form"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: const Center(
                              child: Text(
                            "SIGN UP",
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have account?",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: 14),
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
