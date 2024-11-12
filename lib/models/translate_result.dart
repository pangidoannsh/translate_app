class TranslateResult {
  final String from;
  final String to;

  TranslateResult({required this.from, required this.to});

  factory TranslateResult.fromJson(Map<String, dynamic> json) {
    return TranslateResult(from: json["from"], to: json["to"]);
  }
}
