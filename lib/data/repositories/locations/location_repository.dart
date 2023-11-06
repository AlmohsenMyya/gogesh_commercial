// import 'package:commmercial_directory_seller/data/local_data_source/local_data_keys.dart';
// import 'package:commmercial_directory_seller/data/local_data_source/local_data_source.dart';
// import 'package:commmercial_directory_seller/data/repositories/ads_repository.dart';

// import '../../auth_data_source/auth_data_source.dart';
// import '../../local_data_source/db_provider.dart';

// class LocationRepository {
//   final DBProvider dbProvider;
//   final AuthRemoteDataSource dataSource;
//   final LocalDataSource localDataSource;
//   LocationRepository(
//       {required this.dbProvider,
//       required this.dataSource,
//       required this.localDataSource});
//   String _getKeyLanguage() {
//     return localDataSource.getValue(LocalDataKeys.languageKey,defaultValue: "ar");
//   }

//   Future<void> updateCountriesLocal() async {
//     try {
//       final result = await dataSource.getCountry(language: _getKeyLanguage());
//       if (result.response.statusCode!.isOk) {
//         await dbProvider.saveCountries(result.data.data);
//       }
//       return;
//     } catch (_) {
//       return;
//     }
//   }

//   Future<void> updateRegionsLocal() async {
//     try {
//       final result = await dataSource.getRegion(language: _getKeyLanguage());
//       if (result.response.statusCode!.isOk) {
//         await dbProvider.saveRegions(result.data.data ?? []);
//       }
//       return;
//     } catch (_) {
//       return;
//     }
//   }

//   Future<void> updateCitiesLocal() async {
//     try {
//       final result = await dataSource.getCity(language: _getKeyLanguage());
//       if (result.response.statusCode!.isOk) {
//         await dbProvider.saveCities(result.data.data ?? []);
//       }
//       return;
//     } catch (_) {
//       return;
//     }
//   }
// }
