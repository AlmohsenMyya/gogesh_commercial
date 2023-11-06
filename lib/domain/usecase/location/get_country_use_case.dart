// import 'dart:io';

// import '../../../core/excptions/exceptions.dart';
// import '../../../core/fillters/filter.dart';
// import '../../../core/result/result.dart';
// import '../../../core/use_case/use_case.dart';
// import '../../../data/local_data_source/db_provider.dart';

// import '../../entities/location_entity/country_entity.dart';

// class GetCountryUseCase extends UseCase<List<Datacountry>, Filter> {
//   final DBProvider dbProvider;

//   GetCountryUseCase({required this.dbProvider});

//   @override
//   Future<Result<List<Datacountry>, Exceptions>> call(Filter params) async {
//     try {
//       final result = await dbProvider.getCountries(name: params.q);

//       return Result.success(data: result);
//     } catch (e) {
//       return const Result.failure(
//           error: Exceptions.other("something_went_wrong"));
//     }
//   }
// }
import 'package:commmercial_directory_seller/app/locator.dart';
import 'package:commmercial_directory_seller/core/paginated/standar_paginated/standar_paginated.dart';
import 'package:commmercial_directory_seller/data/auth_data_source/auth_data_source.dart';
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

class GetCountryUseCase implements UseCase<StandarPaginated, Filter> {
  final AuthRemoteDataSource remoteDataSource;

  GetCountryUseCase(this.remoteDataSource);

  @override
  Future<Result<StandarPaginated, Exceptions>> call(Filter params) async {
    try {
      final keyLanguage = sl<LocalDataSource>()
          .getValue(LocalDataKeys.languageKey, defaultValue: "ar");
      params.id = null;
    
      final result = await remoteDataSource.getCountry(
          language: keyLanguage, queries: params.toJson(), path:'/countries/');
      return Result.success(data: result.data);
    } catch (e) {
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }
}
