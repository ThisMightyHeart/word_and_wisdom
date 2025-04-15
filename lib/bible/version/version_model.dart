import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'version_widget.dart' show VersionWidget;
import 'package:flutter/material.dart';

class VersionModel extends FlutterFlowModel<VersionWidget> {
  FocusNode? seachTextFieldFocusNode;
  TextEditingController? seachTextFieldTextController;
  String? Function(BuildContext, String?)?
      seachTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    seachTextFieldFocusNode?.dispose();
    seachTextFieldTextController?.dispose();
  }
}
