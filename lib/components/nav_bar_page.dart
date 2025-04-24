import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/screens/home_screen/home_screen_widget.dart';
import '/screens/bookmarks_screen/bookmarks_screen_widget.dart';
import '/bible/bible_index/bible_index_widget.dart';
import 'package:flutter/material.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({
    super.key,
    required this.initialPage,
    this.page,
  });

  final String initialPage;
  final Widget? page;

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = '';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'homeScreen': HomeScreenWidget(),
      'BibleIndex': BibleIndexWidget(),
      'bookmarksScreen': BookmarksScreenWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName]!,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) {
          final newPage = tabs.keys.toList()[i];
          setState(() {
            _currentPageName = newPage;
            _currentPage = null;
          });
          context.goNamed(newPage);
        },
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        selectedItemColor: FlutterFlowTheme.of(context).primary,
        unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bible',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
        ],
      ),
    );
  }
}