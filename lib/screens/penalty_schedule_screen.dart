import 'package:flutter/material.dart';

class PenaltyScheduleScreen extends StatelessWidget {
  const PenaltyScheduleScreen({super.key});

  final List<Map<String, String>> penalties = const [
    {
      'clause': '22(i)',
      'item':
          'If daily cleaning is not done (reasons other than force majeure): Rs. 1000/- per coach per activity.',
    },
    {
      'clause': '22(ii)',
      'item':
          'Rs. 500/- per machine/gang for not deploying/non-working machine as per specification.',
    },
    {
      'clause': '22(iii)',
      'item':
          'Adverse remark by inspecting official or passenger: minimum Rs. 3000/- + compensation.',
    },
    {
      'clause': '22(iv)',
      'item':
          'Rs. 2000/- per case of flooding (other than toilet) during cleaning.',
    },
    {
      'clause': '22(v)',
      'item':
          'Rs. 1000/- for each occasion of dropping garbage during sweeping.',
    },
    {
      'clause': '22(vi)',
      'item':
          'Rs. 500/- per rake if chemicals used are substandard or not approved.',
    },
    {
      'clause': '22(vii)',
      'item': 'Rs. 500/- per staff for not wearing uniform or ID card.',
    },
    {
      'clause': '22(viii)',
      'item':
          'Short staff: Deduct wages + Rs. 1000/- penalty for each shortfall.',
    },
    {
      'clause': '22(ix)',
      'item':
          'Rs. 250/- per tool/day for not deploying implements as per spec.',
    },
    {
      'clause': '22(x)',
      'item': 'Any other penalty as specified.',
    },
    {
      'clause': '22(xi)',
      'item':
          'Rs. 5000/- per instance for misbehaving with passengers or railway staff.',
    },
  ];

  TableRow _buildHeader() {
    return const TableRow(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Clause', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Penalty Item', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  List<TableRow> _buildRows() {
    return penalties.map((penalty) {
      return TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(penalty['clause']!),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(penalty['item']!),
          ),
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Penalty Schedule - Annexure A-2')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment cum Penalty Schedule for Platform Return Trains',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Table(
              border: TableBorder.all(color: Colors.grey),
              columnWidths: const {
                0: FixedColumnWidth(80),
                1: FlexColumnWidth(),
              },
              children: [
                _buildHeader(),
                ..._buildRows(),
              ],
            ),
            const SizedBox(height: 30),
            const Text("Signature of Contractor's Supervisor"),
            const SizedBox(height: 8),
            const Text("Signature of Auth. Rep. of Sr.DME/LMG"),
          ],
        ),
      ),
    );
  }
}
