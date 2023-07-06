import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingListRecord extends FirestoreRecord {
  BookingListRecord._(
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

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "update_by" field.
  DocumentReference? _updateBy;
  DocumentReference? get updateBy => _updateBy;
  bool hasUpdateBy() => _updateBy != null;

  // "delete_date" field.
  DateTime? _deleteDate;
  DateTime? get deleteDate => _deleteDate;
  bool hasDeleteDate() => _deleteDate != null;

  // "delete_by" field.
  DocumentReference? _deleteBy;
  DocumentReference? get deleteBy => _deleteBy;
  bool hasDeleteBy() => _deleteBy != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "booking_date" field.
  DateTime? _bookingDate;
  DateTime? get bookingDate => _bookingDate;
  bool hasBookingDate() => _bookingDate != null;

  // "booking_start_time" field.
  String? _bookingStartTime;
  String get bookingStartTime => _bookingStartTime ?? '';
  bool hasBookingStartTime() => _bookingStartTime != null;

  // "booking_end_time" field.
  String? _bookingEndTime;
  String get bookingEndTime => _bookingEndTime ?? '';
  bool hasBookingEndTime() => _bookingEndTime != null;

  // "meeting_room_doc" field.
  DocumentReference? _meetingRoomDoc;
  DocumentReference? get meetingRoomDoc => _meetingRoomDoc;
  bool hasMeetingRoomDoc() => _meetingRoomDoc != null;

  // "remark_user" field.
  String? _remarkUser;
  String get remarkUser => _remarkUser ?? '';
  bool hasRemarkUser() => _remarkUser != null;

  // "remark_owner" field.
  String? _remarkOwner;
  String get remarkOwner => _remarkOwner ?? '';
  bool hasRemarkOwner() => _remarkOwner != null;

  // "owner_ref" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _deleteDate = snapshotData['delete_date'] as DateTime?;
    _deleteBy = snapshotData['delete_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _bookingDate = snapshotData['booking_date'] as DateTime?;
    _bookingStartTime = snapshotData['booking_start_time'] as String?;
    _bookingEndTime = snapshotData['booking_end_time'] as String?;
    _meetingRoomDoc = snapshotData['meeting_room_doc'] as DocumentReference?;
    _remarkUser = snapshotData['remark_user'] as String?;
    _remarkOwner = snapshotData['remark_owner'] as String?;
    _ownerRef = snapshotData['owner_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('booking_list');

  static Stream<BookingListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingListRecord.fromSnapshot(s));

  static Future<BookingListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingListRecord.fromSnapshot(s));

  static BookingListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  DateTime? deleteDate,
  DocumentReference? deleteBy,
  int? status,
  DateTime? bookingDate,
  String? bookingStartTime,
  String? bookingEndTime,
  DocumentReference? meetingRoomDoc,
  String? remarkUser,
  String? remarkOwner,
  DocumentReference? ownerRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'delete_date': deleteDate,
      'delete_by': deleteBy,
      'status': status,
      'booking_date': bookingDate,
      'booking_start_time': bookingStartTime,
      'booking_end_time': bookingEndTime,
      'meeting_room_doc': meetingRoomDoc,
      'remark_user': remarkUser,
      'remark_owner': remarkOwner,
      'owner_ref': ownerRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingListRecordDocumentEquality implements Equality<BookingListRecord> {
  const BookingListRecordDocumentEquality();

  @override
  bool equals(BookingListRecord? e1, BookingListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.deleteDate == e2?.deleteDate &&
        e1?.deleteBy == e2?.deleteBy &&
        e1?.status == e2?.status &&
        e1?.bookingDate == e2?.bookingDate &&
        e1?.bookingStartTime == e2?.bookingStartTime &&
        e1?.bookingEndTime == e2?.bookingEndTime &&
        e1?.meetingRoomDoc == e2?.meetingRoomDoc &&
        e1?.remarkUser == e2?.remarkUser &&
        e1?.remarkOwner == e2?.remarkOwner &&
        e1?.ownerRef == e2?.ownerRef;
  }

  @override
  int hash(BookingListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.deleteDate,
        e?.deleteBy,
        e?.status,
        e?.bookingDate,
        e?.bookingStartTime,
        e?.bookingEndTime,
        e?.meetingRoomDoc,
        e?.remarkUser,
        e?.remarkOwner,
        e?.ownerRef
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingListRecord;
}
