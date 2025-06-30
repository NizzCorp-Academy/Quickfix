import 'package:bug_tracker_application/Features/Presenetation/Bloc/Auhentication_bloc/auth_bloc.dart';

import 'package:bug_tracker_application/Features/Presenetation/screens/on_boarding_screens/registerScreen.dart';
import 'package:bug_tracker_application/core/constants/color_costants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordControler = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign in",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25),

                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "enter a email";
                    } else if (value.contains("@")) {
                      return null;
                    } else {
                      return "invalid email";
                    }
                  },
                  decoration: InputDecoration(
                    label: Text("Email"),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    hintText: "Your Eamil Address",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorConstant.loginGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.loginLightBlue,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorConstant.mainRed),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordControler,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "enter a password";
                    } else if (value.length < 6) {
                      return "password must be at least 6 characters";
                    } else {
                      return null;
                    }
                  },

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorConstant.loginGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.loginLightBlue,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorConstant.mainRed),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        ColorConstant.loginBlue,
                      ),
                    ),
                    onPressed: () {
                      /// Validate the form before proceeding
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                          LoginEvent(
                            context,
                            email: emailController.text,
                            password: passwordControler.text,
                          ),
                        );

                        // context.read<AuthBloc>().add(
                        //   LoginEvent(
                        //     email: emailController.text,
                        //     password: passwordControler.text,

                        //   ),
                        // );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Please fill in all fields correctly.",
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: ColorConstant.mainWhite,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Register your account"),
                    SizedBox(width: 1),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: ColorConstant.loginBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
