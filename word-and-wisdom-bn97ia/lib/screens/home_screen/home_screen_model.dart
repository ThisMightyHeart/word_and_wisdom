import '/components/theologian_spotlight_widget.dart';
import '/components/verse_of_the_day_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreenModel extends FlutterFlowModel<HomeScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for VerseOfTheDay component.
  late VerseOfTheDayModel verseOfTheDayModel;
  // Model for TheologianSpotlight component.
  late TheologianSpotlightModel theologianSpotlightModel;

  @override
  void initState(BuildContext context) {
    verseOfTheDayModel = createModel(context, () => VerseOfTheDayModel());
    theologianSpotlightModel =
        createModel(context, () => TheologianSpotlightModel());
  }

  @override
  void dispose() {
    verseOfTheDayModel.dispose();
    theologianSpotlightModel.dispose();
  }
}
