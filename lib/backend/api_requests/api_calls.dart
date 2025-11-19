import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GenerateHummingLyricsCall {
  static Future<ApiCallResponse> call({
    String? audioBasse64 = '',
    String? genre = '',
    String? description = '',
  }) async {
    final ffApiRequestBody = '''
{
  "audioBase64": "${escapeStringForJson(audioBasse64)}",
  "genre": "${escapeStringForJson(genre)}",
  "description": "${escapeStringForJson(description)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate Humming Lyrics',
      apiUrl: 'https://n8n.nocodesolutions.tech/webhook/hum-to-lyrics',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? generatedLyrics(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.lyrics''',
      ));
}

class GenerateMusicFeedbackCall {
  static Future<ApiCallResponse> call({
    String? audioBasse64 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "audioBase64": "${escapeStringForJson(audioBasse64)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate Music Feedback',
      apiUrl: 'https://n8n.nocodesolutions.tech/webhook/music-feedback',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? feedback(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.feedback''',
      ));
}

class GenerateFullLyricsCall {
  static Future<ApiCallResponse> call({
    String? prompt = '',
    String? genre = '',
    double? englishLevel,
    double? frenchLevel,
    double? pidginLevel,
  }) async {
    final ffApiRequestBody = '''
{
  "prompt": "${escapeStringForJson(prompt)}",
  "genre": "${escapeStringForJson(genre)}",
  "englishLevel": ${englishLevel},
  "frenchLevel": ${frenchLevel},
  "pidginLevel": ${pidginLevel}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate full lyrics',
      apiUrl:
          'https://n8n.nocodesolutions.tech/webhook/cimfest-lyrics-generator',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lyrics.title''',
      ));
  static String? verseOne(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lyrics.verse1''',
      ));
  static String? verseTwo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lyrics.verse2''',
      ));
  static String? chorus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lyrics.chorus''',
      ));
  static String? bridge(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lyrics.bridge''',
      ));
  static String? outro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lyrics.outro''',
      ));
}

class GenerateMusicCall {
  static Future<ApiCallResponse> call({
    String? lyrics = '',
    String? genre = '',
  }) async {
    final ffApiRequestBody = '''
{
  "lyrics": "${escapeStringForJson(lyrics)}",
  "genre": "${escapeStringForJson(genre)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate Music',
      apiUrl: 'https://n8n.nocodesolutions.tech/webhook/song-from-lyrics',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'Application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
