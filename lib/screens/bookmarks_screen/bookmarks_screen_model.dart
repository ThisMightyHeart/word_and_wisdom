import '/components/bookmark_card_widget.dart';
import '/components/bookmark_card_model.dart'; // Added this import
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'bookmarks_screen_widget.dart' show BookmarksScreenWidget;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Bookmark {
  final String verse;
  final String note;
  final String type; // 'Bookmark' or 'Note'

  Bookmark({required this.verse, required this.note, required this.type});

  Map<String, dynamic> toJson() => {
        'verse': verse,
        'note': note,
        'type': type,
      };

  factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
        verse: json['verse'],
        note: json['note'],
        type: json['type'],
      );
}

class BookmarksScreenModel extends FlutterFlowModel<BookmarksScreenWidget> {
  /// State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  // List of bookmarks
  List<Bookmark> bookmarks = [];
  late SharedPreferences _prefs;

  // Model for BookmarkCard component (dynamic list support)
  late FlutterFlowDynamicModels<BookmarkCardModel> bookmarkCardModels;

  @override
  void initState(BuildContext context) {
    bookmarkCardModels = FlutterFlowDynamicModels(() => BookmarkCardModel());
    textController ??= TextEditingController();
    textFieldFocusNode ??= FocusNode();
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    _prefs = await SharedPreferences.getInstance();
    final bookmarkData = _prefs.getString('bookmarks');
    if (bookmarkData != null) {
      final List<dynamic> bookmarkList = jsonDecode(bookmarkData);
      bookmarks = bookmarkList.map((item) => Bookmark.fromJson(item)).toList();
    }
    onUpdate(); // Notify the widget to rebuild
  }

  Future<void> addBookmark(Bookmark bookmark) async {
    bookmarks.add(bookmark);
    await _prefs.setString(
        'bookmarks', jsonEncode(bookmarks.map((b) => b.toJson()).toList()));
    onUpdate();
  }

  Future<void> removeBookmark(int index) async {
    bookmarks.removeAt(index);
    await _prefs.setString(
        'bookmarks', jsonEncode(bookmarks.map((b) => b.toJson()).toList()));
    onUpdate();
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
    bookmarkCardModels.dispose();
    super.dispose();
  }
}