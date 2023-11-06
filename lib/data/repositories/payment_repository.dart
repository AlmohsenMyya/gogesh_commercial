import 'package:commmercial_directory_seller/core/excptions/exceptions.dart';
import 'package:commmercial_directory_seller/core/result/result.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/data/remote_data_source.dart/remote_data_source.dart';
import 'package:commmercial_directory_seller/data/repositories/offer_repository.dart';
import 'package:commmercial_directory_seller/domain/entities/pyment_entity/payment_response.dart';
import 'package:commmercial_directory_seller/domain/repositories/payment_repository.dart';
import 'package:commmercial_directory_seller/domain/request/payment/payment_request.dart';
import 'package:dio/dio.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  PaymentRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Result<PaymentResponse, Exceptions>> addPayment(
      PaymentRequest params) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final res = await remoteDataSource.payment(
        auth: token,
        body: params,
        language: keyLanguage,
      );
      if (res.response.statusCode!.isOk) {
        return Result.success(
            data: PaymentResponse(type: params.type, url: res.data["url"]));
      }
    } on DioException catch (ex) {}
    // TODO: implement fetchOffers
    throw UnimplementedError();
  }
}
