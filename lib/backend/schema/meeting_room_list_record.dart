import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

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
    _status = castToType<int>(snapshotData['status']);
    _name = snapshotData['name'] as String?;
    _detail = snapshotData['detail'] as String?;
    _supportTotal = castToType<int>(snapshotData['support_total']);
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

  static MeetingRoomListRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      MeetingRoomListRecord.getDocumentFromData(
        {
          'create_date': convertAlgoliaParam(
            snapshot.data['create_date'],
            ParamType.DateTime,
            false,
          ),
          'create_by': convertAlgoliaParam(
            snapshot.data['create_by'],
            ParamType.DocumentReference,
            false,
          ),
          'update_date': convertAlgoliaParam(
            snapshot.data['update_date'],
            ParamType.DateTime,
            false,
          ),
          'update_by': convertAlgoliaParam(
            snapshot.data['update_by'],
            ParamType.DocumentReference,
            false,
          ),
          'delete_date': convertAlgoliaParam(
            snapshot.data['delete_date'],
            ParamType.DateTime,
            false,
          ),
          'delete_by': convertAlgoliaParam(
            snapshot.data['delete_by'],
            ParamType.DocumentReference,
            false,
          ),
          'status': convertAlgoliaParam(
            snapshot.data['status'],
            ParamType.int,
            false,
          ),
          'name': snapshot.data['name'],
          'detail': snapshot.data['detail'],
          'support_total': convertAlgoliaParam(
            snapshot.data['support_total'],
            ParamType.int,
            false,
          ),
          'province': snapshot.data['province'],
          'amphur': snapshot.data['amphur'],
          'tambon': snapshot.data['tambon'],
          'location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'photo': safeGet(
            () => snapshot.data['photo'].toList(),
          ),
          'tools': safeGet(
            () => snapshot.data['tools'].toList(),
          ),
        },
        MeetingRoomListRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<MeetingRoomListRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'meeting_room_list',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

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

class MeetingRoomListRecordDocumentEquality
    implements Equality<MeetingRoomListRecord> {
  const MeetingRoomListRecordDocumentEquality();

  @override
  bool equals(MeetingRoomListRecord? e1, MeetingRoomListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.deleteDate == e2?.deleteDate &&
        e1?.deleteBy == e2?.deleteBy &&
        e1?.status == e2?.status &&
        e1?.name == e2?.name &&
        e1?.detail == e2?.detail &&
        e1?.supportTotal == e2?.supportTotal &&
        e1?.province == e2?.province &&
        e1?.amphur == e2?.amphur &&
        e1?.tambon == e2?.tambon &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.photo, e2?.photo) &&
        listEquality.equals(e1?.tools, e2?.tools);
  }

  @override
  int hash(MeetingRoomListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.deleteDate,
        e?.deleteBy,
        e?.status,
        e?.name,
        e?.detail,
        e?.supportTotal,
        e?.province,
        e?.amphur,
        e?.tambon,
        e?.location,
        e?.photo,
        e?.tools
      ]);

  @override
  bool isValidKey(Object? o) => o is MeetingRoomListRecord;
}
