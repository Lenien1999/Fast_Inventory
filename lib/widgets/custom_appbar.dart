import 'package:fast_inventory/utils/color.dart';
import 'package:fast_inventory/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final bool isTrue;
  final String title;

  const CustomAppbar({Key? key, required this.title, required this.isTrue})
      : preferredSize = const Size.fromHeight(80.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 100,
      shadowColor: Colors.grey,
      elevation: 3,
      leading: isTrue
          ? InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: primaryClr,
              ),
            )
          : null,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: textStyle(secondaryClr, 20, FontWeight.w700),
      ),
      actions: [
        _dropdownWidget(context),
      ],
    );
  }

  Widget _dropdownWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: FocusedMenuHolder(
          menuWidth: MediaQuery.of(context).size.width * 0.5,
          menuOffset: -10,
          menuItems: [
            FocusedMenuItem(
                title: const Text('My Profile'),
                trailingIcon: const Icon(
                  LineAwesomeIcons.user,
                  size: 12,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'profile');
                }),
            FocusedMenuItem(
                title: const Text('logout'),
                trailingIcon: const Icon(
                  LineAwesomeIcons.sign_out_alt_solid,
                  size: 12,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                })
          ],
          openWithTap: true,
          onPressed: () {},
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Expanded(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.asset(
                        'assets/image/avater.png',
                      )),
                ),
                const Expanded(
                  child: Text(
                    "Peter Adebayo",
                    style: TextStyle(
                        color: secondaryClr,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ])),
        ));
  }
}
