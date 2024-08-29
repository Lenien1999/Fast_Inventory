import 'package:fast_inventory/screens/auth/textForm_widget.dart';
import 'package:fast_inventory/utils/color.dart';
import 'package:fast_inventory/utils/text_style.dart';
 
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double? _screenHeight, _screenWidth;

  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [headerIcon(), loginFormWidget()],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginFormWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: _screenHeight! * 0.05),
      width: _screenWidth! * 0.9,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 221, 218, 218).withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
            Text(
              "Login to Your Account",
              style: textStyle(primaryClr, 20, FontWeight.normal),
            ),
            SizedBox(
              height: _screenHeight! * 0.01,
            ),
            Text(
              "Enter your username & password to login",
              textAlign: TextAlign.center,
              style: textStyle(Colors.black, 16, FontWeight.w400),
            ),
            SizedBox(
              height: _screenHeight! * 0.01,
            ),
            formWidget(),
          ],
        ),
      ),
    );
  }


  Widget formWidget() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            labelText("Username"),
            TextFielWidget(
              validator: (value) {
                if (value!.isEmpty) {
                  return "username can't be empty";
                }
                return null;
              },
              controller: usernameController,
              icon: Icons.person,
              hintText: 'Username',
            ),
            labelText("Password"),
            TextFielWidget(
              isPasswordField: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "password can't be empty";
                } else if (value.length < 5) {
                  return "password can't less than 5";
                }
                return null;
              },
              controller: passwordController,
              hintText: 'password',
              icon: LineAwesomeIcons.user_lock_solid,
            ),
            rememberMeWidget(),
            loginButton(),
          ],
        ));
  }

  Widget rememberMeWidget() {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
          activeColor: primaryClr, // Color when checked
          checkColor: Colors.white, // Color of the checkmark
        ),
        Text(
          'Remember Me',
          style: textStyle(Colors.black, 16, FontWeight.normal),
        ),
      ],
    );
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: MaterialButton(
        height: _screenHeight! * 0.07,
        minWidth: _screenWidth! * 0.9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Set BorderRadius here
        ),
        color: secondaryClr,
        onPressed: _changePassword,
        child: Text(
          "Login",
          style: textStyle(Colors.white, 24, FontWeight.bold),
        ),
      ),
    );
  }

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, 'home');
    }
  }

  Widget labelText(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        label,
        style: textStyle(Colors.black, 16, FontWeight.w400),
      ),
    );
  }

  Widget headerIcon() {
    return CircleAvatar(
      radius: _screenWidth! * 0.08,
      backgroundColor: const Color.fromRGBO(110, 190, 76, 1),
      child: const Icon(
        Icons.add_shopping_cart_outlined,
        color: Colors.white,
      ),
    );
  }
}
