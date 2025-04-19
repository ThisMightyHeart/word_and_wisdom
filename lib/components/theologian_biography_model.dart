import '/components/theologian_biography_modal_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'theologian_biography_widget.dart' show TheologianBiographyWidget;
import 'package:flutter/material.dart';

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
