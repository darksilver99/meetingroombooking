// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> getProvinceID(String? province) async {
  // Add your function code here!
  var rs = await FirebaseFirestore.instance
      .collection("province")
      .where("name", isEqualTo: province)
      .get();
  return rs.docs[0].data()["id"];
}
