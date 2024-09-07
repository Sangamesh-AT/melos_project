import 'package:json_annotation/json_annotation.dart';

enum VitalsInterpretation { normal, abnormal }

enum ECGInterpretation {
  normal(value: 'Normal'),
  abnormal(value: 'Abnormal'),
  irregular(value: 'Irregular Rhythm');

  final String value;

  const ECGInterpretation({
    required this.value,
  });
}

enum BPInterpretation {
  @JsonValue('very-high')
  veryHigh(value: 'High BP'),
  high(value: 'High BP'),
  normal(value: 'Normal'),
  low(value: 'Low BP'),
  @JsonValue('very-low')
  veryLow(value: 'Low BP');

  final String value;

  const BPInterpretation({
    required this.value,
  });
}

enum HRInterpretation {
  @JsonValue('very-high')
  veryHigh(value: 'Very High'),
  high(value: 'Very High'),
  normal(value: 'Normal'),
  low(value: ''),
  @JsonValue('very-low')
  veryLow(value: '');

  final String value;

  const HRInterpretation({
    required this.value,
  });
}

enum RRInterpretation {
  @JsonValue('very-high')
  veryHigh(value: 'High RR'),

  high(value: 'High RR'),

  normal(value: 'Normal'),

  low(value: ''),

  @JsonValue('very-low')
  veryLow(value: '');

  final String value;

  const RRInterpretation({
    required this.value,
  });
}

enum SPO2Interpretation {
  normal(value: 'Normal'),

  low(value: 'Abnormal'),

  @JsonValue('very-low')
  veryLow(value: 'Abnormal');

  final String value;

  const SPO2Interpretation({
    required this.value,
  });
}

enum TemperatureInterpretation {
  @JsonValue('very-high')
  veryHigh(value: 'High Temperature'),
  high(value: 'High Temperature'),
  normal(value: 'Normal'),
  low(value: 'Low Temperature'),
  @JsonValue('very-low')
  veryLow(value: 'Low Temperature');

  final String value;

  const TemperatureInterpretation({
    required this.value,
  });
}
