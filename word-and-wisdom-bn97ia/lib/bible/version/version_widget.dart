import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'version_model.dart';

export 'version_model.dart';

class VersionWidget extends StatefulWidget {
  const VersionWidget({Key? key}) : super(key: key);

  static String routeName = 'Version';
  static String routePath = '/version';

  @override
  _VersionWidgetState createState() => _VersionWidgetState();
}

class _VersionWidgetState extends State<VersionWidget> {
  late VersionModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VersionModel());

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
        elevation: 0,
        title: Text(
          'Select Version',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                font: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                ),
                letterSpacing: 0.0,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextFormField(
              controller: _model.seachTextFieldTextController,
              focusNode: _model.seachTextFieldFocusNode,
              decoration: InputDecoration(
                hintText: 'Search versions...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).lineColor,
                  ),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
            const SizedBox(height: 16),

            // List of Bible Versions
            Expanded(
              child: FutureBuilder<ApiCallResponse>(
                future: BibleForUApiGroup.listOfVersionsCall.call(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final versionsResponse = snapshot.data!;
                  final versionsList = getJsonField(
                    versionsResponse.jsonBody,
                    r'''$.data.versions[:]''',
                  ).toList();

                  // Filter by search text
                  final searchText = _model.seachTextFieldTextController?.text.toLowerCase() ?? '';
                  final filteredVersions = searchText.isEmpty
                      ? versionsList
                      : versionsList.where((version) {
                          final name = getJsonField(version, r'''$.name''')?.toString().toLowerCase() ?? '';
                          return name.contains(searchText);
                        }).toList();

                  if (filteredVersions.isEmpty) {
                    return Center(
                      child: Text(
                        'No results found.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredVersions.length,
                    itemBuilder: (context, index) {
                      final versionItem = filteredVersions[index];
                      final versionName = getJsonField(versionItem, r'''$.name''')?.toString() ?? '';
                      final versionShortName = getJsonField(versionItem, r'''$.ref''')?.toString() ?? '';

                      return ListTile(
                        title: Text(
                          versionName,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        subtitle: Text(
                          versionShortName,
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                        trailing: FFAppState().translationSelection == versionShortName
                            ? Icon(Icons.check, color: FlutterFlowTheme.of(context).primary)
                            : null,
                        onTap: () async {
                          FFAppState().translationSelection = versionShortName;
                          FFAppState().update(() {});
                          Navigator.pop(context);
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
    );
  }
}
