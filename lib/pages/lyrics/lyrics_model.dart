import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lyrics_widget.dart' show LyricsWidget;
import 'package:flutter/material.dart';

class LyricsModel extends FlutterFlowModel<LyricsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for theLyrics widget.
  FocusNode? theLyricsFocusNode;
  TextEditingController? theLyricsTextController;
  String? Function(BuildContext, String?)? theLyricsTextControllerValidator;
  // Stores action output result for [Backend Call - API (Generate Music)] action in Button widget.
  ApiCallResponse? apiResultfhd;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    theLyricsFocusNode?.dispose();
    theLyricsTextController?.dispose();
  }
}
