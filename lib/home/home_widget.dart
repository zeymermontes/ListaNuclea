import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../detalle_tarea/detalle_tarea_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../lista_tareas/lista_tareas_widget.dart';
import '../m_i_perfil/m_i_perfil_widget.dart';
import '../nueva_tarea/nueva_tarea_widget.dart';
import '../splash/splash_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key key,
    this.email,
    this.displayName,
    this.image,
  }) : super(key: key);

  final String email;
  final String displayName;
  final String image;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
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
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AuthUserStreamWidget(
                      child: Container(
                        width: 55,
                        height: 55,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          valueOrDefault<String>(
                            currentUserPhoto,
                            'https://www.enterritorio.gov.co/NotificacionesProcesosDisciplinarios/dist/img/user-anon.png',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BIENVENIDO',
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          Text(
                            currentUserEmail,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          AuthUserStreamWidget(
                            child: Text(
                              currentUserDisplayName,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          await signOut();
                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SplashWidget(),
                            ),
                            (r) => false,
                          );
                        },
                        child: Icon(
                          Icons.login_outlined,
                          color: Color(0xFF595959),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Container(
                  width: double.infinity,
                  height: 3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF9902), Color(0xFFFFFF00)],
                      stops: [0, 1],
                      begin: AlignmentDirectional(-1, 0),
                      end: AlignmentDirectional(1, 0),
                    ),
                  ),
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
                                'Secciones',
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
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            NuevaTareaWidget(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.add_circle,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 0),
                                        child: Text(
                                          'Nueva Tarea',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 14,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ListaTareasWidget(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.list,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 0),
                                        child: Text(
                                          'Lista Tareas',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 14,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MIPerfilWidget(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 0),
                                        child: Text(
                                          'Mi Perfil',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 14,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tarreas Pendientes',
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
                                    .where('estado', isEqualTo: false),
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
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 10, 5),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 10,
                                                                    0, 0),
                                                        child: Slidable(
                                                          actionPane:
                                                              const SlidableScrollActionPane(),
                                                          secondaryActions: [
                                                            IconSlideAction(
                                                              caption: 'Hecho',
                                                              color:
                                                                  Colors.blue,
                                                              icon: Icons.check,
                                                              onTap: () async {
                                                                final tareaUpdateData =
                                                                    createTareaRecordData(
                                                                  estado: true,
                                                                );
                                                                await listViewTareaRecord
                                                                    .reference
                                                                    .update(
                                                                        tareaUpdateData);
                                                              },
                                                            ),
                                                            IconSlideAction(
                                                              caption:
                                                                  'Detalle',
                                                              color: Color(
                                                                  0xFFE97915),
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
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            DetalleTareaWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                            IconSlideAction(
                                                              caption:
                                                                  'Eliminar',
                                                              color: Color(
                                                                  0xFFF21414),
                                                              icon:
                                                                  Icons.delete,
                                                              onTap: () async {
                                                                await listViewTareaRecord
                                                                    .reference
                                                                    .delete();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1,
                                                            ),
                                                            subtitle: Text(
                                                              listViewTareaRecord
                                                                  .descripcion,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2,
                                                            ),
                                                            trailing: Icon(
                                                              Icons
                                                                  .arrow_back_ios,
                                                              color: Color(
                                                                  0xFF303030),
                                                              size: 20,
                                                            ),
                                                            tileColor: Color(
                                                                0xFFF5F5F5),
                                                            dense: false,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
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
