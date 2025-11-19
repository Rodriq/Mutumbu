import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'humm_widget.dart' show HummWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class HummModel extends FlutterFlowModel<HummWidget> {
  ///  Local state fields for this page.

  bool isRecording = false;

  String? recordedSound;

  ///  State fields for stateful widgets in this page.

  AudioRecorder? audioRecorder;
  String? newRecording;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - audioToBase64] action in Button widget.
  String? audioByte;
  // Stores action output result for [Backend Call - API (Generate full lyrics)] action in Button widget.
  ApiCallResponse? apiResultwms;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
