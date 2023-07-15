import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigRecord extends FirestoreRecord {
  ConfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "android_store_link" field.
  String? _androidStoreLink;
  String get androidStoreLink => _androidStoreLink ?? '';
  bool hasAndroidStoreLink() => _androidStoreLink != null;

  // "ios_store_link" field.
  String? _iosStoreLink;
  String get iosStoreLink => _iosStoreLink ?? '';
  bool hasIosStoreLink() => _iosStoreLink != null;

  // "enable_ad" field.
  bool? _enableAd;
  bool get enableAd => _enableAd ?? false;
  bool hasEnableAd() => _enableAd != null;

  // "store_version" field.
  int? _storeVersion;
  int get storeVersion => _storeVersion ?? 0;
  bool hasStoreVersion() => _storeVersion != null;

  // "is_testing" field.
  bool? _isTesting;
  bool get isTesting => _isTesting ?? false;
  bool hasIsTesting() => _isTesting != null;

  void _initializeFields() {
    _androidStoreLink = snapshotData['android_store_link'] as String?;
    _iosStoreLink = snapshotData['ios_store_link'] as String?;
    _enableAd = snapshotData['enable_ad'] as bool?;
    _storeVersion = castToType<int>(snapshotData['store_version']);
    _isTesting = snapshotData['is_testing'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('config');

  static Stream<ConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfigRecord.fromSnapshot(s));

  static Future<ConfigRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfigRecord.fromSnapshot(s));

  static ConfigRecord fromSnapshot(DocumentSnapshot snapshot) => ConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfigRecordData({
  String? androidStoreLink,
  String? iosStoreLink,
  bool? enableAd,
  int? storeVersion,
  bool? isTesting,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'android_store_link': androidStoreLink,
      'ios_store_link': iosStoreLink,
      'enable_ad': enableAd,
      'store_version': storeVersion,
      'is_testing': isTesting,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfigRecordDocumentEquality implements Equality<ConfigRecord> {
  const ConfigRecordDocumentEquality();

  @override
  bool equals(ConfigRecord? e1, ConfigRecord? e2) {
    return e1?.androidStoreLink == e2?.androidStoreLink &&
        e1?.iosStoreLink == e2?.iosStoreLink &&
        e1?.enableAd == e2?.enableAd &&
        e1?.storeVersion == e2?.storeVersion &&
        e1?.isTesting == e2?.isTesting;
  }

  @override
  int hash(ConfigRecord? e) => const ListEquality().hash([
        e?.androidStoreLink,
        e?.iosStoreLink,
        e?.enableAd,
        e?.storeVersion,
        e?.isTesting
      ]);

  @override
  bool isValidKey(Object? o) => o is ConfigRecord;
}
