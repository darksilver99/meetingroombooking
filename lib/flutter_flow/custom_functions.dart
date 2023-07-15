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
  String textStatus = "";
  if (FFAppState().bookingStatus.isEmpty) {
    switch (status) {
      case 0:
        {
          textStatus = "รออนุมัติ";
        }
        break;

      case 1:
        {
          textStatus = "อนุมัติแล้ว";
        }
        break;

      case 2:
        {
          textStatus = "ลบรายการแล้ว";
        }
        break;

      case 3:
        {
          textStatus = "ยกเลิก";
        }
        break;

      case 4:
        {
          textStatus = "เสร็จสิ้นการประชุมแล้ว";
        }
        break;

      default:
        {
          textStatus = "รออนุมัติ";
        }
        break;
    }
  } else {
    List resultList = FFAppState()
        .bookingStatus
        .where((map) => map.containsValue(status))
        .toList();
    textStatus = resultList[0]["name"];
  }

  return textStatus;
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
