import 'package:fast_inventory/screens/homepage/transaction_table.dart';
import 'package:fast_inventory/utils/color.dart';
import 'package:fast_inventory/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _deviceWidth, _deviceHeight;
  String salesTimeframe = 'Today';

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'createOrder');
          },
          backgroundColor: secondaryClr,
          child: const Icon(
            LineAwesomeIcons.pen_alt_solid,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromRGBO(246, 249, 255, 1),
        appBar: const CustomAppbar(
          isTrue: false,
          title: 'Fast Inventory System',
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth! * 0.04,
            vertical: _deviceWidth! * 0.04,
          ),
          child: ListView(
            children: [
              Text(
                "Dashboard",
                style: textStyle(secondaryClr, 20, FontWeight.bold),
              ),
              // headerRowWidget(subtitle: "Dashboard", title: "Home"),
              _inventoryDetails(
                isOthers: false,
                icon: Icons.shopping_cart_outlined,
                title: '0',
                headerTitle: 'Sales',
                onDropdownChanged: (value) {
                  setState(() {
                    salesTimeframe = value;
                  });
                },
                headerSbt: salesTimeframe,
                clr: primaryClr,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: _inventoryDetails(
                      icon: Icons.money,
                      title: '#20.0',
                      clr: secondaryClr,
                      headerTitle: 'Total Revenue',
                      headerSbt: salesTimeframe,
                      isOthers: true,
                    ),
                  ),
                  const SizedBox(width: 10), // Add some space between the cards
                  Flexible(
                    flex: 1,
                    child: _inventoryDetails(
                      isOthers: true,
                      icon: Icons.person,
                      clr: Colors.redAccent,
                      title: '1',
                      headerTitle: 'Customers',
                      headerSbt: '',
                    ),
                  ),
                ],
              ),
              _recentTransactionWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inventoryDetails({
    required Color clr,
    required IconData icon,
    required String title,
    required String headerTitle,
    required bool isOthers,
    required String headerSbt,
    Function(String)? onDropdownChanged,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: _deviceHeight! * 0.01,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth! * 0.02, vertical: _deviceHeight! * 0.02),
      height: _deviceHeight! * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 221, 218, 218).withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              headerRowWidget(
                title: headerTitle,
                subtitle: headerSbt,
                isOthers: isOthers,
              ),
              if (onDropdownChanged != null)
                DropdownButton<String>(
                  underline: const SizedBox(), // Remove the underline
                  icon: const Icon(
                    LineAwesomeIcons.filter_solid,
                    color: Color.fromARGB(255, 187, 182, 182),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Today',
                      child: Text('Today'),
                    ),
                    DropdownMenuItem(
                      value: 'This Month',
                      child: Text('This Month'),
                    ),
                    DropdownMenuItem(
                      value: 'This Year',
                      child: Text('This Year'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      onDropdownChanged(value);
                    }
                  },
                ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment:
                isOthers ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color.fromARGB(255, 236, 231, 231),
                child: Icon(
                  icon,
                  color: clr,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: textStyle(secondaryClr, 24, FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget headerRowWidget({
    required String title,
    required bool isOthers,
    required String subtitle,
  }) {
    if (isOthers) {
      return Column(
        children: [
          Text(
            title,
            style: textStyle(Colors.black, 18, FontWeight.bold),
          ),
          Text(
            subtitle,
            style: textStyle(primaryClr, 14, FontWeight.w600),
          ),
        ],
      );
    }
    return Row(
      children: [
        Text(
          title,
          style: textStyle(Colors.black, 18, FontWeight.bold),
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text("|"),
        ),
        Text(
          subtitle,
          style: textStyle(primaryClr, 14, FontWeight.w600),
        ),
      ],
    );
  }

  Widget _recentTransactionWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: _deviceHeight! * 0.02,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth! * 0.02, vertical: _deviceHeight! * 0.02),
      width: _deviceWidth! * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 221, 218, 218).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Transactions',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          InventoryTable(),
        ],
      ),
    );
  }
}
