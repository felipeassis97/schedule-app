// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventsStore on _EventsStoreBase, Store {
  late final _$eventListAtom =
      Atom(name: '_EventsStoreBase.eventList', context: context);

  @override
  List<EventModel> get eventList {
    _$eventListAtom.reportRead();
    return super.eventList;
  }

  @override
  set eventList(List<EventModel> value) {
    _$eventListAtom.reportWrite(value, super.eventList, () {
      super.eventList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_EventsStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_EventsStoreBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$getEventsAsyncAction =
      AsyncAction('_EventsStoreBase.getEvents', context: context);

  @override
  Future<void> getEvents(dynamic context) {
    return _$getEventsAsyncAction.run(() => super.getEvents(context));
  }

  late final _$_EventsStoreBaseActionController =
      ActionController(name: '_EventsStoreBase', context: context);

  @override
  void setCurrentList(List<EventModel> value) {
    final _$actionInfo = _$_EventsStoreBaseActionController.startAction(
        name: '_EventsStoreBase.setCurrentList');
    try {
      return super.setCurrentList(value);
    } finally {
      _$_EventsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCurrentList() {
    final _$actionInfo = _$_EventsStoreBaseActionController.startAction(
        name: '_EventsStoreBase.clearCurrentList');
    try {
      return super.clearCurrentList();
    } finally {
      _$_EventsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_EventsStoreBaseActionController.startAction(
        name: '_EventsStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_EventsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsError(bool value) {
    final _$actionInfo = _$_EventsStoreBaseActionController.startAction(
        name: '_EventsStoreBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_EventsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initialStateLoading() {
    final _$actionInfo = _$_EventsStoreBaseActionController.startAction(
        name: '_EventsStoreBase.initialStateLoading');
    try {
      return super.initialStateLoading();
    } finally {
      _$_EventsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void endStateLoading() {
    final _$actionInfo = _$_EventsStoreBaseActionController.startAction(
        name: '_EventsStoreBase.endStateLoading');
    try {
      return super.endStateLoading();
    } finally {
      _$_EventsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
eventList: ${eventList},
isLoading: ${isLoading},
isError: ${isError}
    ''';
  }
}
