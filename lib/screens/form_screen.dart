import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/form_provider.dart';
import '../widgets/score_input.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _dateError = false;
  bool _stationNameError = false;
  final _stationNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final parameters = [
      'Platform Cleanliness',
      'Urinals',
      'Waiting Room',
      'Drinking Water Booths'
    ];
    Provider.of<FormProvider>(context, listen: false).setEntries(parameters);
  }

  Future<void> _submitForm() async {
    final formProvider = Provider.of<FormProvider>(context, listen: false);

    setState(() {
      _dateError = formProvider.inspectionDate == null;
      _stationNameError = _stationNameController.text.trim().isEmpty;
    });

    if (_formKey.currentState!.validate() &&
        !_dateError &&
        !_stationNameError) {
      final url = Uri.parse('https://httpbin.org/post');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(formProvider.toJson()),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('✅ Submitted successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ Submission failed: ${response.statusCode}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Digital Score Card')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Station Name ',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: _stationNameController,
                decoration: const InputDecoration(
                  hintText: 'Enter station name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  formProvider.setStationName(value);
                  setState(() {
                    _stationNameError = value.trim().isEmpty;
                  });
                },
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Station Name is required' : null,
              ),
              if (_stationNameError)
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Text(
                    'Station Name is required',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 20),

              RichText(
                text: const TextSpan(
                  text: 'Inspection Date ',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2026),
                    initialDate: DateTime.now(),
                  );
                  if (date != null) {
                    formProvider.setInspectionDate(date);
                    setState(() {
                      _dateError = false;
                    });
                  }
                },
                child: Text(formProvider.inspectionDate == null
                    ? 'Select Inspection Date'
                    : formProvider.inspectionDate!
                        .toLocal()
                        .toString()
                        .split(' ')[0]),
              ),
              if (_dateError)
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Text(
                    'Inspection Date is required',
                    style: TextStyle(color: Colors.red),
                  ),
                ),

              const SizedBox(height: 20),
              ...formProvider.entries.asMap().entries.map((entry) {
                int index = entry.key;
                return ScoreInput(index: index);
              }),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Submit', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
