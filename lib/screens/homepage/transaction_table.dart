import 'package:flutter/material.dart';

class InventoryTable extends StatefulWidget {
  @override
  _InventoryTableState createState() => _InventoryTableState();
}

class _InventoryTableState extends State<InventoryTable> {
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
    // More data entries...
  ];

  List<Map<String, String>>? filteredData;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredData = data;
    _searchController.addListener(_filterData);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterData() {
    setState(() {
      filteredData = data
          .where((item) =>
              item.values.any((value) =>
                  value.toLowerCase().contains(_searchController.text.toLowerCase())))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Search for transaction by account type...",
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 199, 196, 196))),
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
              rows: filteredData!
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
        ),
      ],
    );
  }
}
