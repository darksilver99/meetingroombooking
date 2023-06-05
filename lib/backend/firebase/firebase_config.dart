import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyASilgGXJAj8kTAKUySGp9Ww_hqSFASYGo",
            authDomain: "meetingroombooking-bb247.firebaseapp.com",
            projectId: "meetingroombooking-bb247",
            storageBucket: "meetingroombooking-bb247.appspot.com",
            messagingSenderId: "453761745957",
            appId: "1:453761745957:web:2b6de66e4fb60e54322bcc",
            measurementId: "G-3TQ6QPRBL4"));
  } else {
    await Firebase.initializeApp();
  }
}
