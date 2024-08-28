import 'package:flutter/material.dart';

class InventoryTable extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      'REF': '001',
      'ITEM NAME': 'Item 1',
      'QUANTITY': '2',
      'PAYMENT MODE': 'Cash',
      'AMOUNT PAID': '₦2000',
      'CUSTOMER': 'John Doe',
      'STATUS': 'Completed',
      'DATE': '2024-08-26',
    },
    {
      'REF': '002',
      'ITEM NAME': 'Item 2',
      'QUANTITY': '5',
      'PAYMENT MODE': 'Card',
      'AMOUNT PAID': '₦5000',
      'CUSTOMER': 'Jane Smith',
      'STATUS': 'Pending',
      'DATE': '2024-08-25',
    },
    {
      'REF': '002',
      'ITEM NAME': 'Item 2',
      'QUANTITY': '5',
      'PAYMENT MODE': 'Card',
      'AMOUNT PAID': '₦5000',
      'CUSTOMER': 'Jane Smith',
      'STATUS': 'Pending',
      'DATE': '2024-08-25',
    },
    {
      'REF': '002',
      'ITEM NAME': 'Item 2',
      'QUANTITY': '5',
      'PAYMENT MODE': 'Card',
      'AMOUNT PAID': '₦5000',
      'CUSTOMER': 'Jane Smith',
      'STATUS': 'Pending',
      'DATE': '2024-08-25',
    },
  ];

  InventoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
            border:
                Border.all(color: const Color.fromARGB(255, 199, 196, 196))),
        child: DataTable(
          columns: const [
            DataColumn(label: Text('REF')),
            DataColumn(label: Text('ITEM NAME')),
            DataColumn(label: Text('QUANTITY')),
            DataColumn(label: Text('PAYMENT MODE')),
            DataColumn(label: Text('AMOUNT PAID')),
            DataColumn(label: Text('CUSTOMER')),
            DataColumn(label: Text('STATUS')),
            DataColumn(label: Text('DATE')),
          ],
          rows: data
              .map(
                (item) => DataRow(
                  cells: [
                    DataCell(Text(item['REF']!)),
                    DataCell(Text(item['ITEM NAME']!)),
                    DataCell(Text(item['QUANTITY']!)),
                    DataCell(Text(item['PAYMENT MODE']!)),
                    DataCell(Text(item['AMOUNT PAID']!)),
                    DataCell(Text(item['CUSTOMER']!)),
                    DataCell(Text(item['STATUS']!)),
                    DataCell(Text(item['DATE']!)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
