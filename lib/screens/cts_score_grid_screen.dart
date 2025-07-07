import 'package:flutter/material.dart';

class CTSScoreGridScreen extends StatefulWidget {
  const CTSScoreGridScreen({super.key});

  @override
  State<CTSScoreGridScreen> createState() => _CTSScoreGridScreenState();
}

class _CTSScoreGridScreenState extends State<CTSScoreGridScreen> {
  final List<String> rowLabels = [
    'T1', 'T2', 'T3', 'T4',
    'B1', 'B2',
    'D1', 'D2'
  ];
  final List<String> columnLabels = [
    'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7',
    'C8', 'C9', 'C10', 'C11', 'C12', 'C13'
  ];

  final Map<String, Map<String, String>> gridData = {}; // row -> col -> value

  @override
  void initState() {
    super.initState();
    for (var row in rowLabels) {
      gridData[row] = {};
      for (var col in columnLabels) {
        gridData[row]![col] = '';
      }
    }
  }

  int calculateScore() {
    int total = 0;
    int possible = 0;
    for (var row in rowLabels) {
      for (var col in columnLabels) {
        final val = gridData[row]![col];
        if (val == '1') total++;
        if (val == '1' || val == '0') possible++;
      }
    }
    return possible == 0 ? 0 : ((total / possible) * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CTS Score Grid (Passed Trains)')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 60),
                ...columnLabels.map((col) => Container(
                  width: 60,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  child: Text(col, style: const TextStyle(fontWeight: FontWeight.bold)),
                ))
              ],
            ),
            ...rowLabels.map((row) => Row(
              children: [
                Container(
                  width: 60,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8),
                  child: Text(row, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                ...columnLabels.map((col) => Container(
                  width: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: DropdownButtonFormField<String>(
                    value: gridData[row]![col]!.isEmpty ? null : gridData[row]![col],
                    items: const [
                      DropdownMenuItem(value: '1', child: Text('1')),
                      DropdownMenuItem(value: '0', child: Text('0')),
                      DropdownMenuItem(value: 'X', child: Text('X')),
                      DropdownMenuItem(value: '-', child: Text('-')),
                    ],
                    onChanged: (val) => setState(() => gridData[row]![col] = val ?? ''),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ))
              ],
            )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int percentage = calculateScore();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Total Score: $percentage%')),
                );
              },
              child: const Text('Calculate Score'),
            )
          ],
        ),
      ),
    );
  }
}
