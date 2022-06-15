import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../detalle_tarea/detalle_tarea_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ListaTareasWidget extends StatefulWidget {
  const ListaTareasWidget({
    Key key,
    this.email,
    this.displayName,
    this.image,
  }) : super(key: key);

  final String email;
  final String displayName;
  final String image;

  @override
  _ListaTareasWidgetState createState() => _ListaTareasWidgetState();
}

class _ListaTareasWidgetState extends State<ListaTareasWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          child: Column(
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
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tareas Terminadas',
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                            child: StreamBuilder<List<TareaRecord>>(
                              stream: queryTareaRecord(
                                queryBuilder: (tareaRecord) => tareaRecord
                                    .where('Creado_por',
                                        isEqualTo: currentUserReference)
                                    .where('estado', isEqualTo: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<TareaRecord> listViewTareaRecordList =
                                    snapshot.data;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewTareaRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewTareaRecord =
                                        listViewTareaRecordList[listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 5),
                                      child: Container(
                                        width: 100,
                                        height: 95,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 5, 10, 5),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: Slidable(
                                                  actionPane:
                                                      const SlidableScrollActionPane(),
                                                  secondaryActions: [
                                                    IconSlideAction(
                                                      caption: 'Deshacer',
                                                      color: Colors.blue,
                                                      icon: Icons
                                                          .settings_backup_restore_rounded,
                                                      onTap: () async {
                                                        final tareaUpdateData =
                                                            createTareaRecordData(
                                                          estado: false,
                                                        );
                                                        await listViewTareaRecord
                                                            .reference
                                                            .update(
                                                                tareaUpdateData);
                                                      },
                                                    ),
                                                    IconSlideAction(
                                                      caption: 'Detalle',
                                                      color: Color(0xFFE97915),
                                                      icon: Icons
                                                          .find_in_page_rounded,
                                                      onTap: () async {
                                                        setState(() => FFAppState()
                                                                .Selected =
                                                            listViewTareaRecord
                                                                .reference);
                                                        setState(() => FFAppState()
                                                                .fecha =
                                                            listViewTareaRecord
                                                                .fechaLimite);
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetalleTareaWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    IconSlideAction(
                                                      caption: 'Eliminar',
                                                      color: Color(0xFFF21414),
                                                      icon: Icons.delete,
                                                      onTap: () async {
                                                        await listViewTareaRecord
                                                            .reference
                                                            .delete();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Tarea Eliminada',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                Color(
                                                                    0x67595959),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                  child: ListTile(
                                                    title: Text(
                                                      listViewTareaRecord
                                                          .titulo,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1,
                                                    ),
                                                    subtitle: Text(
                                                      listViewTareaRecord
                                                          .descripcion,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                    ),
                                                    trailing: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Color(0xFF303030),
                                                      size: 20,
                                                    ),
                                                    tileColor:
                                                        Color(0xFFF5F5F5),
                                                    dense: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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
