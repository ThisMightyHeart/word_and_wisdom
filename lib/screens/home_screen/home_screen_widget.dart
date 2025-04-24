import '/components/theologian_spotlight_widget.dart';
import '/components/verse_of_the_day_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'home_screen_model.dart';
export 'home_screen_model.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  static String routeName = 'homeScreen';
  static String routePath = '/homeScreen';

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  late HomeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Word + Wisdom',
          style: FlutterFlowTheme.of(context).headlineLarge.override(
                fontFamily: 'Pirata One',
                letterSpacing: 0.0,
              ),
        ),
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: wrapWithModel(
                model: _model.verseOfTheDayModel,
                updateCallback: () => safeSetState(() {}),
                child: VerseOfTheDayWidget(),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
              child: wrapWithModel(
                model: _model.theologianSpotlightModel,
                updateCallback: () => safeSetState(() {}),
                child: TheologianSpotlightWidget(),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
              child: Text(
                'Creeds + Confessions',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: ListView(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 44.0),
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 5.0),
                    child: GestureDetector(
                      onTap: () => context.pushNamed('CreedDetail',
                          queryParameters: {'creed': 'Nicene'}),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://i.postimg.cc/63jxbvrZ/Nicene2.png',
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, 1.0),
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.error, size: 50.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 5.0),
                    child: GestureDetector(
                      onTap: () => context.pushNamed('CreedDetail',
                          queryParameters: {'creed': 'Apostles'}),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://i.postimg.cc/PqMjZcN2/Apostles.png',
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.error, size: 50.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 5.0),
                    child: GestureDetector(
                      onTap: () => context.pushNamed('CreedDetail',
                          queryParameters: {'creed': 'Athanasian'}),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://i.postimg.cc/sXDRJchy/Athanasian.png',
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.error, size: 50.0),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}