import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AmphureRecord extends FirestoreRecord {
  AmphureRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "province_id" field.
  int? _provinceId;
  int get provinceId => _provinceId ?? 0;
  bool hasProvinceId() => _provinceId != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _provinceId = castToType<int>(snapshotData['province_id']);
    _id = castToType<int>(snapshotData['id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('amphure');

  static Stream<AmphureRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AmphureRecord.fromSnapshot(s));

  static Future<AmphureRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AmphureRecord.fromSnapshot(s));

  static AmphureRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AmphureRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AmphureRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AmphureRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AmphureRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AmphureRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAmphureRecordData({
  String? name,
  int? provinceId,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'province_id': provinceId,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class AmphureRecordDocumentEquality implements Equality<AmphureRecord> {
  const AmphureRecordDocumentEquality();

  @override
  bool equals(AmphureRecord? e1, AmphureRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.provinceId == e2?.provinceId &&
        e1?.id == e2?.id;
  }

  @override
  int hash(AmphureRecord? e) =>
      const ListEquality().hash([e?.name, e?.provinceId, e?.id]);

  @override
  bool isValidKey(Object? o) => o is AmphureRecord;
}
