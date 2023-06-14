import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AmphurRecord extends FirestoreRecord {
  AmphurRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "province_id" field.
  int? _provinceId;
  int get provinceId => _provinceId ?? 0;
  bool hasProvinceId() => _provinceId != null;

  void _initializeFields() {
    _id = snapshotData['id'] as int?;
    _name = snapshotData['name'] as String?;
    _provinceId = snapshotData['province_id'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('amphur');

  static Stream<AmphurRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AmphurRecord.fromSnapshot(s));

  static Future<AmphurRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AmphurRecord.fromSnapshot(s));

  static AmphurRecord fromSnapshot(DocumentSnapshot snapshot) => AmphurRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AmphurRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AmphurRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AmphurRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AmphurRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAmphurRecordData({
  int? id,
  String? name,
  int? provinceId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'province_id': provinceId,
    }.withoutNulls,
  );

  return firestoreData;
}
