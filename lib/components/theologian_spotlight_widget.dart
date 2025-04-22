import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'theologian_spotlight_model.dart';
export 'theologian_spotlight_model.dart';

class TheologianSpotlightWidget extends StatefulWidget {
  const TheologianSpotlightWidget({super.key});

  @override
  State<TheologianSpotlightWidget> createState() =>
      _TheologianSpotlightWidgetState();
}

class _TheologianSpotlightWidgetState extends State<TheologianSpotlightWidget> {
  late TheologianSpotlightModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TheologianSpotlightModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Theologian Spotlight',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Plus Jakarta Sans',
                  letterSpacing: 0.0,
                ),
          ),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 1.0),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'C.S. Lewis',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'C.S. Lewis was a British writer and lay theologian. He is best known for his works on Christian apologetics, including "Mere Christianity" and "The Screwtape Letters," as well as his fictional series "The Chronicles of Narnia."',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}