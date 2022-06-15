import '../add_categoria/add_categoria_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class EditTareaCopyWidget extends StatefulWidget {
  const EditTareaCopyWidget({Key key}) : super(key: key);

  @override
  _EditTareaCopyWidgetState createState() => _EditTareaCopyWidgetState();
}

class _EditTareaCopyWidgetState extends State<EditTareaCopyWidget> {
  DateTime datePicked;
  TextEditingController textController1;
  TextEditingController textController2;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: StreamBuilder<TareaRecord>(
          stream: TareaRecord.getDocument(FFAppState().Selected),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                ),
              );
            }
            final columnTareaRecord = snapshot.data;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          'Atras',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Editar Tarea',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF595959),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Container(
                                            width: 100,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: TextFormField(
                                                controller: textController1 ??=
                                                    TextEditingController(
                                                  text:
                                                      columnTareaRecord.titulo,
                                                ),
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  'textController1',
                                                  Duration(milliseconds: 2000),
                                                  () => setState(() {}),
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Titulo',
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Container(
                                            width: 100,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: InkWell(
                                              onTap: () async {
                                                await DatePicker
                                                    .showDateTimePicker(
                                                  context,
                                                  showTitleActions: true,
                                                  onConfirm: (date) {
                                                    setState(() =>
                                                        datePicked = date);
                                                  },
                                                  currentTime:
                                                      getCurrentTimestamp,
                                                  minTime: getCurrentTimestamp,
                                                );

                                                setState(() => FFAppState()
                                                    .fecha = datePicked);
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 10, 0),
                                                    child: Text(
                                                      dateTimeFormat('d/M H:mm',
                                                          FFAppState().fecha),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF595959),
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 10, 0),
                                                    child: Icon(
                                                      Icons.calendar_today,
                                                      color: Color(0xFF595959),
                                                      size: 24,
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: Container(
                                          width: double.infinity,
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                          child: ExpandableNotifier(
                                            initialExpanded: false,
                                            child: ExpandablePanel(
                                              header: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      FFAppState()
                                                          .categoriaSelected,
                                                      'categoria...',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2,
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      setState(() => FFAppState()
                                                              .categoriaSelected =
                                                          '');
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              collapsed: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 8, 0, 0),
                                                  child: Text(
                                                    ' ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0x8A000000),
                                                          fontSize: 1,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              expanded: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                    ),
                                                    child: StreamBuilder<
                                                        List<CategoriasRecord>>(
                                                      stream:
                                                          queryCategoriasRecord(
                                                        queryBuilder:
                                                            (categoriasRecord) =>
                                                                categoriasRecord.where(
                                                                    'creadopor',
                                                                    isEqualTo:
                                                                        currentUserReference),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<CategoriasRecord>
                                                            listViewCategoriasRecordList =
                                                            snapshot.data;
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewCategoriasRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewCategoriasRecord =
                                                                listViewCategoriasRecordList[
                                                                    listViewIndex];
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0x620F1113),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        setState(() =>
                                                                            FFAppState().categoriaSelected =
                                                                                FFAppState().categoriaSelected);
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        listViewCategoriasRecord
                                                                            .categoria,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 16,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 10),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .lineColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0x620F1113),
                                                                width: 2,
                                                              ),
                                                            ),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            AddCategoriaWidget(),
                                                                  ),
                                                                );
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .mode_edit,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor,
                                                                    size: 20,
                                                                  ),
                                                                  Text(
                                                                    'Editar Categorias',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              theme: ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: false,
                                                tapBodyToCollapse: false,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                hasIcon: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: Container(
                                          width: double.infinity,
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                          child: ExpandableNotifier(
                                            initialExpanded: false,
                                            child: ExpandablePanel(
                                              header:
                                                  StreamBuilder<UsuarioRecord>(
                                                stream:
                                                    UsuarioRecord.getDocument(
                                                        currentUserReference),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final rowUsuarioRecord =
                                                      snapshot.data;
                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Color',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle2,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(30,
                                                                      0, 0, 0),
                                                          child: Container(
                                                            width: 30,
                                                            height: 30,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              FFAppState()
                                                                  .colorSelect,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                              collapsed: Text(
                                                ' ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 1,
                                                        ),
                                              ),
                                              expanded: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 5),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              setState(() => FFAppState()
                                                                      .colorSelect =
                                                                  FFAppState()
                                                                      .color1);
                                                            },
                                                            child: Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/color1.jpg',
                                                                  ).image,
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              setState(() => FFAppState()
                                                                      .colorSelect =
                                                                  FFAppState()
                                                                      .color2);
                                                            },
                                                            child: Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/color2.jpg',
                                                                  ).image,
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              setState(() =>
                                                                  FFAppState()
                                                                          .colorSelect =
                                                                      'https://www.solidbackgrounds.com/images/1280x800/1280x800-tiffany-blue-solid-color-background.jpg');
                                                            },
                                                            child: Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/color3.jpg',
                                                                  ).image,
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              setState(() => FFAppState()
                                                                      .colorSelect =
                                                                  FFAppState()
                                                                      .color4);
                                                            },
                                                            child: Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/color4.jpg',
                                                                  ).image,
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              setState(() => FFAppState()
                                                                      .colorSelect =
                                                                  FFAppState()
                                                                      .color5);
                                                            },
                                                            child: Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/color5.jpg',
                                                                  ).image,
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              setState(() => FFAppState()
                                                                      .colorSelect =
                                                                  FFAppState()
                                                                      .color6);
                                                            },
                                                            child: Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/color6.jpg',
                                                                  ).image,
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              setState(() => FFAppState()
                                                                      .colorSelect =
                                                                  FFAppState()
                                                                      .color7);
                                                            },
                                                            child: Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/color7.jpg',
                                                                  ).image,
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              setState(() => FFAppState()
                                                                      .colorSelect =
                                                                  FFAppState()
                                                                      .color8);
                                                            },
                                                            child: Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/color8.jpg',
                                                                  ).image,
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              setState(() => FFAppState()
                                                                      .colorSelect =
                                                                  FFAppState()
                                                                      .color9);
                                                            },
                                                            child: Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/color9.jpg',
                                                                  ).image,
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              theme: ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: false,
                                                tapBodyToCollapse: false,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                hasIcon: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: AlignmentDirectional(0, 7),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: TextFormField(
                                          controller: textController2 ??=
                                              TextEditingController(
                                            text: columnTareaRecord.descripcion,
                                          ),
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            'textController2',
                                            Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Descripción',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                          maxLines: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            final tareaUpdateData =
                                                createTareaRecordData(
                                              titulo:
                                                  textController1?.text ?? '',
                                              descripcion:
                                                  textController2?.text ?? '',
                                              fechaLimite: FFAppState().fecha,
                                              color: FFAppState().colorSelect,
                                              categoria: FFAppState()
                                                  .categoriaSelected,
                                            );
                                            await columnTareaRecord.reference
                                                .update(tareaUpdateData);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Nueva Tarea Creada',
                                                  style: TextStyle(),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0x67595959),
                                              ),
                                            );
                                            setState(() =>
                                                FFAppState().colorSelect = '');
                                            setState(() => FFAppState()
                                                .categoriaSelected = '');
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          text: 'Guardar',
                                          options: FFButtonOptions(
                                            width: 130,
                                            height: 55,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius: 12,
                                          ),
                                        ),
                                      ],
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
