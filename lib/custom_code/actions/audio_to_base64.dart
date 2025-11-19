// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// read content of a recorded audio and return the base64
import 'dart:convert';
import 'dart:io';

Future<String> audioToBase64(String recordedAudio) async {
  try {
    // Check if the recordedAudio path is valid
    if (recordedAudio.isEmpty) {
      throw Exception('Audio file path is empty');
    }

    // Create a File object from the audio file path
    File audioFile = File(recordedAudio);

    // Check if the file exists
    if (!await audioFile.exists()) {
      throw Exception('Audio file does not exist at path: $recordedAudio');
    }

    // Read the file as bytes
    List<int> audioBytes = await audioFile.readAsBytes();

    // Convert bytes to base64 string
    String base64Audio = base64Encode(audioBytes);

    return base64Audio;
  } catch (e) {
    // Handle any errors and return empty string or error message
    print('Error reading audio file: $e');
    return '';
  }
}
