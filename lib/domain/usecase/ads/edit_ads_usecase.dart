import 'dart:io';
import 'dart:typed_data';

import 'package:commmercial_directory_seller/data/ads_data_source/ads_remote_data_source.dart';
import 'package:commmercial_directory_seller/domain/request/ads/ads_request.dart';
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

class EditAdsUseCase extends UseCase<String, AdsRequest> {
  final AdsRemoteDataSource dataSource;
  final LocalDataSource localDataSource;

  EditAdsUseCase({required this.dataSource, required this.localDataSource});
  @override
  Future<Result<String, Exceptions>> call(
    AdsRequest params,
  ) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      final body = FormData.fromMap({
        "title": params.title,
        "description": params.description,
        "place": params.place,
        "price": params.price,
        "duration": params.duration,
        "total": params.total,
        "date_start": params.dateStart,
        "images": await MultipartFile.fromFile(params.images[0]),
      });

      // params.images.forEach((element) async {
      //   var resultFile = await FlutterImageCompress.compressWithFile(
      //     element,
      //     minWidth: 2300,
      //     minHeight: 1500,
      //     quality: 94,
      //   );

      //   List<int> intList = resultFile!;

      //   body.files.add(MapEntry(
      //       "images[]", MultipartFile.fromBytes(intList, filename: element)));
      // });

      final result = await dataSource.editAds(
          auth: token, body: body, id: params.id!, language: keyLanguage,method: "PUT");

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
        return const Result.failure(error: Exceptions.network(""));
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
