import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_response.g.dart';

@JsonSerializable()
class PaymentResponse {
const PaymentResponse({
    required this.type,
    required this.url,
  });

  final String? url;

  final String? type;

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentResponseToJson(this);
}
