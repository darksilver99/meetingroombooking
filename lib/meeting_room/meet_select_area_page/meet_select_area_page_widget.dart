import '/backend/backend.dart';
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
import 'meet_select_area_page_model.dart';
export 'meet_select_area_page_model.dart';

class MeetSelectAreaPageWidget extends StatefulWidget {
  const MeetSelectAreaPageWidget({Key? key}) : super(key: key);

  @override
  _MeetSelectAreaPageWidgetState createState() =>
      _MeetSelectAreaPageWidgetState();
}

class _MeetSelectAreaPageWidgetState extends State<MeetSelectAreaPageWidget> {
  late MeetSelectAreaPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeetSelectAreaPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().provinceSelected = 0;
        FFAppState().amphureSelected = 0;
        FFAppState().tambonSelected = 0;
      });
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
            'เลือกพื้นที่บริการ',
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
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
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
                                  child: StreamBuilder<List<ProvinceRecord>>(
                                    stream: queryProvinceRecord(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
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
                                            FormFieldController<String>(null),
                                        options: provinceProvinceRecordList
                                            .map((e) => e.name)
                                            .toList(),
                                        onChanged: (val) async {
                                          setState(
                                              () => _model.provinceValue = val);
                                          _model.provinceID =
                                              await actions.getProvinceID(
                                            _model.provinceValue,
                                          );
                                          setState(() {
                                            FFAppState().provinceSelected =
                                                _model.provinceID!;
                                            FFAppState().amphureSelected = 0;
                                          });

                                          setState(() {});
                                        },
                                        width: double.infinity,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText: 'เลือกจังหวัด',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                      );
                                    },
                                  ),
                                ),
                                if (FFAppState().provinceSelected != 0)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: StreamBuilder<List<AmphureRecord>>(
                                      stream: queryAmphureRecord(
                                        queryBuilder: (amphureRecord) =>
                                            amphureRecord.where('province_id',
                                                isEqualTo: FFAppState()
                                                    .provinceSelected),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                                              FormFieldController<String>(null),
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
                                            setState(() {
                                              FFAppState().amphureSelected =
                                                  _model.amphureID!;
                                            });

                                            setState(() {});
                                          },
                                          width: double.infinity,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          hintText: 'เลือกอำเภอ',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
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
                                          isSearchable: false,
                                        );
                                      },
                                    ),
                                  ),
                                if (FFAppState().amphureSelected != 0)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: StreamBuilder<List<TambonRecord>>(
                                      stream: queryTambonRecord(
                                        queryBuilder: (tambonRecord) =>
                                            tambonRecord.where('amphure_id',
                                                isEqualTo: FFAppState()
                                                    .amphureSelected),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                                              FormFieldController<String>(null),
                                          options: tambonTambonRecordList
                                              .map((e) => e.name)
                                              .toList(),
                                          onChanged: (val) => setState(
                                              () => _model.tambonValue = val),
                                          width: double.infinity,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          hintText: 'เลือกตำบล',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
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
                                          isSearchable: false,
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
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.tambonValue != null &&
                                          _model.tambonValue != '') {
                                        context.pushNamed(
                                          'MeetRoomListTambonPage',
                                          queryParameters: {
                                            'province': serializeParam(
                                              _model.provinceValue,
                                              ParamType.String,
                                            ),
                                            'amphur': serializeParam(
                                              _model.amphureValue,
                                              ParamType.String,
                                            ),
                                            'tambon': serializeParam(
                                              _model.tambonValue,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        if (_model.amphureValue != null &&
                                            _model.amphureValue != '') {
                                          context.pushNamed(
                                            'MeetRoomListAmphurPage',
                                            queryParameters: {
                                              'province': serializeParam(
                                                _model.provinceValue,
                                                ParamType.String,
                                              ),
                                              'amphur': serializeParam(
                                                _model.amphureValue,
                                                ParamType.String,
                                              ),
                                              'tambon': serializeParam(
                                                _model.tambonValue,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          if (_model.provinceValue != null &&
                                              _model.provinceValue != '') {
                                            context.pushNamed(
                                              'MeetRoomListProvincePage',
                                              queryParameters: {
                                                'province': serializeParam(
                                                  _model.provinceValue,
                                                  ParamType.String,
                                                ),
                                                'amphur': serializeParam(
                                                  _model.amphureValue,
                                                  ParamType.String,
                                                ),
                                                'tambon': serializeParam(
                                                  _model.tambonValue,
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        color: Colors.white,
                                                      ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 2000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Kanit',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
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
        ),
      ),
    );
  }
}
