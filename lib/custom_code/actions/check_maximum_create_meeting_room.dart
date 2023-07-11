// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../auth/firebase_auth/auth_util.dart';

Future<bool> checkMaximumCreateMeetingRoom() async {
  // Add your function code here!
  var rs = await FirebaseFirestore.instance
      .collection("meeting_room_list")
      .where("create_by", isEqualTo: currentUserReference)
      .where("status", isEqualTo: 1)
      .get();
  if (rs.size < currentUserDocument!.maxMeetingRoom) {
    return true;
  } else {
    return false;
  }
}
