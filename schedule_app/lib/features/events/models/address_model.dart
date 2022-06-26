// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:schedule_app/features/events/models/location_model.dart';

class AddressModel {
  final int id;
  final String zipcode;
  final String street;
  final String number;
  final String complement;
  final String neighborhood;
  final String city;
  final String uf;
  final LocationModel location;
  AddressModel({
    required this.id,
    required this.zipcode,
    required this.street,
    required this.number,
    required this.complement,
    required this.neighborhood,
    required this.city,
    required this.uf,
    required this.location,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      zipcode: json['zipcode'],
      street: json['street'],
      number: json['number'],
      complement: json['complement'],
      neighborhood: json['neighborhood'],
      city: json['city'],
      uf: json['uf'],
      location: LocationModel.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> addressData = {};
    addressData['id'] = id;
    addressData['zipcode'] = zipcode;
    addressData['street'] = street;
    addressData['number'] = number;
    addressData['complement'] = complement;
    addressData['neighborhood'] = neighborhood;
    addressData['city'] = city;
    addressData['uf'] = uf;
    addressData['location'] = location.toJson();

    return addressData;
  }
}
