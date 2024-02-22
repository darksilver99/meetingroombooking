import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'edit_meet_room_information_page_widget.dart'
    show EditMeetRoomInformationPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditMeetRoomInformationPageModel
    extends FlutterFlowModel<EditMeetRoomInformationPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getProvinceID] action in EditMeetRoomInformationPage widget.
  int? currentProvinceID;
  // Stores action output result for [Custom Action - getAmphureID] action in EditMeetRoomInformationPage widget.
  int? currentAmphurID;
  // Stores action output result for [Custom Action - getTambonID] action in EditMeetRoomInformationPage widget.
  int? currentTambonID;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  String? _nameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for support_total widget.
  FocusNode? supportTotalFocusNode;
  TextEditingController? supportTotalController;
  String? Function(BuildContext, String?)? supportTotalControllerValidator;
  String? _supportTotalControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailController;
  String? Function(BuildContext, String?)? detailControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for province widget.
  String? provinceValue;
  FormFieldController<String>? provinceValueController;
  // Stores action output result for [Custom Action - getProvinceID] action in province widget.
  int? provinceID;
  // State field(s) for amphure widget.
  String? amphureValue;
  FormFieldController<String>? amphureValueController;
  // Stores action output result for [Custom Action - getAmphureID] action in amphure widget.
  int? amphureID;
  // State field(s) for tambon widget.
  String? tambonValue;
  FormFieldController<String>? tambonValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nameControllerValidator = _nameControllerValidator;
    supportTotalControllerValidator = _supportTotalControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameController?.dispose();

    supportTotalFocusNode?.dispose();
    supportTotalController?.dispose();

    detailFocusNode?.dispose();
    detailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
