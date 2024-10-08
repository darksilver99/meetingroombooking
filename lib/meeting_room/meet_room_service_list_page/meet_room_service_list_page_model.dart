import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_data_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'meet_room_service_list_page_widget.dart'
    show MeetRoomServiceListPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeetRoomServiceListPageModel
    extends FlutterFlowModel<MeetRoomServiceListPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - checkMaximumCreateMeetingRoom] action in FloatingActionButton widget.
  bool? isCanCreateMoreRoom;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
