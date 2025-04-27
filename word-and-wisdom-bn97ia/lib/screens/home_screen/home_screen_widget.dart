import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/components/verse_of_the_day_widget.dart';
import '/components/theologian_spotlight_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  static String routeName = 'homeScreen';
  static String routePath = '/homeScreen';

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // App Header (Word + Wisdom Logo)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Word + Wisdom',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        font: GoogleFonts.pirataOne(),
                        fontSize: 32.0,
                        letterSpacing: 1.5,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Verse Of The Day
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: VerseOfTheDayWidget(),
              ),

              // Theologian Spotlight
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TheologianSpotlightWidget(),
              ),

              // Creeds Images
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.network(
                      'https://i.postimg.cc/63jxbvrZ/Nicene2.png',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16),
                    Image.network(
                      'https://i.postimg.cc/PqMjZcN2/Apostles.png',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16),
                    Image.network(
                      'https://i.postimg.cc/sXDRJchy/Athanasian.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
