import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/form_provider.dart';

class ScoreInput extends StatelessWidget {
  final int index;

  const ScoreInput({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormProvider>(context);
    final entry = provider.entries[index];

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      shadowColor: Colors.blueGrey.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  entry.parameter,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  ' *',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(
                labelText: 'Score (0-10)',
                border: OutlineInputBorder(),
              ),
              value: entry.score,
              items: List.generate(
                11,
                (i) => DropdownMenuItem(value: i, child: Text(i.toString())),
              ),
              onChanged: (value) {
                provider.updateEntry(index, value ?? 0, entry.remark);
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select a score';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: entry.remark,
              decoration: const InputDecoration(
                labelText: 'Remarks *',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
              onChanged: (val) {
                provider.updateEntry(index, entry.score, val);
              },
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter remarks';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
