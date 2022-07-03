import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:schedule_app/features/create_event/services/get_address_details.dart';
import 'package:schedule_app/features/create_event/services/get_cordinates_by_address.dart';
import 'package:schedule_app/features/create_event/services/save_local_event.dart';
import 'package:schedule_app/features/list_events/model/event_model.dart';
part '../../list_events/controllers/create_event_store.g.dart';

class CreateEventStore = _CreateEventStoreBase with _$CreateEventStore;

abstract class _CreateEventStoreBase with Store {
  final addressDetails = GetAddressDetails();
  final getCordinatesByAddress = GetCordinatesByAddress();
  final localEvent = SaveLocalEvent();

//States
  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  bool isError = false;
  @action
  void setIsError(bool value) => isError = value;

//Fields
  //Event Info
  @observable
  TextEditingController eventName = TextEditingController();
  @observable
  bool hasErrorEventName = false;

  @action
  void setHasErrorEventName(bool value) => hasErrorEventName = value;

  @observable
  TextEditingController eventDescription = TextEditingController();
  @observable
  bool hasErrorEventDescription = false;
  @action
  void setHasErrorEventDescription(bool value) =>
      hasErrorEventDescription = value;

  //Date and hour
  @observable
  TextEditingController dateEvent = TextEditingController();
  @observable
  bool hasErrorDateEvent = false;
  @action
  void setHasErrorDateEvent(bool value) => hasErrorDateEvent = value;

  @observable
  TextEditingController startTime = TextEditingController();
  @observable
  bool hasErrorStartTime = false;
  @action
  void setHasErrorStartTime(bool value) => hasErrorStartTime = value;

  @observable
  TextEditingController endTime = TextEditingController();
  @observable
  bool hasErrorEndTime = false;
  @action
  void setHasErrorEndTime(bool value) => hasErrorEndTime = value;

  //Event Location
  @observable
  TextEditingController zipcode = TextEditingController();
  @observable
  bool hasErrorZipcode = false;
  @action
  void setHasErrorZipcode(bool value) => hasErrorZipcode = value;

  @observable
  TextEditingController street = TextEditingController();
  @observable
  bool hasErrorStreet = false;
  @action
  void setHasErrorStreet(bool value) => hasErrorStreet = value;

  @observable
  TextEditingController number = TextEditingController();
  @observable
  bool hasErrorNumber = false;
  @action
  void setHasErrorNumber(bool value) => hasErrorNumber = value;

  @observable
  TextEditingController neighborhood = TextEditingController();
  @observable
  bool hasErrorNeighborhood = false;
  @action
  void setHasErrorNeighborhood(bool value) => hasErrorNeighborhood = value;

  @observable
  TextEditingController city = TextEditingController();
  @observable
  bool hasErrorCity = false;
  @action
  void setHasErrorCity(bool value) => hasErrorCity = value;

  @observable
  TextEditingController uf = TextEditingController();
  @observable
  bool hasErrorUf = false;
  @action
  void setHasErrorUf(bool value) => hasErrorUf = value;

  @action
  bool validateForm() {
    if (eventName.text.isEmpty) {
      setHasErrorEventName(true);
      return false;
    } else if (eventDescription.text.isEmpty) {
      setHasErrorEventDescription(true);
      return false;
    } else if (dateEvent.text.isEmpty) {
      setHasErrorDateEvent(true);
      return false;
    } else if (startTime.text.isEmpty) {
      setHasErrorStartTime(true);
      return false;
    } else if (endTime.text.isEmpty) {
      setHasErrorEndTime(true);
      return false;
    } else if (zipcode.text.isEmpty) {
      setHasErrorZipcode(true);
      return false;
    } else if (street.text.isEmpty) {
      setHasErrorStreet(true);
      return false;
    } else if (number.text.isEmpty) {
      setHasErrorNumber(true);
      return false;
    } else if (neighborhood.text.isEmpty) {
      setHasErrorNeighborhood(true);
      return false;
    } else if (city.text.isEmpty) {
      setHasErrorCity(true);
      return false;
    } else if (uf.text.isEmpty) {
      setHasErrorUf(true);
      return false;
    } else {
      return true;
    }
  }

//Show date picker
  @action
  Future<void> datePicker(context,
      {required TextEditingController controller}) async {
    DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (_pickedDate != null) {
      String _formattedDate = DateFormat('dd/MM/yyyy').format(_pickedDate);
      controller.text = _formattedDate;
    }
  }

//Show time picker
  @action
  Future<void> timePicker(context,
      {required TextEditingController controller}) async {
    final TimeOfDay? _result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child!);
        });
    if (_result != null) {
      String _formatTime = _result.format(context);
      controller.text = _formatTime;
    }
  }

  //Address details by cep
  @action
  Future<void> getDetailsAddress(context, {required String cep}) async {
    try {
      initialStateLoading();

      setHasErrorZipcode(false);
      final result = await addressDetails.getAddressByCep(context, cep: cep);
      zipcode.text = result.zipcode;
      street.text = result.street;
      neighborhood.text = result.neighborhood;
      city.text = result.city;
      uf.text = result.uf;
      setHasErrorStreet(false);
      setHasErrorNeighborhood(false);
      setHasErrorCity(false);
      setHasErrorUf(false);
      endStateLoading();
    } catch (_) {
      zipcode.text = '';
      street.text = '';
      neighborhood.text = '';
      city.text = '';
      uf.text = '';

      setHasErrorZipcode(true);
      setIsError(true);
    }
  }

  //States get events
  @action
  void initialStateLoading() {
    setIsError(false);
    setIsLoading(true);
  }

  @action
  void endStateLoading() {
    setIsLoading(false);
    setIsError(false);
  }

  //Address details by cep
  @action
  Future<void> cordinatesByAddress() async {
    initialStateLoading();
    final String formatedAddress =
        '${street.text}, ${number.text}, ${neighborhood.text}, ${city.text}';

    try {
      final cordinates = getCordinatesByAddress.cordinatesAddressByCep(
          address: formatedAddress);

      inspect(cordinates);

      endStateLoading();
    } catch (_) {
      setIsError(true);
    }
  }

  @action
  Future<void> saveEventStorage({required EventModel event}) async {
    initialStateLoading();
    try {
      final result = localEvent.saveLocalEvent(event: event);
      inspect(result);
      endStateLoading();
    } catch (_) {
      setIsError(true);
    }
  }
}
