import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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

  String _provinceTextSelected = '';
  String get provinceTextSelected => _provinceTextSelected;
  set provinceTextSelected(String _value) {
    _provinceTextSelected = _value;
  }

  String _amphureTextSelected = '';
  String get amphureTextSelected => _amphureTextSelected;
  set amphureTextSelected(String _value) {
    _amphureTextSelected = _value;
  }

  String _tambonTextSelected = '';
  String get tambonTextSelected => _tambonTextSelected;
  set tambonTextSelected(String _value) {
    _tambonTextSelected = _value;
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
