import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/core/paginated/standar_paginated/standar_paginated.dart';
import 'package:commmercial_directory_seller/data/categories_data_source/categories_data_source.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';

import '../../../core/excptions/exceptions.dart';
import '../../../core/fillters/filter.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../../core/utils/model_id.dart';
import '../../../data/local_data_source/db_provider.dart';

class FetchSubSecorsUseCase implements UseCase<StandarPaginated, Filter> {
  final CategoriesRemoteDataSource remoteDataSource;

  FetchSubSecorsUseCase(this.remoteDataSource);

  @override
  Future<Result<StandarPaginated, Exceptions>> call(Filter params) async {
    try {
      final keyLanguage = sl<LocalDataSource>()
          .getValue(LocalDataKeys.languageKey, defaultValue: "ar");
      final result = await remoteDataSource.getSubSectors(
        language: keyLanguage,
        queries: params.toJson(),
      path: params.id!=null?"/sectors/${params.id}":"/sub-sectors/"
      );
      return Result.success(data: result.data);
    } catch (e) {
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }
}
