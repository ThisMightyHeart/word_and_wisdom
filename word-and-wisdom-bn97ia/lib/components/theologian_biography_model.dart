import '/components/theologian_biography_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'theologian_biography_widget.dart' show TheologianBiographyWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TheologianBiographyModel
    extends FlutterFlowModel<TheologianBiographyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TheologianBiographyModal component.
  late TheologianBiographyModalModel theologianBiographyModalModel;

  @override
  void initState(BuildContext context) {
    theologianBiographyModalModel =
        createModel(context, () => TheologianBiographyModalModel());
  }

  @override
  void dispose() {
    theologianBiographyModalModel.dispose();
  }
}
