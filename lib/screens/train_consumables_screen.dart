import 'package:flutter/material.dart';

class TrainConsumablesScreen extends StatelessWidget {
  const TrainConsumablesScreen({super.key});

  final List<Map<String, dynamic>> staffItems = const [
    {'sn': '1', 'item': 'Gum boot (1 pair/staff/year)', 'unit': 'Pair', 'qty': '6'},
    {'sn': '2', 'item': 'Coverall for men (2 sets/staff/year)', 'unit': 'Sets', 'qty': '6'},
    {'sn': '3', 'item': 'Cap (2 nos/person/year)', 'unit': 'Nos', 'qty': '5'},
    {'sn': '4', 'item': 'Rain Suit (1 set/person/year)', 'unit': 'Sets', 'qty': '3'},
    {'sn': '5', 'item': 'Google/Face Mask', 'unit': 'Nos', 'qty': '3'},
    {'sn': '6', 'item': 'Electric Name plate (1/person/year)', 'unit': 'Nos', 'qty': '36'},
    {'sn': '7', 'item': 'Cotton masks (per staff/month)', 'unit': 'Nos', 'qty': '36'},
  ];

  final List<Map<String, dynamic>> trainSchedule = const [
    {'sn': '1', 'trainNo': '20501', 'name': 'Tejas Rajdhani Express', 'up': '20', 'down': '20'},
    {'sn': '2', 'trainNo': '20502', 'name': 'Tejas Rajdhani Express', 'up': '20', 'down': '20'},
    {'sn': '3', 'trainNo': '12503', 'name': 'Humsafar Express', 'up': '21', 'down': '21'},
    {'sn': '4', 'trainNo': '12504', 'name': 'Humsafar Express', 'up': '21', 'down': '21'},
    {'sn': '5', 'trainNo': '20506', 'name': 'AGTL Rajdhani Express', 'up': '22', 'down': '22'},
  ];

  TableRow _buildHeaderRow(List<String> headers) {
    return TableRow(
      children: headers.map((header) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            header,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }

  List<TableRow> _buildTableRows(List<Map<String, dynamic>> data, List<String> keys) {
    return data.map((row) {
      return TableRow(
        children: keys.map((key) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Text(row[key].toString()),
          );
        }).toList(),
      );
    }).toList();
  }

  Widget _buildSection(String title, List<Map<String, dynamic>> data, List<String> headers, List<String> keys) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Table(
          border: TableBorder.all(color: Colors.grey),
          columnWidths: const {
            0: FixedColumnWidth(40),
            1: FlexColumnWidth(),
            2: FixedColumnWidth(60),
            3: FixedColumnWidth(50),
          },
          children: [
            _buildHeaderRow(headers),
            ..._buildTableRows(data, keys),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staff Consumables & Train Schedule')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              '🧢 Staff Consumables',
              staffItems,
              ['S/N', 'Item', 'Units', 'Qty'],
              ['sn', 'item', 'unit', 'qty'],
            ),
            const SizedBox(height: 30),
            _buildSection(
              '🚆 Train Schedule for BPB Stations',
              trainSchedule,
              ['S/N', 'Train No', 'Name', 'UP', 'DOWN'],
              ['sn', 'trainNo', 'name', 'up', 'down'],
            ),
          ],
        ),
      ),
    );
  }
}
