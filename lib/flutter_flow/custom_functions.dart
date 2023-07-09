import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/app_state.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getMeetingStatusText(int? status) {
  List resultList = FFAppState()
      .bookingStatus
      .where((map) => map.containsValue(status))
      .toList();

  return resultList[0]["name"];
}

String? getSplitLatLng(
  String? type,
  LatLng? location,
) {
  return type == "lat"
      ? location!.latitude.toString()
      : location!.longitude.toString();
}

DateTime? setNewDateTimeForQuery(
  String? type,
  DateTime? dateTime,
) {
  DateTime newDate;
  if (type == "start") {
    newDate = DateTime(dateTime!.year, dateTime.month, dateTime.day);
  } else {
    newDate =
        DateTime(dateTime!.year, dateTime.month, dateTime.day, 23, 59, 59);
  }

  return newDate;
}

DateTime? getNextDay(int? nextDay) {
  DateTime currentDate = DateTime.now();
  DateTime futureDate = currentDate.add(Duration(days: nextDay!));
  return futureDate;
}
