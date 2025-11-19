// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Extract and return base64string from selected uploaded file
import 'dart:convert';

Future<String> fFUploadedMp3ToBase64(FFUploadedFile sselectedSound) async {
  try {
    if (sselectedSound.bytes == null || sselectedSound.bytes!.isEmpty) {
      return '';
    }

    String base64String = base64Encode(sselectedSound.bytes!);
    return base64String;
  } catch (e) {
    print('Error converting uploaded file to base64: $e');
    return '';
  }
}
