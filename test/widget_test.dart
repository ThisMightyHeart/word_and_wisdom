import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:word_and_wisdom/main.dart';
import 'package:word_and_wisdom/components/verse_of_the_day_widget.dart';
import 'package:word_and_wisdom/components/theologian_spotlight_widget.dart';
import 'package:word_and_wisdom/screens/bookmarks_screen/bookmarks_screen_widget.dart';

void main() {
  testWidgets('MyApp initializes without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('VerseOfTheDayWidget displays verse or loading state', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: VerseOfTheDayWidget()));
    await tester.pump(Duration(seconds: 1)); // Allow for async loading
    expect(find.byType(CircularProgressIndicator), findsOneWidget); // Initially loading
    await tester.pumpAndSettle(Duration(seconds: 5)); // Wait for loading to finish
    expect(find.text('Psalm 23:1-3'), findsOneWidget); // Fallback verse
    expect(find.text('Daily Scripture'), findsOneWidget);
  });

  testWidgets('TheologianSpotlightWidget displays theologian info', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TheologianSpotlightWidget()));
    expect(find.text('Theologian Spotlight'), findsOneWidget);
    expect(find.text('C.S. Lewis'), findsOneWidget);
    expect(find.textContaining('Christian apologetics'), findsOneWidget);
  });

  testWidgets('BookmarksScreenWidget displays bookmarks or empty state', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: BookmarksScreenWidget()));
    await tester.pumpAndSettle();
    expect(find.text('My Notes & Bookmarks'), findsOneWidget);
    expect(find.text('No bookmarks found.'), findsOneWidget);

    // Simulate adding a bookmark
    final state = tester.state<_BookmarksScreenWidgetState>(find.byType(BookmarksScreenWidget));
    state._model.addBookmark(Bookmark(
      verse: 'John 3:16',
      note: 'For God so loved the world...',
      type: 'Bookmark',
    ));
    await tester.pumpAndSettle();
    expect(find.text('John 3:16'), findsOneWidget);
    expect(find.text('For God so loved the world...'), findsOneWidget);
  });
}