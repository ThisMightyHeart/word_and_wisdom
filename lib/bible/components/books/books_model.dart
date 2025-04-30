import '/backend/api_requests/api_calls.dart';
import '/bible/components/chapters/chapters_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'books_widget.dart' show BooksWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BooksModel extends FlutterFlowModel<BooksWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for seachTextField widget.
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
