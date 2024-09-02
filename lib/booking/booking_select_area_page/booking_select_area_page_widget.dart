import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'booking_select_area_page_model.dart';
export 'booking_select_area_page_model.dart';

class BookingSelectAreaPageWidget extends StatefulWidget {
  const BookingSelectAreaPageWidget({super.key});

  @override
  State<BookingSelectAreaPageWidget> createState() =>
      _BookingSelectAreaPageWidgetState();
}

class _BookingSelectAreaPageWidgetState
    extends State<BookingSelectAreaPageWidget> {
  late BookingSelectAreaPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingSelectAreaPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().provinceSelected = 0;
      FFAppState().amphureSelected = 0;
      FFAppState().tambonSelected = 0;
      FFAppState().provinceSelectedValue = '';
      FFAppState().amphurSelectedValue = '';
      FFAppState().tambonSelectedValue = '';
      setState(() {});
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: true,
          title: Text(
            'เลือกพื้นที่บริการ',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Kanit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 32.0, 16.0, 32.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child:
                                          StreamBuilder<List<ProvinceRecord>>(
                                        stream: queryProvinceRecord(
                                          queryBuilder: (provinceRecord) =>
                                              provinceRecord.orderBy('name'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ProvinceRecord>
                                              provinceProvinceRecordList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .provinceValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: provinceProvinceRecordList
                                                .map((e) => e.name)
                                                .toList(),
                                            onChanged: (val) async {
                                              setState(() =>
                                                  _model.provinceValue = val);
                                              _model.provinceID =
                                                  await actions.getProvinceID(
                                                _model.provinceValue,
                                              );
                                              FFAppState().provinceSelected =
                                                  _model.provinceID!;
                                              FFAppState().amphureSelected = 0;
                                              setState(() {});
                                              FFAppState()
                                                      .provinceSelectedValue =
                                                  _model.provinceValue!;
                                              FFAppState().amphurSelectedValue =
                                                  '';
                                              FFAppState().tambonSelectedValue =
                                                  '';

                                              setState(() {});
                                            },
                                            width: double.infinity,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Kanit',
                                                      letterSpacing: 0.0,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Kanit',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Kanit',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'เลือกจังหวัด',
                                            searchHintText:
                                                'Search for an item...',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                    if (FFAppState().provinceSelected != 0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child:
                                            StreamBuilder<List<AmphureRecord>>(
                                          stream: queryAmphureRecord(
                                            queryBuilder: (amphureRecord) =>
                                                amphureRecord
                                                    .where(
                                                      'province_id',
                                                      isEqualTo: FFAppState()
                                                          .provinceSelected,
                                                    )
                                                    .orderBy('name'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AmphureRecord>
                                                amphureAmphureRecordList =
                                                snapshot.data!;

                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .amphureValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: amphureAmphureRecordList
                                                  .map((e) => e.name)
                                                  .toList(),
                                              onChanged: (val) async {
                                                setState(() =>
                                                    _model.amphureValue = val);
                                                _model.amphureID =
                                                    await actions.getAmphureID(
                                                  _model.amphureValue,
                                                  FFAppState().provinceSelected,
                                                );
                                                FFAppState().amphureSelected =
                                                    _model.amphureID!;
                                                setState(() {});
                                                FFAppState()
                                                        .amphurSelectedValue =
                                                    _model.amphureValue!;
                                                FFAppState()
                                                    .tambonSelectedValue = '';

                                                setState(() {});
                                              },
                                              width: double.infinity,
                                              searchHintTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        letterSpacing: 0.0,
                                                      ),
                                              searchTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        letterSpacing: 0.0,
                                                      ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'เลือกอำเภอ',
                                              searchHintText:
                                                  'Search for an item...',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isSearchable: true,
                                              isMultiSelect: false,
                                            );
                                          },
                                        ),
                                      ),
                                    if (FFAppState().amphureSelected != 0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child:
                                            StreamBuilder<List<TambonRecord>>(
                                          stream: queryTambonRecord(
                                            queryBuilder: (tambonRecord) =>
                                                tambonRecord
                                                    .where(
                                                      'amphure_id',
                                                      isEqualTo: FFAppState()
                                                          .amphureSelected,
                                                    )
                                                    .orderBy('name'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<TambonRecord>
                                                tambonTambonRecordList =
                                                snapshot.data!;

                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .tambonValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: tambonTambonRecordList
                                                  .map((e) => e.name)
                                                  .toList(),
                                              onChanged: (val) async {
                                                setState(() =>
                                                    _model.tambonValue = val);
                                                FFAppState()
                                                        .tambonSelectedValue =
                                                    _model.tambonValue!;
                                              },
                                              width: double.infinity,
                                              searchHintTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        letterSpacing: 0.0,
                                                      ),
                                              searchTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        letterSpacing: 0.0,
                                                      ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'เลือกตำบล',
                                              searchHintText:
                                                  'Search for an item...',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isSearchable: true,
                                              isMultiSelect: false,
                                            );
                                          },
                                        ),
                                      ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Text(
                                          '*ต้องเลือกจังหวัด',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Kanit',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (FFAppState()
                                                      .tambonSelectedValue !=
                                                  null &&
                                              FFAppState()
                                                      .tambonSelectedValue !=
                                                  '') {
                                            context.pushNamed(
                                              'MeetRoomListTambonPage',
                                              queryParameters: {
                                                'province': serializeParam(
                                                  FFAppState()
                                                      .provinceSelectedValue,
                                                  ParamType.String,
                                                ),
                                                'amphur': serializeParam(
                                                  FFAppState()
                                                      .amphurSelectedValue,
                                                  ParamType.String,
                                                ),
                                                'tambon': serializeParam(
                                                  FFAppState()
                                                      .tambonSelectedValue,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            if (FFAppState()
                                                        .amphurSelectedValue !=
                                                    null &&
                                                FFAppState()
                                                        .amphurSelectedValue !=
                                                    '') {
                                              context.pushNamed(
                                                'MeetRoomListAmphurPage',
                                                queryParameters: {
                                                  'province': serializeParam(
                                                    FFAppState()
                                                        .provinceSelectedValue,
                                                    ParamType.String,
                                                  ),
                                                  'amphur': serializeParam(
                                                    FFAppState()
                                                        .amphurSelectedValue,
                                                    ParamType.String,
                                                  ),
                                                  'tambon': serializeParam(
                                                    FFAppState()
                                                        .tambonSelectedValue,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              if (FFAppState()
                                                          .provinceSelectedValue !=
                                                      null &&
                                                  FFAppState()
                                                          .provinceSelectedValue !=
                                                      '') {
                                                context.pushNamed(
                                                  'MeetRoomListProvincePage',
                                                  queryParameters: {
                                                    'province': serializeParam(
                                                      FFAppState()
                                                          .provinceSelectedValue,
                                                      ParamType.String,
                                                    ),
                                                    'amphur': serializeParam(
                                                      FFAppState()
                                                          .amphurSelectedValue,
                                                      ParamType.String,
                                                    ),
                                                    'tambon': serializeParam(
                                                      FFAppState()
                                                          .tambonSelectedValue,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'กรุณาเลือกจังหวัด',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Kanit',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 2000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                  ),
                                                );
                                              }
                                            }
                                          }
                                        },
                                        text: 'ตกลง',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Kanit',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (FFAppState().isEnableAd)
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: FlutterFlowAdBanner(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 80.0,
                      showsTestAd: false,
                      androidAdUnitID: 'ca-app-pub-8903107947688683/9752176710',
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
