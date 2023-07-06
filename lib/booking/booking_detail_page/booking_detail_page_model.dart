import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingDetailPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for username widget.
  TextEditingController? usernameController1;
  String? Function(BuildContext, String?)? usernameController1Validator;
  // State field(s) for username widget.
  TextEditingController? usernameController2;
  String? Function(BuildContext, String?)? usernameController2Validator;
  // State field(s) for username widget.
  TextEditingController? usernameController3;
  String? Function(BuildContext, String?)? usernameController3Validator;
  // State field(s) for username widget.
  TextEditingController? usernameController4;
  String? Function(BuildContext, String?)? usernameController4Validator;
  // State field(s) for username widget.
  TextEditingController? usernameController5;
  String? Function(BuildContext, String?)? usernameController5Validator;
  // State field(s) for username widget.
  TextEditingController? usernameController6;
  String? Function(BuildContext, String?)? usernameController6Validator;
  // State field(s) for username widget.
  TextEditingController? usernameController7;
  String? Function(BuildContext, String?)? usernameController7Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    usernameController1?.dispose();
    usernameController2?.dispose();
    usernameController3?.dispose();
    usernameController4?.dispose();
    usernameController5?.dispose();
    usernameController6?.dispose();
    usernameController7?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
