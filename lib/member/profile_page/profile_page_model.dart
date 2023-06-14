import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for fullname widget.
  TextEditingController? fullnameController1;
  String? Function(BuildContext, String?)? fullnameController1Validator;
  // State field(s) for fullname widget.
  TextEditingController? fullnameController2;
  String? Function(BuildContext, String?)? fullnameController2Validator;
  // State field(s) for fullname widget.
  TextEditingController? fullnameController3;
  String? Function(BuildContext, String?)? fullnameController3Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    fullnameController1?.dispose();
    fullnameController2?.dispose();
    fullnameController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
