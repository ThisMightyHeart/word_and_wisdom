import '/components/theologian_spotlight_widget.dart';
import '/components/verse_of_the_day_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_screen_model.dart';

export 'home_screen_model.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  static String routeName = 'homeScreen';
  static String routePath = '/homeScreen';

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  late HomeScreenModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add navigation logic here if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            children: [
              // Title Header
              Center(
                child: Text(
                  'Word + Wisdom',
                  style: GoogleFonts.pirataOne(
                    fontSize: 36,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Verse of the Day
              VerseOfTheDayWidget(),
              const SizedBox(height: 16),

              // Theologian Spotlight
              TheologianSpotlightWidget(),
              const SizedBox(height: 32),

              // Custom Menu Items
              _buildMenuItem(context, 'Home'),
              _buildMenuItem(context, 'Bible'),
              _buildMenuItem(context, 'Bookmarks'),
              _buildMenuItem(context, 'Theologians'),
              _buildMenuItem(context, 'The Creeds'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        selectedItemColor: FlutterFlowTheme.of(context).primary,
        unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
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

  Widget _buildMenuItem(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: GestureDetector(
          onTap: () {
            print('Tapped $label');
          },
          child: AutoSizeText(
            label,
            minFontSize: 18.0,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  font: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ),
    );
  }
}
