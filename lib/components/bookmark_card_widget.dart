import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'bookmarks_screen_model.dart'; // For Bookmark class
import 'bookmark_card_model.dart';
export 'bookmark_card_model.dart';

class BookmarkCardWidget extends StatefulWidget {
  const BookmarkCardWidget({
    super.key,
    required this.bookmark,
    required this.onDelete,
  });

  final Bookmark bookmark;
  final VoidCallback onDelete;

  @override
  State<BookmarkCardWidget> createState() => _BookmarkCardWidgetState();
}

class _BookmarkCardWidgetState extends State<BookmarkCardWidget> {
  late BookmarkCardModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookmarkCardModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.bookmark.verse,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    widget.bookmark.note,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Type: ${widget.bookmark.type}',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          letterSpacing: 0.0,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: FlutterFlowTheme.of(context).error),
              onPressed: widget.onDelete,
            ),
          ],
        ),
      ),
    );
  }
}