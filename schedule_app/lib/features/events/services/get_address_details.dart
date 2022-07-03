import 'dart:developer';

import 'package:schedule_app/features/events/models/address_model.dart';
import 'package:schedule_app/shared/client/schedule_client_impl.dart';
import 'package:schedule_app/shared/utils/app_configs.dart';

class GetAddressDetails {
  final client = ScheduleClientImpl();

  Future<AddressModel> getAddressByCep({required String cep}) async {
    final response =
        await client.get('${AppConfigs.baseUrlSearchCep}/$cep/json/');
    if (response.statusCode == 200) {
      inspect(response);
      return AddressModel.fromJsonByViacep(response.data);
    } else {
      throw Exception();
    }
  }
}
