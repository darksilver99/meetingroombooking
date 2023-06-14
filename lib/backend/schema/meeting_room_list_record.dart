import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeetingRoomListRecord extends FirestoreRecord {
  MeetingRoomListRecord._(
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

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "support_total" field.
  int? _supportTotal;
  int get supportTotal => _supportTotal ?? 0;
  bool hasSupportTotal() => _supportTotal != null;

  // "province" field.
  String? _province;
  String get province => _province ?? '';
  bool hasProvince() => _province != null;

  // "amphur" field.
  String? _amphur;
  String get amphur => _amphur ?? '';
  bool hasAmphur() => _amphur != null;

  // "tambon" field.
  String? _tambon;
  String get tambon => _tambon ?? '';
  bool hasTambon() => _tambon != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "photo" field.
  List<String>? _photo;
  List<String> get photo => _photo ?? const [];
  bool hasPhoto() => _photo != null;

  // "tools" field.
  List<String>? _tools;
  List<String> get tools => _tools ?? const [];
  bool hasTools() => _tools != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _deleteDate = snapshotData['delete_date'] as DateTime?;
    _deleteBy = snapshotData['delete_by'] as DocumentReference?;
    _status = snapshotData['status'] as int?;
    _name = snapshotData['name'] as String?;
    _detail = snapshotData['detail'] as String?;
    _supportTotal = snapshotData['support_total'] as int?;
    _province = snapshotData['province'] as String?;
    _amphur = snapshotData['amphur'] as String?;
    _tambon = snapshotData['tambon'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _photo = getDataList(snapshotData['photo']);
    _tools = getDataList(snapshotData['tools']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meeting_room_list');

  static Stream<MeetingRoomListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeetingRoomListRecord.fromSnapshot(s));

  static Future<MeetingRoomListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeetingRoomListRecord.fromSnapshot(s));

  static MeetingRoomListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeetingRoomListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeetingRoomListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeetingRoomListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeetingRoomListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeetingRoomListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeetingRoomListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  DateTime? deleteDate,
  DocumentReference? deleteBy,
  int? status,
  String? name,
  String? detail,
  int? supportTotal,
  String? province,
  String? amphur,
  String? tambon,
  LatLng? location,
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
      'name': name,
      'detail': detail,
      'support_total': supportTotal,
      'province': province,
      'amphur': amphur,
      'tambon': tambon,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}
