import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'booking_detail_page_widget.dart' show BookingDetailPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BookingDetailPageModel extends FlutterFlowModel<BookingDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for username widget.
  FocusNode? usernameFocusNode1;
  TextEditingController? usernameController1;
  String? Function(BuildContext, String?)? usernameController1Validator;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode2;
  TextEditingController? usernameController2;
  String? Function(BuildContext, String?)? usernameController2Validator;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode3;
  TextEditingController? usernameController3;
  String? Function(BuildContext, String?)? usernameController3Validator;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode4;
  TextEditingController? usernameController4;
  String? Function(BuildContext, String?)? usernameController4Validator;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode5;
  TextEditingController? usernameController5;
  String? Function(BuildContext, String?)? usernameController5Validator;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode6;
  TextEditingController? usernameController6;
  String? Function(BuildContext, String?)? usernameController6Validator;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode7;
  TextEditingController? usernameController7;
  String? Function(BuildContext, String?)? usernameController7Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    usernameFocusNode1?.dispose();
    usernameController1?.dispose();

    usernameFocusNode2?.dispose();
    usernameController2?.dispose();

    usernameFocusNode3?.dispose();
    usernameController3?.dispose();

    usernameFocusNode4?.dispose();
    usernameController4?.dispose();

    usernameFocusNode5?.dispose();
    usernameController5?.dispose();

    usernameFocusNode6?.dispose();
    usernameController6?.dispose();

    usernameFocusNode7?.dispose();
    usernameController7?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
