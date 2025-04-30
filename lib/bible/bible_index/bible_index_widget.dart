import '/backend/api_requests/api_calls.dart';
import '/bible/components/books/books_widget.dart';
import '/bible/version/version_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bible_index_model.dart';
export 'bible_index_model.dart';

class BibleIndexWidget extends StatefulWidget {
  const BibleIndexWidget({super.key, this.getBooksShortName, this.getChaptersNumbers, this.getVersesNumbers});

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

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            Material(
              color: Colors.transparent,
              elevation: 1.0,
              child: Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => const BooksWidget(),
                            );
                          },
                          text: valueOrDefault<String>(
                            widget.getBooksShortName,
                            'Gen',
                          ),
                          options: FFButtonOptions(
                            width: 100,
                            padding: const EdgeInsets.all(15),
                            color: FlutterFlowTheme.of(context).lineColor,
                            textStyle: FlutterFlowTheme.of(context).labelLarge,
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        const SizedBox(width: 5),
                        FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => const VersionWidget(),
                            );
                          },
                          text: FFAppState().translationSelection.isEmpty 
                              ? 'KJV' // Provide default translation if none selected
                              : FFAppState().translationSelection,
                          options: FFButtonOptions(
                            padding: const EdgeInsets.all(15),
                            color: FlutterFlowTheme.of(context).lineColor,
                            textStyle: FlutterFlowTheme.of(context).labelLarge,
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: FutureBuilder<ApiCallResponse>(
                  future: BibleForUApiGroup.listOfVersesCall.call(
                    versionShortName: FFAppState().translationSelection.isEmpty 
                        ? 'KJV' // Provide default translation if none selected
                        : FFAppState().translationSelection,
                    booksShortName: widget.getBooksShortName ?? 'Gen',
                    chaptersNum: widget.getChaptersNumbers ?? '1',
                  ),
                  builder: (context, snapshot) {
                    // Show error if there is one
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    
                    // Show loading indicator while waiting
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final verses = (getJsonField(snapshot.data!.jsonBody, r'$.data.verses') as List?)?.cast<Map<String, dynamic>>() ?? [];
                    
                    if (verses.isEmpty) {
                      return const Center(child: Text('No verses found.'));
                    }

                    return ListView.builder(
                      itemCount: verses.length,
                      itemBuilder: (context, index) {
                        final verse = verses[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                verse['ref']?.toString() ?? '',
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  verse['text']?.toString() ?? '',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
