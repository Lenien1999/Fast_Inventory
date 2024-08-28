// ignore_for_file: must_be_immutable

import 'package:fast_inventory/screens/profile/profile_widget.dart';
import 'package:fast_inventory/utils/color.dart';
import 'package:fast_inventory/utils/text_style.dart';
import 'package:fast_inventory/widgets/custom_appbar.dart';

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Profile', isTrue: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: _deviceHeight! * 0.02,
                ),
                width: _deviceWidth! * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 221, 218, 218)
                            .withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: Column(
                  children: [
                    _profilePicWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    _profileInforWidget(
                      name: "Adeyemi Peter",
                      email: "user@gmail.com",
                      userId: 'UserId: Peter',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Account Setting',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              _buildAccountSettings(context),
              logoutButton(context)
            ],
          ),
        ),
      ),
    );
  }

  _buildAccountSettings(BuildContext context) {
    return Column(
      children: [
        ProfileWidget(
          icon: LineAwesomeIcons.user_edit_solid,
          onpress: () {},
          title: 'Edit Profile',
        ),
        ProfileWidget(
          title: 'Change Password',
          icon: LineAwesomeIcons.lock_solid,
          onpress: () {
            Navigator.pushNamed(context, "changepassword");
          },
        ),
        ProfileWidget(
          title: 'Notification Settings',
          icon: LineAwesomeIcons.bell,
          onpress: () {},
        ),
      ],
    );
  }

  Widget logoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: MaterialButton(
        height: _deviceHeight! * 0.07,
        minWidth: _deviceWidth! * 0.9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Set BorderRadius here
        ),
        color: secondaryClr,
        onPressed: () {
          Navigator.pushNamed(context, 'login');
        },
        child: Text(
          "Logout",
          style: textStyle(Colors.white, 24, FontWeight.bold),
        ),
      ),
    );
  }

  Stack _profilePicWidget() {
    return Stack(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/image/avater.png',
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: secondaryClr),
            child: const Icon(
              LineAwesomeIcons.pencil_alt_solid,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  _profileInforWidget(
      {required String name, required String email, required String userId}) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          email,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          userId,
          style: const TextStyle(
            fontSize: 16,
            color: secondaryClr,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
