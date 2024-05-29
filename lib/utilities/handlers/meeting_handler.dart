import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management_app/state/meeting_state/model/meeting.dart';
import 'package:task_management_app/utilities/constants/db_constants.dart';

class MeetingHandler {
  MeetingHandler();

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<MeetingModel>?> fetchMeetings(String userId) async {
    db.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );

    final collection = db.collection(MEETING_COLLECTION);

    final meetings = await collection.doc(userId).get();

    if (meetings.data() == null) return null;

    final test = meetings.data();

    final meetingList = (test!.values.toList()).map((e) {
      return MeetingModel.fromJson(e as Map<String, dynamic>);
    }).toList();

    return meetingList;
  }

  // Future<List<MeetingModel>?> addMeeting() async {} // TODO: implement
}
