import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_data_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'booking_coming_list_page_model.dart';
export 'booking_coming_list_page_model.dart';

class BookingComingListPageWidget extends StatefulWidget {
  const BookingComingListPageWidget({Key? key}) : super(key: key);

  @override
  _BookingComingListPageWidgetState createState() =>
      _BookingComingListPageWidgetState();
}

class _BookingComingListPageWidgetState
    extends State<BookingComingListPageWidget> {
  late BookingComingListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingComingListPageModel());
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
            'รายการจองที่เข้ามา',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle: FlutterFlowTheme.of(context).titleMedium,
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          tabs: [
                            Tab(
                              text: 'รายการจอง',
                            ),
                            Tab(
                              text: 'ประวัติการจอง',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            StreamBuilder<List<BookingListRecord>>(
                              stream: queryBookingListRecord(
                                queryBuilder: (bookingListRecord) =>
                                    bookingListRecord
                                        .where('status',
                                            isLessThanOrEqualTo:
                                                valueOrDefault<int>(
                                              null,
                                              1,
                                            ))
                                        .where('owner_ref',
                                            isEqualTo: currentUserReference)
                                        .orderBy('status')
                                        .orderBy('create_date',
                                            descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                                List<BookingListRecord>
                                    listViewBookingListRecordList =
                                    snapshot.data!;
                                if (listViewBookingListRecordList.isEmpty) {
                                  return NoDataWidget();
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewBookingListRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewBookingListRecord =
                                        listViewBookingListRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'BookingDetailPage',
                                            queryParameters: {
                                              'bookingDetailParameter':
                                                  serializeParam(
                                                listViewBookingListRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'bookingDetailParameter':
                                                  listViewBookingListRecord,
                                            },
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 8.0, 16.0, 8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: StreamBuilder<
                                                            MeetingRoomListRecord>(
                                                          stream: MeetingRoomListRecord
                                                              .getDocument(
                                                                  listViewBookingListRecord
                                                                      .meetingRoomDoc!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final textMeetingRoomListRecord =
                                                                snapshot.data!;
                                                            return Text(
                                                              textMeetingRoomListRecord
                                                                  .name,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Text(
                                                        functions
                                                            .getMeetingStatusText(
                                                                listViewBookingListRecord
                                                                    .status)!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Kanit',
                                                                  color: listViewBookingListRecord
                                                                              .status ==
                                                                          0
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'วันที่ทำรายการ ${dateTimeFormat('d/M/y', listViewBookingListRecord.createDate)} ${dateTimeFormat('Hm', listViewBookingListRecord.createDate)}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Kanit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            PagedListView<DocumentSnapshot<Object?>?,
                                BookingListRecord>(
                              pagingController: () {
                                final Query<Object?> Function(Query<Object?>)
                                    queryBuilder =
                                    (bookingListRecord) => bookingListRecord
                                        .where('status',
                                            isGreaterThan: valueOrDefault<int>(
                                              null,
                                              2,
                                            ))
                                        .where('owner_ref',
                                            isEqualTo: currentUserReference)
                                        .orderBy('status', descending: true)
                                        .orderBy('create_date',
                                            descending: true);
                                if (_model.pagingController != null) {
                                  final query = queryBuilder(
                                      BookingListRecord.collection);
                                  if (query != _model.pagingQuery) {
                                    // The query has changed
                                    _model.pagingQuery = query;
                                    _model.streamSubscriptions
                                        .forEach((s) => s?.cancel());
                                    _model.streamSubscriptions.clear();
                                    _model.pagingController!.refresh();
                                  }
                                  return _model.pagingController!;
                                }

                                _model.pagingController =
                                    PagingController(firstPageKey: null);
                                _model.pagingQuery =
                                    queryBuilder(BookingListRecord.collection);
                                _model.pagingController!
                                    .addPageRequestListener((nextPageMarker) {
                                  queryBookingListRecordPage(
                                    queryBuilder: (bookingListRecord) =>
                                        bookingListRecord
                                            .where('status',
                                                isGreaterThan:
                                                    valueOrDefault<int>(
                                                  null,
                                                  2,
                                                ))
                                            .where('owner_ref',
                                                isEqualTo: currentUserReference)
                                            .orderBy('status', descending: true)
                                            .orderBy('create_date',
                                                descending: true),
                                    nextPageMarker: nextPageMarker,
                                    pageSize: 25,
                                    isStream: true,
                                  ).then((page) {
                                    _model.pagingController!.appendPage(
                                      page.data,
                                      page.nextPageMarker,
                                    );
                                    final streamSubscription =
                                        page.dataStream?.listen((data) {
                                      data.forEach((item) {
                                        final itemIndexes = _model
                                            .pagingController!.itemList!
                                            .asMap()
                                            .map((k, v) =>
                                                MapEntry(v.reference.id, k));
                                        final index =
                                            itemIndexes[item.reference.id];
                                        final items =
                                            _model.pagingController!.itemList!;
                                        if (index != null) {
                                          items.replaceRange(
                                              index, index + 1, [item]);
                                          _model.pagingController!.itemList = {
                                            for (var item in items)
                                              item.reference: item
                                          }.values.toList();
                                        }
                                      });
                                      setState(() {});
                                    });
                                    _model.streamSubscriptions
                                        .add(streamSubscription);
                                  });
                                });
                                return _model.pagingController!;
                              }(),
                              padding: EdgeInsets.zero,
                              reverse: false,
                              scrollDirection: Axis.vertical,
                              builderDelegate:
                                  PagedChildBuilderDelegate<BookingListRecord>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                                noItemsFoundIndicatorBuilder: (_) =>
                                    NoDataWidget(),
                                itemBuilder: (context, _, listViewIndex) {
                                  final listViewBookingListRecord = _model
                                      .pagingController!
                                      .itemList![listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 8.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'BookingDetailPage',
                                          queryParameters: {
                                            'bookingDetailParameter':
                                                serializeParam(
                                              listViewBookingListRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'bookingDetailParameter':
                                                listViewBookingListRecord,
                                          },
                                        );
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: StreamBuilder<
                                                          MeetingRoomListRecord>(
                                                        stream: MeetingRoomListRecord
                                                            .getDocument(
                                                                listViewBookingListRecord
                                                                    .meetingRoomDoc!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final textMeetingRoomListRecord =
                                                              snapshot.data!;
                                                          return Text(
                                                            textMeetingRoomListRecord
                                                                .name,
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Text(
                                                      functions
                                                          .getMeetingStatusText(
                                                              listViewBookingListRecord
                                                                  .status)!,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Kanit',
                                                            color: () {
                                                              if (listViewBookingListRecord
                                                                      .status ==
                                                                  0) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary;
                                                              } else if (listViewBookingListRecord
                                                                      .status ==
                                                                  3) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .error;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .success;
                                                              }
                                                            }(),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      'วันที่ทำรายการ ${dateTimeFormat('d/M/y', listViewBookingListRecord.createDate)} ${dateTimeFormat('Hm', listViewBookingListRecord.createDate)}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Kanit',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w200,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
