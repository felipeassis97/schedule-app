import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:schedule_app/shared/client/schedule_client_impl.dart';
import 'package:schedule_app/shared/models/address_model.dart';
import 'package:schedule_app/shared/utils/app_configs.dart';

class GetAddressDetails {
  Future<AddressModel> getAddressByCep(context, {required String cep}) async {
    final client = Provider.of<ScheduleClientImpl>(context, listen: false);
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
