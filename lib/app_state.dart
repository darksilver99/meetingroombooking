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

  LatLng? _locationSelected;
  LatLng? get locationSelected => _locationSelected;
  set locationSelected(LatLng? _value) {
    _locationSelected = _value;
  }

  String _provinceSelectedValue = '';
  String get provinceSelectedValue => _provinceSelectedValue;
  set provinceSelectedValue(String _value) {
    _provinceSelectedValue = _value;
  }

  String _amphurSelectedValue = '';
  String get amphurSelectedValue => _amphurSelectedValue;
  set amphurSelectedValue(String _value) {
    _amphurSelectedValue = _value;
  }

  String _tambonSelectedValue = '';
  String get tambonSelectedValue => _tambonSelectedValue;
  set tambonSelectedValue(String _value) {
    _tambonSelectedValue = _value;
  }

  List<String> _fakeSelectedDate = [];
  List<String> get fakeSelectedDate => _fakeSelectedDate;
  set fakeSelectedDate(List<String> _value) {
    _fakeSelectedDate = _value;
  }

  void addToFakeSelectedDate(String _value) {
    _fakeSelectedDate.add(_value);
  }

  void removeFromFakeSelectedDate(String _value) {
    _fakeSelectedDate.remove(_value);
  }

  void removeAtIndexFromFakeSelectedDate(int _index) {
    _fakeSelectedDate.removeAt(_index);
  }

  void updateFakeSelectedDateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _fakeSelectedDate[_index] = updateFn(_fakeSelectedDate[_index]);
  }

  DocumentReference? _userRefBeforDelete;
  DocumentReference? get userRefBeforDelete => _userRefBeforDelete;
  set userRefBeforDelete(DocumentReference? _value) {
    _userRefBeforDelete = _value;
  }

  bool _isChangeProfileDetail = false;
  bool get isChangeProfileDetail => _isChangeProfileDetail;
  set isChangeProfileDetail(bool _value) {
    _isChangeProfileDetail = _value;
  }

  List<dynamic> _totalMeetingRoom = [];
  List<dynamic> get totalMeetingRoom => _totalMeetingRoom;
  set totalMeetingRoom(List<dynamic> _value) {
    _totalMeetingRoom = _value;
  }

  void addToTotalMeetingRoom(dynamic _value) {
    _totalMeetingRoom.add(_value);
  }

  void removeFromTotalMeetingRoom(dynamic _value) {
    _totalMeetingRoom.remove(_value);
  }

  void removeAtIndexFromTotalMeetingRoom(int _index) {
    _totalMeetingRoom.removeAt(_index);
  }

  void updateTotalMeetingRoomAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _totalMeetingRoom[_index] = updateFn(_totalMeetingRoom[_index]);
  }

  String _appVersion = '';
  String get appVersion => _appVersion;
  set appVersion(String _value) {
    _appVersion = _value;
    prefs.setString('ff_appVersion', _value);
  }

  String _androidStoreLink = '';
  String get androidStoreLink => _androidStoreLink;
  set androidStoreLink(String _value) {
    _androidStoreLink = _value;
    prefs.setString('ff_androidStoreLink', _value);
  }

  String _iosStoreLink = '';
  String get iosStoreLink => _iosStoreLink;
  set iosStoreLink(String _value) {
    _iosStoreLink = _value;
    prefs.setString('ff_iosStoreLink', _value);
  }

  bool _isEnableAd = false;
  bool get isEnableAd => _isEnableAd;
  set isEnableAd(bool _value) {
    _isEnableAd = _value;
    prefs.setBool('ff_isEnableAd', _value);
  }

  int _storeBuildVersion = 0;
  int get storeBuildVersion => _storeBuildVersion;
  set storeBuildVersion(int _value) {
    _storeBuildVersion = _value;
    prefs.setInt('ff_storeBuildVersion', _value);
  }

  int _appBuildVersion = 0;
  int get appBuildVersion => _appBuildVersion;
  set appBuildVersion(int _value) {
    _appBuildVersion = _value;
    prefs.setInt('ff_appBuildVersion', _value);
  }

  bool _isTesting = false;
  bool get isTesting => _isTesting;
  set isTesting(bool _value) {
    _isTesting = _value;
    prefs.setBool('ff_isTesting', _value);
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
