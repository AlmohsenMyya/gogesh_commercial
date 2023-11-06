import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/core/paginated/standar_paginated/standar_paginated.dart';
import 'package:commmercial_directory_seller/data/categories_data_source/categories_data_source.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';

import '../../../core/excptions/exceptions.dart';
import '../../../core/fillters/filter.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../../data/local_data_source/db_provider.dart';
import '../../entities/standard_entity/standar_response.dart';

class FetchServicesUseCase implements UseCase<StandarPaginated, Filter> {
  final CategoriesRemoteDataSource remoteDataSource;

  FetchServicesUseCase(this.remoteDataSource);

  @override
  Future<Result<StandarPaginated, Exceptions>> call(Filter params) async {
    try {
      final keyLanguage = sl<LocalDataSource>()
          .getValue(LocalDataKeys.languageKey, defaultValue: "ar");
      final result = await remoteDataSource.getServices(
        language: keyLanguage,
        queries: params.toJson(),
      );
      return Result.success(data: result.data);
    } catch (e) {
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }
}
