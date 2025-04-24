import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/nav/nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word + Wisdom',
      theme: FlutterFlowTheme.lightTheme,
      darkTheme: FlutterFlowTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const NavBarPage(initialPage: 'homeScreen'),
      navigatorKey: appNavigatorKey,
      onGenerateRoute: createRouter(AppStateNotifier.instance).configuration,
    );
  }
}