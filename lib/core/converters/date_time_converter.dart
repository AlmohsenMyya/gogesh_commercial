import 'package:json_annotation/json_annotation.dart';

class DateTimeSerializer implements JsonConverter<DateTime, dynamic> {
  const DateTimeSerializer();

  @override
  DateTime fromJson(dynamic dateTime) => DateTime.parse(dateTime);

  @override
  String toJson(DateTime date) => date.toString();
}
