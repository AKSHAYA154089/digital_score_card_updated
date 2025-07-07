import 'package:flutter/material.dart';
import '../models/form_data.dart';

class FormProvider extends ChangeNotifier {
  String stationName = '';
  DateTime? inspectionDate;
  List<ScoreEntry> entries = [];

  void setStationName(String name) {
    stationName = name;
    notifyListeners();
  }

  void setInspectionDate(DateTime date) {
    inspectionDate = date;
    notifyListeners();
  }

  void updateEntry(int index, int score, String remark) {
    entries[index].score = score;
    entries[index].remark = remark;
    notifyListeners();
  }

  void setEntries(List<String> parameters) {
    entries = parameters.map((p) => ScoreEntry(parameter: p)).toList();
  }

  Map<String, dynamic> toJson() => {
    'stationName': stationName,
    'inspectionDate': inspectionDate?.toIso8601String(),
    'entries': entries.map((e) => e.toJson()).toList(),
  };
}