import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management_app/state/meeting_state/model/event.dart';
import 'package:task_management_app/utilities/constants/db_constants.dart';

class EventsHandler {
  EventsHandler();

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<EventModel>?> fetchEvents(String userId) async {
    db.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );

    final collection = db.collection(EVENT_COLLECTION);

    final events = await collection.doc(userId).get();

    if (events.data() == null) return null;

    final test = events.data();

    final eventsList = (test!.values.toList()).map((e) {
      return EventModel.fromJson(e as Map<String, dynamic>);
    }).toList();

    return eventsList;
  }

  // Future<List<MeetingModel>?> addMeeting() async {} // TODO: implement
}
