import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HelpPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for topic widget.
  TextEditingController? topicController;
  String? Function(BuildContext, String?)? topicControllerValidator;
  String? _topicControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for detail widget.
  TextEditingController? detailController;
  String? Function(BuildContext, String?)? detailControllerValidator;
  String? _detailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for contactName widget.
  TextEditingController? contactNameController;
  String? Function(BuildContext, String?)? contactNameControllerValidator;
  String? _contactNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for contactPhone widget.
  TextEditingController? contactPhoneController;
  String? Function(BuildContext, String?)? contactPhoneControllerValidator;
  String? _contactPhoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for contactEmail widget.
  TextEditingController? contactEmailController;
  String? Function(BuildContext, String?)? contactEmailControllerValidator;
  String? _contactEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topicControllerValidator = _topicControllerValidator;
    detailControllerValidator = _detailControllerValidator;
    contactNameControllerValidator = _contactNameControllerValidator;
    contactPhoneControllerValidator = _contactPhoneControllerValidator;
    contactEmailControllerValidator = _contactEmailControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    topicController?.dispose();
    detailController?.dispose();
    contactNameController?.dispose();
    contactPhoneController?.dispose();
    contactEmailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
