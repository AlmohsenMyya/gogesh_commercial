import 'package:commmercial_directory_seller/data/auth_data_source/auth_data_source.dart';

import '../../../core/excptions/exceptions.dart';
import '../../../core/fillters/filter.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../../data/local_data_source/db_provider.dart';
import '../../entities/location_entity/region_entity.dart';

// class GetRegionUseCase extends UseCase<List<DataRegion>, Filter> {
//   final DBProvider dbProvider;

//   GetRegionUseCase({required this.dbProvider});

//   @override
//   Future<Result<List<DataRegion>, Exceptions>> call(
//     Filter params,
//   ) async {
//     try {
//       final result = await dbProvider.getRegions(
//           countryId: params.id ?? 1, name: params.q);
//       return Result.success(data: result);
//     } catch (e) {
//       return const Result.failure(
//           error: Exceptions.other("something_went_wrong"));
//     }
//   }
// }
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

class GetRegionUseCase implements UseCase<StandarPaginated , Filter> {
  final AuthRemoteDataSource remoteDataSource;

  GetRegionUseCase(this.remoteDataSource);

  @override
  Future<Result<StandarPaginated , Exceptions>> call(Filter params) async {
    try {
      final id=params.id;
      params.id=null;
      final keyLanguage = sl<LocalDataSource>().getValue(LocalDataKeys.languageKey,defaultValue: "ar");
      final result = await remoteDataSource.getCity(
        language:keyLanguage ,
         queries: params.toJson(), path: '/cities/$id/regions');
      return Result.success(data: result.data);
    } catch (e) {
      return const Result.failure(
          error: Exceptions.other("something_went_wrong"));
    }
  }
}