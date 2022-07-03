import 'package:geocoding/geocoding.dart';
import 'package:schedule_app/shared/models/location_model.dart';

class GetCordinatesByAddress {
  Future<LocationModel> cordinatesAddressByCep(
      {required String address}) async {
    try {
      List<Location> locations =
          await locationFromAddress(address, localeIdentifier: "pt_BR");

      return LocationModel(
          lat: locations.first.latitude, long: locations.first.longitude);
    } catch (_) {
      throw Exception();
    }
  }
}
