import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _appVersion = prefs.getString('ff_appVersion') ?? _appVersion;
    });
    _safeInit(() {
      _androidStoreLink =
          prefs.getString('ff_androidStoreLink') ?? _androidStoreLink;
    });
    _safeInit(() {
      _iosStoreLink = prefs.getString('ff_iosStoreLink') ?? _iosStoreLink;
    });
    _safeInit(() {
      _isEnableAd = prefs.getBool('ff_isEnableAd') ?? _isEnableAd;
    });
    _safeInit(() {
      _storeBuildVersion =
          prefs.getInt('ff_storeBuildVersion') ?? _storeBuildVersion;
    });
    _safeInit(() {
      _appBuildVersion = prefs.getInt('ff_appBuildVersion') ?? _appBuildVersion;
    });
    _safeInit(() {
      _isTesting = prefs.getBool('ff_isTesting') ?? _isTesting;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _provinceSelected = 0;
  int get provinceSelected => _provinceSelected;
  set provinceSelected(int value) {
    _provinceSelected = value;
  }

  int _amphureSelected = 0;
  int get amphureSelected => _amphureSelected;
  set amphureSelected(int value) {
    _amphureSelected = value;
  }

  int _tambonSelected = 0;
  int get tambonSelected => _tambonSelected;
  set tambonSelected(int value) {
    _tambonSelected = value;
  }

  List<String> _imageUploadList = [];
  List<String> get imageUploadList => _imageUploadList;
  set imageUploadList(List<String> value) {
    _imageUploadList = value;
  }

  void addToImageUploadList(String value) {
    imageUploadList.add(value);
  }

  void removeFromImageUploadList(String value) {
    imageUploadList.remove(value);
  }

  void removeAtIndexFromImageUploadList(int index) {
    imageUploadList.removeAt(index);
  }

  void updateImageUploadListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    imageUploadList[index] = updateFn(_imageUploadList[index]);
  }

  void insertAtIndexInImageUploadList(int index, String value) {
    imageUploadList.insert(index, value);
  }

  DocumentReference? _meetingRoomSelectedRef;
  DocumentReference? get meetingRoomSelectedRef => _meetingRoomSelectedRef;
  set meetingRoomSelectedRef(DocumentReference? value) {
    _meetingRoomSelectedRef = value;
  }

  DocumentReference? _onwerRoomSelectedRef;
  DocumentReference? get onwerRoomSelectedRef => _onwerRoomSelectedRef;
  set onwerRoomSelectedRef(DocumentReference? value) {
    _onwerRoomSelectedRef = value;
  }

  List<dynamic> _bookingStatus = [];
  List<dynamic> get bookingStatus => _bookingStatus;
  set bookingStatus(List<dynamic> value) {
    _bookingStatus = value;
  }

  void addToBookingStatus(dynamic value) {
    bookingStatus.add(value);
  }

  void removeFromBookingStatus(dynamic value) {
    bookingStatus.remove(value);
  }

  void removeAtIndexFromBookingStatus(int index) {
    bookingStatus.removeAt(index);
  }

  void updateBookingStatusAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    bookingStatus[index] = updateFn(_bookingStatus[index]);
  }

  void insertAtIndexInBookingStatus(int index, dynamic value) {
    bookingStatus.insert(index, value);
  }

  bool _isFullList = true;
  bool get isFullList => _isFullList;
  set isFullList(bool value) {
    _isFullList = value;
  }

  LatLng? _locationSelected;
  LatLng? get locationSelected => _locationSelected;
  set locationSelected(LatLng? value) {
    _locationSelected = value;
  }

  String _provinceSelectedValue = '';
  String get provinceSelectedValue => _provinceSelectedValue;
  set provinceSelectedValue(String value) {
    _provinceSelectedValue = value;
  }

  String _amphurSelectedValue = '';
  String get amphurSelectedValue => _amphurSelectedValue;
  set amphurSelectedValue(String value) {
    _amphurSelectedValue = value;
  }

  String _tambonSelectedValue = '';
  String get tambonSelectedValue => _tambonSelectedValue;
  set tambonSelectedValue(String value) {
    _tambonSelectedValue = value;
  }

  List<String> _fakeSelectedDate = [];
  List<String> get fakeSelectedDate => _fakeSelectedDate;
  set fakeSelectedDate(List<String> value) {
    _fakeSelectedDate = value;
  }

  void addToFakeSelectedDate(String value) {
    fakeSelectedDate.add(value);
  }

  void removeFromFakeSelectedDate(String value) {
    fakeSelectedDate.remove(value);
  }

  void removeAtIndexFromFakeSelectedDate(int index) {
    fakeSelectedDate.removeAt(index);
  }

  void updateFakeSelectedDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    fakeSelectedDate[index] = updateFn(_fakeSelectedDate[index]);
  }

  void insertAtIndexInFakeSelectedDate(int index, String value) {
    fakeSelectedDate.insert(index, value);
  }

  DocumentReference? _userRefBeforDelete;
  DocumentReference? get userRefBeforDelete => _userRefBeforDelete;
  set userRefBeforDelete(DocumentReference? value) {
    _userRefBeforDelete = value;
  }

  bool _isChangeProfileDetail = false;
  bool get isChangeProfileDetail => _isChangeProfileDetail;
  set isChangeProfileDetail(bool value) {
    _isChangeProfileDetail = value;
  }

  List<dynamic> _totalMeetingRoom = [];
  List<dynamic> get totalMeetingRoom => _totalMeetingRoom;
  set totalMeetingRoom(List<dynamic> value) {
    _totalMeetingRoom = value;
  }

  void addToTotalMeetingRoom(dynamic value) {
    totalMeetingRoom.add(value);
  }

  void removeFromTotalMeetingRoom(dynamic value) {
    totalMeetingRoom.remove(value);
  }

  void removeAtIndexFromTotalMeetingRoom(int index) {
    totalMeetingRoom.removeAt(index);
  }

  void updateTotalMeetingRoomAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    totalMeetingRoom[index] = updateFn(_totalMeetingRoom[index]);
  }

  void insertAtIndexInTotalMeetingRoom(int index, dynamic value) {
    totalMeetingRoom.insert(index, value);
  }

  String _appVersion = '';
  String get appVersion => _appVersion;
  set appVersion(String value) {
    _appVersion = value;
    prefs.setString('ff_appVersion', value);
  }

  String _androidStoreLink = '';
  String get androidStoreLink => _androidStoreLink;
  set androidStoreLink(String value) {
    _androidStoreLink = value;
    prefs.setString('ff_androidStoreLink', value);
  }

  String _iosStoreLink = '';
  String get iosStoreLink => _iosStoreLink;
  set iosStoreLink(String value) {
    _iosStoreLink = value;
    prefs.setString('ff_iosStoreLink', value);
  }

  bool _isEnableAd = false;
  bool get isEnableAd => _isEnableAd;
  set isEnableAd(bool value) {
    _isEnableAd = value;
    prefs.setBool('ff_isEnableAd', value);
  }

  int _storeBuildVersion = 0;
  int get storeBuildVersion => _storeBuildVersion;
  set storeBuildVersion(int value) {
    _storeBuildVersion = value;
    prefs.setInt('ff_storeBuildVersion', value);
  }

  int _appBuildVersion = 0;
  int get appBuildVersion => _appBuildVersion;
  set appBuildVersion(int value) {
    _appBuildVersion = value;
    prefs.setInt('ff_appBuildVersion', value);
  }

  bool _isTesting = false;
  bool get isTesting => _isTesting;
  set isTesting(bool value) {
    _isTesting = value;
    prefs.setBool('ff_isTesting', value);
  }
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
