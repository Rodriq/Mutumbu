import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'prompt_lyrics_widget.dart' show PromptLyricsWidget;
import 'package:flutter/material.dart';

class PromptLyricsModel extends FlutterFlowModel<PromptLyricsWidget> {
  ///  Local state fields for this page.

  Genre? selectedGenre;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for promptField widget.
  FocusNode? promptFieldFocusNode;
  TextEditingController? promptFieldTextController;
  String? Function(BuildContext, String?)? promptFieldTextControllerValidator;
  String? _promptFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '14kxhcrv' /* Song idea or desscription requ... */,
      );
    }

    return null;
  }

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for EnglishSlider widget.
  double? englishSliderValue;
  // State field(s) for FrenchSlider widget.
  double? frenchSliderValue;
  // State field(s) for PidginSlider widget.
  double? pidginSliderValue;
  // State field(s) for LyricsOnly widget.
  FocusNode? lyricsOnlyFocusNode;
  TextEditingController? lyricsOnlyTextController;
  String? Function(BuildContext, String?)? lyricsOnlyTextControllerValidator;
  // State field(s) for LyricsGenreChoiceChips widget.
  FormFieldController<List<String>>? lyricsGenreChoiceChipsValueController;
  String? get lyricsGenreChoiceChipsValue =>
      lyricsGenreChoiceChipsValueController?.value?.firstOrNull;
  set lyricsGenreChoiceChipsValue(String? val) =>
      lyricsGenreChoiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validated;
  // Stores action output result for [Backend Call - API (Generate full lyrics)] action in Button widget.
  ApiCallResponse? newOutpuhk;
  // Stores action output result for [Backend Call - API (Generate Music)] action in Button widget.
  ApiCallResponse? apiResultmyt;

  @override
  void initState(BuildContext context) {
    promptFieldTextControllerValidator = _promptFieldTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    promptFieldFocusNode?.dispose();
    promptFieldTextController?.dispose();

    lyricsOnlyFocusNode?.dispose();
    lyricsOnlyTextController?.dispose();
  }
}
