class ScoreEntry {
  final String parameter;
  int score;
  String remark;

  ScoreEntry({required this.parameter, this.score = 0, this.remark = ''});

  Map<String, dynamic> toJson() => {
    'parameter': parameter,
    'score': score,
    'remark': remark,
  };
}