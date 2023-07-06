import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProvinceRecord extends FirestoreRecord {
  ProvinceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _id = castToType<int>(snapshotData['id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('province');

  static Stream<ProvinceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProvinceRecord.fromSnapshot(s));

  static Future<ProvinceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProvinceRecord.fromSnapshot(s));

  static ProvinceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProvinceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProvinceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProvinceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProvinceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProvinceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProvinceRecordData({
  String? name,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProvinceRecordDocumentEquality implements Equality<ProvinceRecord> {
  const ProvinceRecordDocumentEquality();

  @override
  bool equals(ProvinceRecord? e1, ProvinceRecord? e2) {
    return e1?.name == e2?.name && e1?.id == e2?.id;
  }

  @override
  int hash(ProvinceRecord? e) => const ListEquality().hash([e?.name, e?.id]);

  @override
  bool isValidKey(Object? o) => o is ProvinceRecord;
}
