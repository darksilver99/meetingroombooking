import '/backend/backend.dart';
import '/components/no_data_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'meet_room_list_province_page_model.dart';
export 'meet_room_list_province_page_model.dart';

class MeetRoomListProvincePageWidget extends StatefulWidget {
  const MeetRoomListProvincePageWidget({
    Key? key,
    String? province,
    String? amphur,
    String? tambon,
  })  : this.province = province ?? '-',
        this.amphur = amphur ?? '-',
        this.tambon = tambon ?? '-',
        super(key: key);

  final String province;
  final String amphur;
  final String tambon;

  @override
  _MeetRoomListProvincePageWidgetState createState() =>
      _MeetRoomListProvincePageWidgetState();
}

class _MeetRoomListProvincePageWidgetState
    extends State<MeetRoomListProvincePageWidget> {
  late MeetRoomListProvincePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeetRoomListProvincePageModel());

    _model.usernameController ??= TextEditingController();
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
            'ห้องประชุมในพื้นที่',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 52.0,
                        decoration: BoxDecoration(),
                        child: TextFormField(
                          controller: _model.usernameController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.usernameController',
                            Duration(milliseconds: 500),
                            () async {
                              if (_model.usernameController.text != null &&
                                  _model.usernameController.text != '') {
                                setState(
                                    () => _model.algoliaSearchResults = null);
                                await MeetingRoomListRecord.search(
                                  term: _model.usernameController.text,
                                )
                                    .then(
                                        (r) => _model.algoliaSearchResults = r)
                                    .onError((_, __) =>
                                        _model.algoliaSearchResults = [])
                                    .whenComplete(() => setState(() {}));

                                setState(() {
                                  FFAppState().isFullList = false;
                                });
                              } else {
                                setState(() {
                                  FFAppState().isFullList = true;
                                });
                              }
                            },
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintText: 'ค้นหาจากชื่อ',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Kanit',
                                  fontSize: 12.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).line,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            suffixIcon: _model
                                    .usernameController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.usernameController?.clear();
                                      if (_model.usernameController.text !=
                                              null &&
                                          _model.usernameController.text !=
                                              '') {
                                        setState(() =>
                                            _model.algoliaSearchResults = null);
                                        await MeetingRoomListRecord.search(
                                          term: _model.usernameController.text,
                                        )
                                            .then((r) =>
                                                _model.algoliaSearchResults = r)
                                            .onError((_, __) => _model
                                                .algoliaSearchResults = [])
                                            .whenComplete(
                                                () => setState(() {}));

                                        setState(() {
                                          FFAppState().isFullList = false;
                                        });
                                      } else {
                                        setState(() {
                                          FFAppState().isFullList = true;
                                        });
                                      }

                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 24.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.usernameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                  child: Text(
                    'จังหวัด ${widget.province} อำเภอ ${valueOrDefault<String>(
                      widget.amphur,
                      '-',
                    )} ตำบล ${valueOrDefault<String>(
                      widget.tambon,
                      '-',
                    )}',
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Kanit',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
              ),
              if (FFAppState().isFullList)
                Expanded(
                  child: PagedListView<DocumentSnapshot<Object?>?,
                      MeetingRoomListRecord>(
                    pagingController: () {
                      final Query<Object?> Function(Query<Object?>)
                          queryBuilder =
                          (meetingRoomListRecord) => meetingRoomListRecord
                              .where('status',
                                  isEqualTo: valueOrDefault<int>(
                                    null,
                                    1,
                                  ))
                              .where('province', isEqualTo: widget.province);
                      if (_model.pagingController != null) {
                        final query =
                            queryBuilder(MeetingRoomListRecord.collection);
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
                          queryBuilder(MeetingRoomListRecord.collection);
                      _model.pagingController!
                          .addPageRequestListener((nextPageMarker) {
                        queryMeetingRoomListRecordPage(
                          queryBuilder: (meetingRoomListRecord) =>
                              meetingRoomListRecord
                                  .where('status',
                                      isEqualTo: valueOrDefault<int>(
                                        null,
                                        1,
                                      ))
                                  .where('province',
                                      isEqualTo: widget.province),
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
                                  .map((k, v) => MapEntry(v.reference.id, k));
                              final index = itemIndexes[item.reference.id];
                              final items = _model.pagingController!.itemList!;
                              if (index != null) {
                                items.replaceRange(index, index + 1, [item]);
                                _model.pagingController!.itemList = {
                                  for (var item in items) item.reference: item
                                }.values.toList();
                              }
                            });
                            setState(() {});
                          });
                          _model.streamSubscriptions.add(streamSubscription);
                        });
                      });
                      return _model.pagingController!;
                    }(),
                    padding: EdgeInsets.zero,
                    primary: false,
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    builderDelegate:
                        PagedChildBuilderDelegate<MeetingRoomListRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                      noItemsFoundIndicatorBuilder: (_) => Container(
                        width: double.infinity,
                        child: NoDataWidget(),
                      ),
                      itemBuilder: (context, _, listViewIndex) {
                        final listViewMeetingRoomListRecord =
                            _model.pagingController!.itemList![listViewIndex];
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
                                'MeetDetailPage',
                                queryParameters: {
                                  'meetingRoomParamameter': serializeParam(
                                    listViewMeetingRoomListRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'meetingRoomParamameter':
                                      listViewMeetingRoomListRecord,
                                },
                              );
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          listViewMeetingRoomListRecord
                                              .photo.first,
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listViewMeetingRoomListRecord
                                                    .name,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Kanit',
                                                          fontSize: 18.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  listViewMeetingRoomListRecord
                                                      .detail,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'รองรับ ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Kanit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: formatNumber(
                                                            listViewMeetingRoomListRecord
                                                                .supportTotal,
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .automatic,
                                                          ),
                                                          style: TextStyle(),
                                                        ),
                                                        TextSpan(
                                                          text: ' คน',
                                                          style: TextStyle(),
                                                        )
                                                      ],
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
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
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
                ),
              if (!FFAppState().isFullList)
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (_model.algoliaSearchResults
                              ?.where((e) => widget.province == e.province)
                              .toList() ==
                          null) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        );
                      }
                      final resultSearchList = _model.algoliaSearchResults
                              ?.where((e) => widget.province == e.province)
                              .toList()
                              ?.toList() ??
                          [];
                      if (resultSearchList.isEmpty) {
                        return Container(
                          width: double.infinity,
                          child: NoDataWidget(),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: resultSearchList.length,
                        itemBuilder: (context, resultSearchListIndex) {
                          final resultSearchListItem =
                              resultSearchList[resultSearchListIndex];
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
                                  'MeetDetailPage',
                                  queryParameters: {
                                    'meetingRoomParamameter': serializeParam(
                                      resultSearchListItem,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'meetingRoomParamameter':
                                        resultSearchListItem,
                                  },
                                );
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            resultSearchListItem.photo.first,
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  resultSearchListItem.name,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        fontSize: 18.0,
                                                      ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    resultSearchListItem.detail,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'รองรับ ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Kanit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: formatNumber(
                                                              resultSearchListItem
                                                                  .supportTotal,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .automatic,
                                                            ),
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: ' คน',
                                                            style: TextStyle(),
                                                          )
                                                        ],
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
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
