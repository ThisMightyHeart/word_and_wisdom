import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAhiDu7C7brUzh6LhTzV35Wzp0UpzEnxEQ",
            authDomain: "word-and-wisdom-bn97ia.firebaseapp.com",
            projectId: "word-and-wisdom-bn97ia",
            storageBucket: "word-and-wisdom-bn97ia.firebasestorage.app",
            messagingSenderId: "878496680887",
            appId: "1:878496680887:web:abdd05e3c4c1302d937632",
            measurementId: "G-6MHXNKT5BV"));
  } else {
    await Firebase.initializeApp();
  }
}
