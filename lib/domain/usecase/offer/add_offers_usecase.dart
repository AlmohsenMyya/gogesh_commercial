import 'dart:io';
import 'dart:typed_data';

import 'package:commmercial_directory_seller/domain/entities/information_subscribtion.dart';
import 'package:commmercial_directory_seller/domain/usecase/register_company/register_company_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../../../app/locator.dart';
import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../../core/utils/model_id.dart';
import '../../../data/auth_data_source/auth_data_source.dart';
import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';
import '../../../data/offer_datat_source/offer_remote_data_source.dart';
import '../../request/auth/login/login_request.dart';
import '../../request/offers/offer_request.dart';

class AddOffersUseCase extends UseCase<String, OfferRequest> {
  final OfferRemoteDataSource dataSource;
  final LocalDataSource localDataSource;

  AddOffersUseCase({required this.dataSource, required this.localDataSource});

  @override
  Future<Result<String, Exceptions>> call(
    OfferRequest params,
  ) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      InformationEntity? information =
          localDataSource.getValue(LocalDataKeys.infoamationPackage);
      var body = FormData.fromMap({
        "title": params.title,
        "description": params.description,
        "condition": params.conditions,
        "price": params.price,
        "discount": params.discount,
        "total": params.total,
        "duration_id": params.durationId,
        "season_id": params.seasonId,
        "start_at": params.dateStart,
        "end_at": params.dateFinish,
        "images[0]": await MultipartFile.fromFile(params.image[0]),
        "images[1]": await MultipartFile.fromFile(params.image[1]),
        "images[2]": await MultipartFile.fromFile(params.image[2])
      });
      if (params.video != null) {
        body.files.add(
            MapEntry("video", await MultipartFile.fromFile(params.video!)));
      }

      final result = await dataSource.addOffers(
        auth: token,
        body: body,
        language: keyLanguage,
      );
      int maxOffers = information?.maxOffers! as int ;
      if (maxOffers != 0) {
        await localDataSource.setValue(LocalDataKeys.infoamationPackage,
            information?.copyWith(maxOffers: maxOffers - 1));
      }

      return const Result.success(data: '');
    } on DioException catch (ex) {
      switch (ex.response?.statusCode ?? 0) {
        case 401:
          {
            return Result.failure(
                error:
                    Exceptions.passwordInvalude(ex.response!.data["message"]));
          }
        case 422:
          {
            return Result.failure(
                error: Exceptions.other(ex.response?.data["message"]));
          }
      }
      if (ex.error is SocketException) {
        return const Result.failure(
            error: Exceptions.network("there_is_no_internet_connection"));
      }

      return Result.failure(
          error: Exceptions.other(ex.response?.data["message"]));
    } on HttpException catch (e) {
      return Result.failure(error: Exceptions.other(e.message));
    } catch (e) {
      print('object');
      print(e.toString());
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }
}
