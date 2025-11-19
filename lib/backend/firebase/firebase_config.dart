import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD_BTmIhxNP7XH9qGcR0NbNbxV2bvbpYLo",
            authDomain: "cat-cm-1ujslb.firebaseapp.com",
            projectId: "cat-cm-1ujslb",
            storageBucket: "cat-cm-1ujslb.firebasestorage.app",
            messagingSenderId: "574406167246",
            appId: "1:574406167246:web:91bcb109478d496ea85e9f"));
  } else {
    await Firebase.initializeApp();
  }
}
