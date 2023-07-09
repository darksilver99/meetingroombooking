import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "fullname" field.
  String? _fullname;
  String get fullname => _fullname ?? '';
  bool hasFullname() => _fullname != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "delete_date" field.
  DateTime? _deleteDate;
  DateTime? get deleteDate => _deleteDate;
  bool hasDeleteDate() => _deleteDate != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "update_by" field.
  DocumentReference? _updateBy;
  DocumentReference? get updateBy => _updateBy;
  bool hasUpdateBy() => _updateBy != null;

  // "is_pay" field.
  bool? _isPay;
  bool get isPay => _isPay ?? false;
  bool hasIsPay() => _isPay != null;

  // "is_first_time" field.
  bool? _isFirstTime;
  bool get isFirstTime => _isFirstTime ?? false;
  bool hasIsFirstTime() => _isFirstTime != null;

  // "is_app_checker" field.
  bool? _isAppChecker;
  bool get isAppChecker => _isAppChecker ?? false;
  bool hasIsAppChecker() => _isAppChecker != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _password = snapshotData['password'] as String?;
    _fullname = snapshotData['fullname'] as String?;
    _status = castToType<int>(snapshotData['status']);
    _createDate = snapshotData['create_date'] as DateTime?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _deleteDate = snapshotData['delete_date'] as DateTime?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _isPay = snapshotData['is_pay'] as bool?;
    _isFirstTime = snapshotData['is_first_time'] as bool?;
    _isAppChecker = snapshotData['is_app_checker'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? password,
  String? fullname,
  int? status,
  DateTime? createDate,
  String? photoUrl,
  String? uid,
  String? displayName,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? deleteDate,
  DateTime? updateDate,
  DocumentReference? updateBy,
  bool? isPay,
  bool? isFirstTime,
  bool? isAppChecker,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'password': password,
      'fullname': fullname,
      'status': status,
      'create_date': createDate,
      'photo_url': photoUrl,
      'uid': uid,
      'display_name': displayName,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'delete_date': deleteDate,
      'update_date': updateDate,
      'update_by': updateBy,
      'is_pay': isPay,
      'is_first_time': isFirstTime,
      'is_app_checker': isAppChecker,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.password == e2?.password &&
        e1?.fullname == e2?.fullname &&
        e1?.status == e2?.status &&
        e1?.createDate == e2?.createDate &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.displayName == e2?.displayName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.deleteDate == e2?.deleteDate &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.isPay == e2?.isPay &&
        e1?.isFirstTime == e2?.isFirstTime &&
        e1?.isAppChecker == e2?.isAppChecker;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.password,
        e?.fullname,
        e?.status,
        e?.createDate,
        e?.photoUrl,
        e?.uid,
        e?.displayName,
        e?.createdTime,
        e?.phoneNumber,
        e?.deleteDate,
        e?.updateDate,
        e?.updateBy,
        e?.isPay,
        e?.isFirstTime,
        e?.isAppChecker
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
