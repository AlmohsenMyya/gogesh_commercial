import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/excptions/exceptions.dart';
import '../../../core/result/result.dart';
import '../../../core/use_case/use_case.dart';
import '../../../data/local_data_source/local_data_keys.dart';
import '../../../data/local_data_source/local_data_source.dart';

class DetermineLocationUseCase extends UseCase<Position, NoParams> {
  @override
  Future<Result<Position, Exception>> call(NoParams params) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const Result.failure(
          error: Exceptions.other('Location services are disabled.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return const Result.failure(
            error: Exceptions.other('Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return const Result.failure(
          error: Exceptions.other(
              'Location permissions are permanently denied, we cannot request permissions.'));
    }
    final location = await Geolocator.getCurrentPosition();

    return Result.success(data: location);
  }


  Future<Result<LocationData, Exceptions>> getLocationData() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const Result.failure(
          error: Exceptions.locationServiceNotEnabled(
              'Location services are disabled.'));
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return const Result.failure(
            error: Exceptions.other('Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return const Result.failure(
          error: Exceptions.other(
              'Location permissions are permanently denied, we cannot request permissions.'));
    }

    final location = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    final country = placemarks.first.country;
    final region = ((placemarks.first.subAdministrativeArea?.isEmpty) ?? true)
        ? placemarks.first.administrativeArea
        : placemarks.first.subAdministrativeArea;
    final city = placemarks.first.locality;
    final dialCode=placemarks.first.isoCountryCode;

    return Result.success(
        data: LocationData(country ?? "", city ?? "", region ?? "",dialCode??""));
  }
  Future<Result<LocationLatLon, Exceptions>> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const Result.failure(
          error: Exceptions.locationServiceNotEnabled(
              'Location services are disabled.'));
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return const Result.failure(
            error: Exceptions.other('Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return const Result.failure(
          error: Exceptions.other(
              'Location permissions are permanently denied, we cannot request permissions.'));
    }

    final location = await Geolocator.getCurrentPosition();

    return Result.success(
        data: LocationLatLon(
            latitude: location.latitude.toString(),
            longitude: location.longitude.toString()));
  }
}

class LocationData extends Equatable {
  final String country;
  final String city;
  final String region;
  final String dialCode;

  const LocationData(this.country, this.city, this.region,this.dialCode);

  @override
  List<Object?> get props => [country, city, region];
}



class LocationLatLon extends Equatable {
  final String latitude;
  final String longitude;

  const LocationLatLon({required this.longitude, required this.latitude});

  @override
  List<Object?> get props => [longitude, latitude];
}
