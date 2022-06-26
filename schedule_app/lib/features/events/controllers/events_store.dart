import 'package:mobx/mobx.dart';
import 'package:schedule_app/features/events/models/event_model.dart';
import 'package:schedule_app/features/events/services/get_events.dart';
part 'events_store.g.dart';

class EventsStore = _EventsStoreBase with _$EventsStore;

abstract class _EventsStoreBase with Store {
  final GetEventsService service = GetEventsService();

//Event list states
  @observable
  List<EventModel> eventList = [];
  @action
  void setCurrentList(List<EventModel> value) => eventList = value;
  @action
  void clearCurrentList() => eventList.clear();

//State Loading
  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

//State Error
  @observable
  bool isError = false;
  @action
  void setIsError(bool value) => isError = value;

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

  @action
  Future<void> getEvents() async {
    try {
      initialStateLoading();

      final result = await service.getEventsList();
      setCurrentList(result);

      endStateLoading();
    } catch (_) {
      setIsError(true);
    }
  }
}
