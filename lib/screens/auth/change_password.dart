import 'package:fast_inventory/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:fast_inventory/utils/color.dart';
import 'package:fast_inventory/utils/text_style.dart';
import 'package:fast_inventory/screens/auth/textForm_widget.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmNewPassController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  double? screenHeight, screenWidth;
  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password changed successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppbar(
        isTrue: true,
        title: 'Change Password',
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: screenWidth! * 0.07,
                backgroundColor: const Color.fromRGBO(110, 190, 76, 1),
                child: const Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.white,
                ),
              ),
              _changePasswordWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _changePasswordWidget() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: screenHeight! * 0.05),
      // height: screenHeight! * 0.6,
      width: screenWidth! * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 221, 218, 218).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ]),
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Change Your password",
              style: textStyle(secondaryClr, 20, FontWeight.normal),
            ),
            const SizedBox(
              height: 10,
            ),
            // Old Password
            TextFielWidget(
              isPasswordField: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Old password can't be empty";
                }
                return null;
              },
              controller: oldPassController,
              hintText: 'Old Password',
              icon: LineAwesomeIcons.user_lock_solid,
            ),
            const SizedBox(height: 20),

            TextFielWidget(
              isPasswordField: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "New password can't be empty";
                } else if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
              controller: newPassController,
              hintText: 'New Password',
              icon: LineAwesomeIcons.user_lock_solid,
            ),
            const SizedBox(height: 20),

            TextFielWidget(
              isPasswordField: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Confirm password can't be empty";
                } else if (value != newPassController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
              controller: confirmNewPassController,
              icon: LineAwesomeIcons.user_lock_solid,
              hintText: 'Confirm New Password',
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryClr,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _changePassword,
                child: Text(
                  'Change Password',
                  style: textStyle(Colors.white, 18, FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
