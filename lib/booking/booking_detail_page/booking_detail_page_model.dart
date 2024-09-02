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
  TextEditingController? usernameTextController1;
  String? Function(BuildContext, String?)? usernameTextController1Validator;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode2;
  TextEditingController? usernameTextController2;
  String? Function(BuildContext, String?)? usernameTextController2Validator;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode3;
  TextEditingController? usernameTextController3;
  String? Function(BuildContext, String?)? usernameTextController3Validator;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode4;
  TextEditingController? usernameTextController4;
  String? Function(BuildContext, String?)? usernameTextController4Validator;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode5;
  TextEditingController? usernameTextController5;
  String? Function(BuildContext, String?)? usernameTextController5Validator;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode6;
  TextEditingController? usernameTextController6;
  String? Function(BuildContext, String?)? usernameTextController6Validator;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode7;
  TextEditingController? usernameTextController7;
  String? Function(BuildContext, String?)? usernameTextController7Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    usernameFocusNode1?.dispose();
    usernameTextController1?.dispose();

    usernameFocusNode2?.dispose();
    usernameTextController2?.dispose();

    usernameFocusNode3?.dispose();
    usernameTextController3?.dispose();

    usernameFocusNode4?.dispose();
    usernameTextController4?.dispose();

    usernameFocusNode5?.dispose();
    usernameTextController5?.dispose();

    usernameFocusNode6?.dispose();
    usernameTextController6?.dispose();

    usernameFocusNode7?.dispose();
    usernameTextController7?.dispose();
  }
}
