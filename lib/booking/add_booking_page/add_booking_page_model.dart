import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddBookingPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for startTime widget.
  TextEditingController? startTimeController;
  String? Function(BuildContext, String?)? startTimeControllerValidator;
  String? _startTimeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for endTime widget.
  TextEditingController? endTimeController;
  String? Function(BuildContext, String?)? endTimeControllerValidator;
  String? _endTimeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked2;
  // State field(s) for remarkUsers widget.
  TextEditingController? remarkUsersController;
  String? Function(BuildContext, String?)? remarkUsersControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    startTimeControllerValidator = _startTimeControllerValidator;
    endTimeControllerValidator = _endTimeControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    startTimeController?.dispose();
    endTimeController?.dispose();
    remarkUsersController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
