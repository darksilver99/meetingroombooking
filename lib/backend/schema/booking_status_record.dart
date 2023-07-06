import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingStatusRecord extends FirestoreRecord {
  BookingStatusRecord._(
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
      FirebaseFirestore.instance.collection('booking_status');

  static Stream<BookingStatusRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingStatusRecord.fromSnapshot(s));

  static Future<BookingStatusRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingStatusRecord.fromSnapshot(s));

  static BookingStatusRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingStatusRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingStatusRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingStatusRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingStatusRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingStatusRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingStatusRecordData({
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

class BookingStatusRecordDocumentEquality
    implements Equality<BookingStatusRecord> {
  const BookingStatusRecordDocumentEquality();

  @override
  bool equals(BookingStatusRecord? e1, BookingStatusRecord? e2) {
    return e1?.name == e2?.name && e1?.id == e2?.id;
  }

  @override
  int hash(BookingStatusRecord? e) =>
      const ListEquality().hash([e?.name, e?.id]);

  @override
  bool isValidKey(Object? o) => o is BookingStatusRecord;
}
