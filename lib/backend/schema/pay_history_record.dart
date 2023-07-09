import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PayHistoryRecord extends FirestoreRecord {
  PayHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _amount = castToType<double>(snapshotData['amount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pay_history');

  static Stream<PayHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PayHistoryRecord.fromSnapshot(s));

  static Future<PayHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PayHistoryRecord.fromSnapshot(s));

  static PayHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PayHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PayHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PayHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PayHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PayHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPayHistoryRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  int? status,
  double? amount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'status': status,
      'amount': amount,
    }.withoutNulls,
  );

  return firestoreData;
}

class PayHistoryRecordDocumentEquality implements Equality<PayHistoryRecord> {
  const PayHistoryRecordDocumentEquality();

  @override
  bool equals(PayHistoryRecord? e1, PayHistoryRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.status == e2?.status &&
        e1?.amount == e2?.amount;
  }

  @override
  int hash(PayHistoryRecord? e) => const ListEquality()
      .hash([e?.createDate, e?.createBy, e?.status, e?.amount]);

  @override
  bool isValidKey(Object? o) => o is PayHistoryRecord;
}
