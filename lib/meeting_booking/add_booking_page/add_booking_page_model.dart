import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddBookingPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for username widget.
  TextEditingController? usernameController1;
  String? Function(BuildContext, String?)? usernameController1Validator;
  // State field(s) for username widget.
  TextEditingController? usernameController2;
  String? Function(BuildContext, String?)? usernameController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    usernameController1?.dispose();
    usernameController2?.dispose();
  }

  /// Additional helper methods are added here.

}
