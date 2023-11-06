
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_seller_request.g.dart';

@JsonSerializable()

class RegisterSeller{
const RegisterSeller();


 factory RegisterSeller.fromJson(Map<String, dynamic> json) => _$RegisterSellerFromJson(json);
 Map<String,dynamic> toJson() => _$RegisterSellerToJson(this);

}