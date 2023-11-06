import 'package:commmercial_directory_seller/core/use_case/use_case.dart';

class PaymentRequest extends Params {
  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (amount != null) {
      json.addEntries([MapEntry("amount", amount)]);
    }
    if (packageId != null) {
      json.addEntries([MapEntry("package_id", packageId)]);
    }
    if (adsId != null) {
      json.addEntries([MapEntry("ads_id", adsId)]);
    }
    if (offerId != null) {
      json.addEntries([MapEntry("offer_id", offerId)]);
    }
    if (type != null && type!.isNotEmpty) {
      json.addEntries([MapEntry("type", type)]);
    }

    return json;
  }

  final double? amount;
  final String? type;
  final int? packageId;
  final int? adsId;
  final int? offerId;

  const PaymentRequest(
      {this.amount, this.offerId, this.type, this.packageId, this.adsId});

  copyWith({
    double? amount,
    String? type,
    int? packageId,
  }) {
    return PaymentRequest(
      amount: amount ?? this.amount,
      packageId: packageId ?? this.packageId,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [type];
}
