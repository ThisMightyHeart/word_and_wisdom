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
            // Search bar
            TextFormField(
              controller: _model.seachTextFieldTextController,
              focusNode: _model.seachTextFieldFocusNode,
              decoration: InputDecoration(
                hintText: 'Search versions...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).lineColor,
                  ),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              onChanged: (_) => setState(() {}), // Add this to refresh list on search
            ),
            const SizedBox(height: 16),
            // List of versions
            Expanded(
              child: FutureBuilder<ApiCallResponse>(
                future: BibleForUApiGroup.listOfVersionsCall.call(), // Updated API call name
                builder: (context, snapshot) {
                  // Handle error state
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error loading versions: ${snapshot.error}',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final versionsResponse = snapshot.data!;
                  if (versionsResponse.statusCode != 200) {
                    return Center(
                      child: Text(
                        'Failed to load versions. Status: ${versionsResponse.statusCode}',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    );
                  }

                  final versionsList = getJsonField(
                    versionsResponse.jsonBody,
                    r'''$.data''', // Updated JSON path
                  )?.toList() ?? [];

                  // Search filter
                  final searchText = _model.seachTextFieldTextController?.text.toLowerCase() ?? '';
                  final filteredVersions = searchText.isEmpty
                      ? versionsList
                      : versionsList.where((version) {
                          final name = getJsonField(version, r'''$.name''')?.toString().toLowerCase() ?? '';
                          final shortName = getJsonField(version, r'''$.abbreviation''')?.toString().toLowerCase() ?? ''; // Updated field name
                          return name.contains(searchText) || shortName.contains(searchText);
                        }).toList();

                  if (filteredVersions.isEmpty) {
                    return Center(
                      child: Text(
                        'No versions found.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredVersions.length,
                    itemBuilder: (context, index) {
                      final versionItem = filteredVersions[index];
                      final versionName = getJsonField(versionItem, r'''$.name''')?.toString() ?? '';
                      final versionShortName = getJsonField(versionItem, r'''$.abbreviation''')?.toString() ?? ''; // Updated field name

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
                          setState(() {
                            FFAppState().translationSelection = versionShortName;
                          });
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
