// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:schedule_app/shared/models/location_model.dart';

class AddressModel {
  final int? id;
  final String zipcode;
  final String street;
  final String? number;
  final String? complement;
  final String neighborhood;
  final String city;
  final String uf;
  final LocationModel? location;
  AddressModel({
    this.id,
    required this.zipcode,
    required this.street,
    this.number,
    this.complement,
    required this.neighborhood,
    required this.city,
    required this.uf,
    this.location,
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
      location: json['location'] != null
          ? LocationModel.fromJson(json['location'])
          : null,
    );
  }

  factory AddressModel.fromJsonByViacep(Map<String, dynamic> json) {
    return AddressModel(
      zipcode: json['cep'],
      street: json['logradouro'],
      neighborhood: json['bairro'],
      city: json['localidade'],
      uf: json['uf'],
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
    addressData['location'] = location?.toJson();

    return addressData;
  }
}
