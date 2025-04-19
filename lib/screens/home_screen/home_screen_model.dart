import '/components/theologian_spotlight_widget.dart';
import '/components/verse_of_the_day_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:flutter/material.dart';

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
