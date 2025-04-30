import '/backend/api_requests/api_calls.dart';
import '/bible/components/chapters/chapters_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'books_model.dart';
export 'books_model.dart';

class BooksWidget extends StatefulWidget {
  const BooksWidget({
    super.key,
    this.getVersionsShortName,
  });

  final String? getVersionsShortName;

  @override
  State<BooksWidget> createState() => _BooksWidgetState();
}

class _BooksWidgetState extends State<BooksWidget> {
  late BooksModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BooksModel());

    _model.seachTextFieldTextController ??= TextEditingController();
    _model.seachTextFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 50.0,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            Text(
              'Books',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                    ),
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _model.seachTextFieldTextController,
              focusNode: _model.seachTextFieldFocusNode,
              decoration: InputDecoration(
                hintText: 'Search books...',
                prefixIcon: const Icon(Icons.search_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).lineColor,
                  ),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ),
          Expanded(
            child: FutureBuilder<ApiCallResponse>(
              future: BibleForUApiGroup.listOfBooksCall.call(
                versionsShortName: FFAppState().translationSelection.isEmpty
                    ? 'KJV' // Provide default translation if none selected
                    : FFAppState().translationSelection,
              ),
              builder: (context, snapshot) {
                // Show error if there is one
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                
                // Show loading indicator while waiting
                if (!snapshot.hasData) {
                  return Center(
                    child: LinearProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  );
                }

                final bookItems = (getJsonField(
                  snapshot.data!.jsonBody,
                  r'''$.data.books''',
                ) as List?)?.cast<Map<String, dynamic>>() ?? [];

                if (bookItems.isEmpty) {
                  return const Center(child: Text('No books found.'));
                }

                // Filter books if search text is entered
                final searchText = _model.seachTextFieldTextController?.text.toLowerCase() ?? '';
                final filteredBooks = searchText.isEmpty
                    ? bookItems
                    : bookItems.where((book) {
                        final name = book['name']?.toString().toLowerCase() ?? '';
                        return name.contains(searchText);
                      }).toList();

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  itemCount: filteredBooks.length,
                  itemBuilder: (context, index) {
                    final book = filteredBooks[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => ChaptersWidget(
                              getBooksShortName: book['ref']?.toString() ?? '',
                            ),
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xFFB9B4EF),
                              child: Text(
                                (index + 1).toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.plusJakartaSans(),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            title: Text(
                              book['name']?.toString() ?? '',
                              style: FlutterFlowTheme.of(context).bodyMedium,
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
    );
  }
}
