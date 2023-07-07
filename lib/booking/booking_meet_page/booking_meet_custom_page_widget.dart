import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'booking_meet_page_model.dart';
export 'booking_meet_page_model.dart';

class BookingMeetCustomPageWidget extends StatefulWidget {
  const BookingMeetCustomPageWidget({Key? key}) : super(key: key);

  @override
  _BookingMeetCustomPageWidgetState createState() => _BookingMeetCustomPageWidgetState();
}

class _BookingMeetCustomPageWidgetState extends State<BookingMeetCustomPageWidget> {
  late BookingMeetPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingMeetPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().fakeSelectedDate = [];
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: true,
          title: Text(
            'เลือกวันเวลาที่จอง',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Kanit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowCalendar(
                            color: FlutterFlowTheme.of(context).primary,
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            weekFormat: false,
                            weekStartsMonday: false,
                            initialDate: getCurrentTimestamp,
                            rowHeight: 64.0,
                            onChange: (DateTimeRange? newSelectedDate) async {
                              _model.calendarSelectedDay = newSelectedDate;
                              FFAppState().addToFakeSelectedDate(
                                  _model.calendarSelectedDay!.start.toString());
                              if (FFAppState().fakeSelectedDate.length > 1) {
                                context.pushNamed(
                                  'AddBookingPage',
                                  queryParameters: {
                                    'dateSeleceteParameter': serializeParam(
                                      _model.calendarSelectedDay?.start,
                                      ParamType.DateTime,
                                    ),
                                  }.withoutNulls,
                                );
                              }
                              setState(() {});
                            },
                            titleStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Kanit',
                                  fontSize: 24.0,
                                ),
                            dayOfWeekStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Kanit',
                                  fontSize: 14.0,
                                ),
                            dateStyle: FlutterFlowTheme.of(context).bodyMedium,
                            selectedDateStyle:
                                FlutterFlowTheme.of(context).titleSmall,
                            inactiveDateStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle_sharp,
                        color: FlutterFlowTheme.of(context).tertiary,
                        size: 20.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'มีผู้จองบางช่วงเวลาแล้วในวันนี้',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
