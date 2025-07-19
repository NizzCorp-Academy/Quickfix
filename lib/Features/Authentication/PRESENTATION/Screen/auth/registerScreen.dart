import 'package:bug_tracker_application/Features/Authentication/PRESENTATION/Auhentication_bloc/auth_bloc.dart';
import 'package:bug_tracker_application/Features/Authentication/PRESENTATION/Screen/auth/login_screen.dart';
import 'package:bug_tracker_application/core/constants/color_costants/color_constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordControler = TextEditingController();
    TextEditingController namecontroller = TextEditingController();
    // TextEditingController ConfirmPassController = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign up for free",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "enter your name";
                  }
                  return null;
                },
                controller: namecontroller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  hintText: "name",
                  hintStyle: TextStyle(
                    color: ColorConstant.loginGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorConstant.loginGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorConstant.loginBlue),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorConstant.mainRed),
                  ),
                ),
              ),
              SizedBox(height: 15),

              TextFormField(
                key: Key("emailField"),
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
                    color: ColorConstant.loginGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorConstant.loginGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorConstant.loginBlue),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorConstant.mainRed),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                key: Key("passwordField"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "enter a password";
                  } else if (value.length < 6) {
                    return "password must be at least 6 characters";
                  } else {
                    return null;
                  }
                },
                controller: passwordControler,

                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: ColorConstant.loginGrey,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  hintText: "Enter Password",
                  hintStyle: TextStyle(
                    color: ColorConstant.loginGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorConstant.loginGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorConstant.loginBlue),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorConstant.mainRed),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                key: Key("confirmPasswordField"),
                validator: (value) {
                  if (value == passwordControler.text) {
                    return null;
                  }
                  return "passwords do not match";
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.visibility_off_sharp,
                    color: ColorConstant.loginGrey,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  hintText: "confirm password",
                  hintStyle: TextStyle(
                    color: ColorConstant.loginGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorConstant.loginGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorConstant.loginBlue),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorConstant.mainRed),
                  ),
                ),
              ),
              SizedBox(height: 15),
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
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                        RegisterEvent(
                          context,
                          name: namecontroller.text,
                          email: emailController.text,
                          password: passwordControler.text,
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: ColorConstant.mainWhite),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You have already an a account ?"),
                  SizedBox(width: 1),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogInScreen()),
                      );
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: ColorConstant.loginBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
