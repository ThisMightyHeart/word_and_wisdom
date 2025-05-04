import '/backend/api_requests/api_calls.dart';
import '/bible/components/books/books_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bible_index_model.dart';
export 'bible_index_model.dart';

class BibleIndexWidget extends StatefulWidget {
  const BibleIndexWidget({
    super.key,
    this.getBooksShortName,
    this.getChaptersNumbers,
    this.getVersesNumbers,
  });

  final String? getBooksShortName;
  final String? getChaptersNumbers;
  final String? getVersesNumbers;

  static String routeName = 'BibleIndex';
  static String routePath = '/bibleIndex';

  @override
  State<BibleIndexWidget> createState() => _BibleIndexWidgetState();
}

class _BibleIndexWidgetState extends State<BibleIndexWidget> {
  late BibleIndexModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BibleIndexModel());
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 1.0,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    final result = await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context).height * 0.9,
                                              child: BooksWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    if (result != null) {
                                      context.pushNamed(
                                        BibleIndexWidget.routeName,
                                        queryParameters: {
                                          'getBooksShortName': serializeParam(
                                            result.toString(),
                                            ParamType.String,
                                          ),
                                          'getChaptersNumbers': serializeParam(
                                            widget.getChaptersNumbers ?? '1',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  text: valueOrDefault<String>(
                                    widget.getBooksShortName,
                                    'Gen',
                                  ),
                                  options: FFButtonOptions(
                                    width: 100.0,
                                    padding: EdgeInsets.all(15.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).lineColor,
                                    textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                      font: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                    ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  showLoadingIndicator: false,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      print('Current translation: ${FFAppState().translationSelection}');
                                      final result = await context.push('/version');
                                      print('Returned from version selection with result: $result');
                                      if (result != null) {
                                        setState(() {
                                          FFAppState().translationSelection = result.toString();
                                        });
                                      }
                                    },
                                    text: valueOrDefault<String>(
                                      FFAppState().translationSelection,
                                      'Select Translation',
                                    ),
                                    options: FFButtonOptions(
                                      padding: EdgeInsets.all(15.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (Theme.of(context).brightness ==
                                      Brightness.dark)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setDarkModeSetting(
                                            context, ThemeMode.light);
                                      },
                                      child: Icon(
                                        Icons.nights_stay_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  if (Theme.of(context).brightness ==
                                      Brightness.light)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setDarkModeSetting(
                                            context, ThemeMode.dark);
                                      },
                                      child: Icon(
                                        Icons.wb_sunny_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.9,
                                                  child: BooksWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Icon(
                                        Icons.search_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
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
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FutureBuilder<ApiCallResponse>(
                          future: BibleForUApiGroup.listOfVersesCall.call(
                            versionShortName: FFAppState().translationSelection,
                            bookShortName: valueOrDefault<String>(
                              widget.getBooksShortName,
                              'Gen',
                            ),
                            chapterNumber: valueOrDefault<String>(
                              widget.getChaptersNumbers,
                              '1',
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: LinearProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              );
                            }
                            
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  'Error loading verses: ${snapshot.error}',
                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              );
                            }

                            final listViewListOfVersesResponse = snapshot.data!;
                            
                            // Debug print the response
                            print('Full API Response: ${listViewListOfVersesResponse.jsonBody}');
                            print('Translation Selection: ${FFAppState().translationSelection}');
                            print('Book: ${widget.getBooksShortName}');
                            print('Chapter: ${widget.getChaptersNumbers}');
                            
                            // Check the data structure
                            final data = getJsonField(
                              listViewListOfVersesResponse.jsonBody,
                              r'''$.data''',
                            );
                            print('Data field: $data');
                            
                            final verses = getJsonField(
                              listViewListOfVersesResponse.jsonBody,
                              r'''$.data.verses''',
                            );
                            print('Verses field: $verses');

                            return Builder(
                              builder: (context) {
                                final versesData = getJsonField(
                                  listViewListOfVersesResponse.jsonBody,
                                  r'''$.data.verses''',
                                );
                                
                                if (versesData == null) {
                                  return Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'No verses found',
                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                        ),
                                        Text(
                                          'Please check your translation selection',
                                          style: FlutterFlowTheme.of(context).bodySmall,
                                        ),
                                      ],
                                    ),
                                  );
                                }

                                final versesItems = versesData.toList();
                                print('Number of verses found: ${versesItems.length}');

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: versesItems.length,
                                  itemBuilder: (context, versesItemsIndex) {
                                    final versesItemsItem =
                                        versesItems[versesItemsIndex];
                                    final verseRef = getJsonField(
                                      versesItemsItem,
                                      r'''$.ref''',
                                    ).toString();
                                    final verseText = getJsonField(
                                      versesItemsItem,
                                      r'''$.text''',
                                    ).toString();
                                    print('Verse $verseRef: $verseText');
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            verseRef,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts
                                                      .plusJakartaSans(
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 8.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                verseText,
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
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
            ],
          ),
        ),
      ),
    );
  }
}
