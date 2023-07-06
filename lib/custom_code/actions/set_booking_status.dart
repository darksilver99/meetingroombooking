// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future setBookingStatus() async {
  // Add your function code here!
  var rs = await FirebaseFirestore.instance.collection("booking_status").get();
  List<Map<String, dynamic>> tmp = [];
  for (var i = 0; i < rs.size; i++) {
    tmp.add({"id": rs.docs[i].data()["id"], "name": rs.docs[i].data()["name"]});
  }
  FFAppState().bookingStatus = tmp;
}
