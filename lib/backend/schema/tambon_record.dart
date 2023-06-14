import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TambonRecord extends FirestoreRecord {
  TambonRecord._(
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

  // "amphure_id" field.
  int? _amphureId;
  int get amphureId => _amphureId ?? 0;
  bool hasAmphureId() => _amphureId != null;

  void _initializeFields() {
    _id = snapshotData['id'] as int?;
    _name = snapshotData['name'] as String?;
    _amphureId = snapshotData['amphure_id'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tambon');

  static Stream<TambonRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TambonRecord.fromSnapshot(s));

  static Future<TambonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TambonRecord.fromSnapshot(s));

  static TambonRecord fromSnapshot(DocumentSnapshot snapshot) => TambonRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TambonRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TambonRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TambonRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TambonRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTambonRecordData({
  int? id,
  String? name,
  int? amphureId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'amphure_id': amphureId,
    }.withoutNulls,
  );

  return firestoreData;
}
