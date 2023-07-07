import 'dart:math';

import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../components/booking_dialog_view_widget.dart';
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

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, List<dynamic>> selectedEvents = {};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingMeetPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().fakeSelectedDate = [];
    });

    addBookingMark();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  addBookingMark() async {
    print("addBookingMark");
    var rs = await FirebaseFirestore.instance.collection('booking_list').where('meeting_room_doc', isEqualTo: FFAppState().meetingRoomSelectedRef).where('status', isLessThan: 2).get();
    print('size : ${rs.size}');
    for (var i = 0; i < rs.size; i++) {
      String formattedDateTime = DateFormat("yyyy-MM-dd 00:00:00'Z'").format(rs.docs[i].data()["booking_date"].toDate());
      selectedEvents[DateTime.parse(formattedDateTime)] = ['x'];
    }
    setState(() {});
  }

  List<dynamic> _getEventsForDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  showBookingDialog(selectedDay) async {
    await showAlignedDialog(
      context: context,
      isGlobal: true,
      avoidOverflow: false,
      targetAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
      followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
      builder: (dialogContext) {
        return Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.95,
              child: BookingDialogViewWidget(
                selectedDate: selectedDay,
              ),
            ),
          ),
        );
      },
    ).then((value) => setState(() {}));

    /*context.pushNamed(
      'AddBookingPage',
      queryParameters: {
        'dateSeleceteParameter': serializeParam(
          selectedDay,
          ParamType.DateTime,
        ),
      }.withoutNulls,
    );*/
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
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
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
                          TableCalendar(
                            headerStyle: HeaderStyle(
                              formatButtonVisible: false,
                            ),
                            firstDay: kFirstDay,
                            lastDay: kLastDay,
                            focusedDay: _focusedDay,
                            calendarFormat: _calendarFormat,
                            selectedDayPredicate: (day) {
                              print("Predicate");
                              // Use `selectedDayPredicate` to determine which day is currently selected.
                              // If this returns true, then `day` will be marked as selected.

                              // Using `isSameDay` is recommended to disregard
                              // the time-part of compared DateTime objects.
                              return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              if (!isSameDay(_selectedDay, selectedDay)) {
                                // Call `setState()` when updating the selected day
                                setState(() {
                                  _selectedDay = selectedDay;
                                  _focusedDay = focusedDay;
                                });
                              }
                              showBookingDialog(selectedDay);
                            },
                            eventLoader: _getEventsForDay,
                            calendarBuilders: CalendarBuilders(
                              markerBuilder: (BuildContext context, date, events) {
                                if (events.isEmpty) return SizedBox();
                                return ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: events.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        padding: const EdgeInsets.all(1),
                                        child: Container(
                                          // height: 7,
                                          width: 5,
                                          decoration: BoxDecoration(shape: BoxShape.circle, color: FlutterFlowTheme.of(context).tertiary),
                                        ),
                                      );
                                    });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
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
                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
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
