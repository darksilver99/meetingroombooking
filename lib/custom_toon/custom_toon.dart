import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, int>>> findTotalMeetingRoomEachPlace(type, province, amphur) async {
  List<Map<String, int>> list = [];

  if (type == "province") {
    print("findTotalMeetingRoomEachPlace 1");
    var rsMeeting = await FirebaseFirestore.instance.collection("meeting_room_list").where('status', isEqualTo: 1).get();
    for (var i = 0; i < rsMeeting.size; i++) {
      int index = list.indexWhere((element) => element.containsKey(rsMeeting.docs[i].data()["province"]));
      if (index != -1) {
        list[index][rsMeeting.docs[i].data()["province"]] = (list[index][rsMeeting.docs[i].data()["province"]] ?? 0) + 1;
      } else {
        list.add({rsMeeting.docs[i].data()["province"]: 1});
      }
    }
  } else if (type == "amphur") {
    print("findTotalMeetingRoomEachPlace 2");
    print(province);
    var rsMeeting = await FirebaseFirestore.instance.collection("meeting_room_list").where('status', isEqualTo: 1).where('province', isEqualTo: province).get();
    for (var i = 0; i < rsMeeting.size; i++) {
      int index = list.indexWhere((element) => element.containsKey(rsMeeting.docs[i].data()["amphur"]));
      if (index != -1) {
        list[index][rsMeeting.docs[i].data()["amphur"]] = (list[index][rsMeeting.docs[i].data()["amphur"]] ?? 0) + 1;
      } else {
        list.add({rsMeeting.docs[i].data()["amphur"]: 1});
      }
    }
  } else if (type == "tambon") {
    print("findTotalMeetingRoomEachPlace 3");
    print(province);
    print(amphur);
    var rsMeeting = await FirebaseFirestore.instance.collection("meeting_room_list").where('status', isEqualTo: 1).where('province', isEqualTo: province).where('amphur', isEqualTo: amphur).get();
    for (var i = 0; i < rsMeeting.size; i++) {
      int index = list.indexWhere((element) => element.containsKey(rsMeeting.docs[i].data()["tambon"]));
      if (index != -1) {
        list[index][rsMeeting.docs[i].data()["tambon"]] = (list[index][rsMeeting.docs[i].data()["tambon"]] ?? 0) + 1;
      } else {
        list.add({rsMeeting.docs[i].data()["tambon"]: 1});
      }
    }
  }
  return list;
}

String getTotal(name, list) {
  String newString = name;
  bool keyExists = list.any((Map<String, int> element) => element.containsKey(name));
  if (keyExists) {
    int value = list.firstWhere((Map<String, int> element) => element.containsKey(name))[name];
    newString = "$name ($value)";
  }
  return newString;
}
