import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'song_review_widget.dart' show SongReviewWidget;
import 'package:flutter/material.dart';

class SongReviewModel extends FlutterFlowModel<SongReviewWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? uploadedSong;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataP9u = false;
  FFUploadedFile uploadedLocalFile_uploadDataP9u =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - fFUploadedMp3ToBase64] action in Button widget.
  String? convertedFile;
  // Stores action output result for [Backend Call - API (Generate Music Feedback)] action in Button widget.
  ApiCallResponse? apiResult40j;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
