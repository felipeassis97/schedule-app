class LocationModel {
  final double? lat;
  final double? long;
  LocationModel({
    required this.lat,
    required this.long,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        lat: double.tryParse(json['lat']), long: double.tryParse(json['long']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> location = {};
    location['lat'] = lat;
    location['long'] = long;
    return location;
  }
}
