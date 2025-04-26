import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verses_model.dart';

export 'verses_model.dart';

class VersesWidget extends StatefulWidget {
  const VersesWidget({
    super.key,
    this.getBooksShortName,
    this.chaptersNum,
  });

  final String? getBooksShortName;
  final String? chaptersNum;

  @override
  State<VersesWidget> createState() => _VersesWidgetState();
}

class _VersesWidgetState extends State<VersesWidget> {
  late VersesModel _model;
  late Future<ApiCallResponse> _chapterFuture;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VersesModel());

    _chapterFuture = BibleForUApiGroup.listOfVersesCall.call(
      versionShortName: FFAppState().translationSelection,
      booksShortName: widget.getBooksShortName ?? 'Gen',
      chaptersNum: widget.chaptersNum ?? '1',
    );
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 0,
        title: Text(
          '${widget.getBooksShortName ?? 'Gen'} ${widget.chaptersNum ?? '1'}',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                font: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                ),
                letterSpacing: 0.0,
              ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<ApiCallResponse>(
        future: _chapterFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final chapterData = snapshot.data!;
          final verses = getJsonField(
            chapterData.jsonBody,
            r'''$.data.verses[:]''',
          ).toList();

          if (verses.isEmpty) {
            return Center(
              child: Text(
                'No verses found.',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            itemCount: verses.length,
            itemBuilder: (context, index) {
              final verseItem = verses[index];
              final verseNumber = getJsonField(verseItem, r'''$.verse''')?.toString() ?? '';
              final verseText = getJsonField(verseItem, r'''$.text''')?.toString() ?? '';

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$verseNumber ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.bold,
                            ),
                            letterSpacing: 0.0,
                          ),
                    ),
                    Expanded(
                      child: Text(
                        verseText,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
