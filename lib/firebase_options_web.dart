// File: firebase_options_web.dart

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show kIsWeb;

// Replace these with your actual Firebase web app configuration
const firebaseOptions = FirebaseOptions(
  apiKey: "AIzaSyBwJ85le2rfFE7zQAdj8PpHY34qGSLKefA",
  authDomain: "crescereanalytics.firebaseapp.com",
  projectId: "crescereanalytics",
  storageBucket: "crescereanalytics.appspot.com",
  messagingSenderId: "724999131137",
  appId: "1:724999131137:web:9fc919322d65746235f000",
  measurementId: "G-95XZEP5BHM",
);

/// This ensures that the web app will use the correct Firebase configuration
/// based on whether the app is running on the web or not.
FirebaseOptions get firebaseOptionsWeb {
  if (kIsWeb) {
    return firebaseOptions;
  } else {
    throw UnsupportedError(
      'DefaultFirebaseOptions.currentPlatform is not supported for the web.',
    );
  }
}