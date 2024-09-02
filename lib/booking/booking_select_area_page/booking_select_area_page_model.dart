import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'booking_select_area_page_widget.dart' show BookingSelectAreaPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingSelectAreaPageModel
    extends FlutterFlowModel<BookingSelectAreaPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
