import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToolsListRecord extends FirestoreRecord {
  ToolsListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tools_list');

  static Stream<ToolsListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToolsListRecord.fromSnapshot(s));

  static Future<ToolsListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToolsListRecord.fromSnapshot(s));

  static ToolsListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ToolsListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToolsListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToolsListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToolsListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToolsListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToolsListRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}
