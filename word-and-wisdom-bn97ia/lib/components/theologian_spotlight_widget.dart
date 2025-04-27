import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TheologianSpotlightModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theologians = [
      {
        'name': 'John Calvin',
        'image':
            'https://i.postimg.cc/FsFJL5Rn/John-Calvin2.jpg',
      },
      {
        'name': 'Charles Spurgeon',
        'image':
            'https://i.postimg.cc/jd8n6gnq/spurgeon-portrait-orig2.jpg',
      },
      {
        'name': 'Martin Luther',
        'image':
            'https://i.postimg.cc/mgJcJPS0/theologian-martin-luther-underwood-archives.jpg',
      },
      {
        'name': 'John Edwards',
        'image':
            'https://i.postimg.cc/vmwqrLKB/Screenshot-2025-04-14-155418.png',
      },
      {
        'name': 'John Knox',
        'image':
            'https://i.postimg.cc/R0t3Bvsq/knox.png',
      },
      {
        'name': 'Ulrich Zwingli',
        'image':
            'https://i.postimg.cc/mgtzmY7Y/zwingli.jpg',
      },
      {
        'name': 'Philip Melanchthon',
        'image':
            'https://i.postimg.cc/85tT83Sj/philipmelanthonan.jpg',
      },
      {
        'name': 'Thomas Cranmer',
        'image':
            'https://i.postimg.cc/0jjP9fkZ/Thomas-Cranmer-463967527-1b5c5d632c1b41b3af3f6a2cde18316a.jpg',
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Theologian Spotlight',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      font: GoogleFonts.pirataOne(),
                      fontSize: 24.0,
                      letterSpacing: 1.0,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 150.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              itemCount: theologians.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16.0),
              itemBuilder: (context, index) {
                final theologian = theologians[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          theologian['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      width: 100,
                      child: Text(
                        theologian['name']!,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              font: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w600,
                              ),
                              fontSize: 12,
                            ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
