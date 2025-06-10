// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HistoryItem {
  final String expression;
  final DateTime timestamp;

  HistoryItem({required this.expression, required this.timestamp});

  HistoryItem copyWith({String? expression, DateTime? timestamp}) {
    return HistoryItem(
      expression: expression ?? this.expression,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'expression': expression,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory HistoryItem.fromMap(Map<String, dynamic> map) {
    return HistoryItem(
      expression: map['expression'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryItem.fromJson(String source) =>
      HistoryItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HistoryItem(expression: $expression, timestamp: $timestamp)';

  @override
  bool operator ==(covariant HistoryItem other) {
    if (identical(this, other)) return true;

    return other.expression == expression && other.timestamp == timestamp;
  }

  @override
  int get hashCode => expression.hashCode ^ timestamp.hashCode;
}
