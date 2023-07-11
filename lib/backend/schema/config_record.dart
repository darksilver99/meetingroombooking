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

  // "store_version" field.
  String? _storeVersion;
  String get storeVersion => _storeVersion ?? '';
  bool hasStoreVersion() => _storeVersion != null;

  // "android_store_link" field.
  String? _androidStoreLink;
  String get androidStoreLink => _androidStoreLink ?? '';
  bool hasAndroidStoreLink() => _androidStoreLink != null;

  // "ios_store_link" field.
  String? _iosStoreLink;
  String get iosStoreLink => _iosStoreLink ?? '';
  bool hasIosStoreLink() => _iosStoreLink != null;

  void _initializeFields() {
    _storeVersion = snapshotData['store_version'] as String?;
    _androidStoreLink = snapshotData['android_store_link'] as String?;
    _iosStoreLink = snapshotData['ios_store_link'] as String?;
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
  String? storeVersion,
  String? androidStoreLink,
  String? iosStoreLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'store_version': storeVersion,
      'android_store_link': androidStoreLink,
      'ios_store_link': iosStoreLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfigRecordDocumentEquality implements Equality<ConfigRecord> {
  const ConfigRecordDocumentEquality();

  @override
  bool equals(ConfigRecord? e1, ConfigRecord? e2) {
    return e1?.storeVersion == e2?.storeVersion &&
        e1?.androidStoreLink == e2?.androidStoreLink &&
        e1?.iosStoreLink == e2?.iosStoreLink;
  }

  @override
  int hash(ConfigRecord? e) => const ListEquality()
      .hash([e?.storeVersion, e?.androidStoreLink, e?.iosStoreLink]);

  @override
  bool isValidKey(Object? o) => o is ConfigRecord;
}
