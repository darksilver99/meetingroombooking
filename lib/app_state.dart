import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _provinceSelected = 0;
  int get provinceSelected => _provinceSelected;
  set provinceSelected(int _value) {
    _provinceSelected = _value;
  }

  int _amphureSelected = 0;
  int get amphureSelected => _amphureSelected;
  set amphureSelected(int _value) {
    _amphureSelected = _value;
  }

  int _tambonSelected = 0;
  int get tambonSelected => _tambonSelected;
  set tambonSelected(int _value) {
    _tambonSelected = _value;
  }

  List<String> _imageUploadList = [];
  List<String> get imageUploadList => _imageUploadList;
  set imageUploadList(List<String> _value) {
    _imageUploadList = _value;
  }

  void addToImageUploadList(String _value) {
    _imageUploadList.add(_value);
  }

  void removeFromImageUploadList(String _value) {
    _imageUploadList.remove(_value);
  }

  void removeAtIndexFromImageUploadList(int _index) {
    _imageUploadList.removeAt(_index);
  }

  void updateImageUploadListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _imageUploadList[_index] = updateFn(_imageUploadList[_index]);
  }

  DocumentReference? _meetingRoomSelectedRef;
  DocumentReference? get meetingRoomSelectedRef => _meetingRoomSelectedRef;
  set meetingRoomSelectedRef(DocumentReference? _value) {
    _meetingRoomSelectedRef = _value;
  }

  DocumentReference? _onwerRoomSelectedRef;
  DocumentReference? get onwerRoomSelectedRef => _onwerRoomSelectedRef;
  set onwerRoomSelectedRef(DocumentReference? _value) {
    _onwerRoomSelectedRef = _value;
  }

  List<dynamic> _bookingStatus = [];
  List<dynamic> get bookingStatus => _bookingStatus;
  set bookingStatus(List<dynamic> _value) {
    _bookingStatus = _value;
  }

  void addToBookingStatus(dynamic _value) {
    _bookingStatus.add(_value);
  }

  void removeFromBookingStatus(dynamic _value) {
    _bookingStatus.remove(_value);
  }

  void removeAtIndexFromBookingStatus(int _index) {
    _bookingStatus.removeAt(_index);
  }

  void updateBookingStatusAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _bookingStatus[_index] = updateFn(_bookingStatus[_index]);
  }

  bool _isFullList = true;
  bool get isFullList => _isFullList;
  set isFullList(bool _value) {
    _isFullList = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
