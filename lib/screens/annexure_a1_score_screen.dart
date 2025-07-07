import 'package:flutter/material.dart';

class AnnexureA1ScoreScreen extends StatefulWidget {
  const AnnexureA1ScoreScreen({super.key});

  @override
  State<AnnexureA1ScoreScreen> createState() => _AnnexureA1ScoreScreenState();
}

class _AnnexureA1ScoreScreenState extends State<AnnexureA1ScoreScreen> {
  final List<String> activities = [
    'Toilet Cleaning',
    'Washing Area Cleaning',
    'Sweeping & Mopping',
    'Dustbin Status',
    'Odour Control'
  ];

  final List<String> coaches = [
    'Coach 1', 'Coach 2', 'Coach 3', 'Coach 4', 'Coach 5',
    'Coach 6', 'Coach 7', 'Coach 8', 'Coach 9', 'Coach 10', 'Coach 11'
  ];

  final Map<String, Map<String, String>> scores = {};

  @override
  void initState() {
    super.initState();
    for (var activity in activities) {
      scores[activity] = {};
      for (var coach in coaches) {
        scores[activity]![coach] = '';
      }
    }
  }

  double calculateAverageScore() {
    int total = 0;
    int count = 0;
    for (var activity in activities) {
      for (var coach in coaches) {
        final val = scores[activity]![coach];
        if (val != null && val.isNotEmpty) {
          total += int.tryParse(val) ?? 0;
          count++;
        }
      }
    }
    return count == 0 ? 0.0 : total / count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Annexure A-1 Score Card')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 150),
                ...coaches.map((coach) => Container(
                  width: 80,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  child: Text(coach, style: const TextStyle(fontWeight: FontWeight.bold)),
                ))
              ],
            ),
            ...activities.map((activity) => Row(
              children: [
                Container(
                  width: 150,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8),
                  child: Text(activity, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                ...coaches.map((coach) => Container(
                  width: 80,
                  padding: const EdgeInsets.all(4),
                  child: DropdownButtonFormField<String>(
                    value: scores[activity]![coach]!.isEmpty ? null : scores[activity]![coach],
                    items: List.generate(4, (i) => DropdownMenuItem(
                      value: (3 - i).toString(),
                      child: Text((3 - i).toString()),
                    )),
                    onChanged: (val) => setState(() => scores[activity]![coach] = val ?? ''),
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
                double average = calculateAverageScore();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Average Score: ${average.toStringAsFixed(2)}')),
                );
              },
              child: const Text('Calculate Average Score'),
            )
          ],
        ),
      ),
    );
  }
}
