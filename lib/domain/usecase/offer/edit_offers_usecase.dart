import 'dart:io';

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

class EditOffersUseCase extends UseCase<String, OfferRequest> {
  final OfferRemoteDataSource dataSource;
  final LocalDataSource localDataSource;

  EditOffersUseCase({required this.dataSource, required this.localDataSource});

  @override
  Future<Result<String, Exceptions>> call(
    OfferRequest params,
  ) async {
    try {
      final keyLanguage = localDataSource.getValue(LocalDataKeys.languageKey);
      final token =
          'Bearer ${localDataSource.getValue(LocalDataKeys.accessToken)}';
      var body = FormData.fromMap({
        "_method": "put",
        "title": params.title,
        "description": params.description,
        "condition": params.conditions,
        "price": params.price,
        "discount": params.discount,
        "total": params.total,
        "reason": params.reason,
        "duration_id": params.durationId,
        "season_id": params.seasonId,
        "start_at": params.dateStart,
        "end_at": params.dateFinish,
      });

      if (params.video != null) {
        body.files.add(
            MapEntry("video", await MultipartFile.fromFile(params.video!)));
      }
      if (params.image.isNotEmpty) {
        params.image.asMap().forEach(
          (key, element) async {
            body.files.add(
              MapEntry(
                "images[$key]",
                await MultipartFile.fromFile(element),
              ),
            );
          },
        );
      }
      if (params.imagePaths!.isNotEmpty) {
        params.imagePaths!.asMap().forEach(
          (key, element) async {
            body.fields.add(
              MapEntry(
                "images_paths[$key]",
                element,
              ),
            );
          },
        );
      }

      final result = await dataSource.editOffers(
        auth: token,
        body: body,
        language: keyLanguage,
        id: params.id!,
      );

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
