import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start BibleForUApi Group Code

class BibleForUApiGroup {
  static String getBaseUrl() => 'https://bible4u.net/api/v1/';
  static Map<String, String> headers = {};
  static ListOfVersionsCall listOfVersionsCall = ListOfVersionsCall();
  static ListOfBooksCall listOfBooksCall = ListOfBooksCall();
  static ListofChaptersCall listofChaptersCall = ListofChaptersCall();
  static ListOfVersesCall listOfVersesCall = ListOfVersesCall();
}

class ListOfVersionsCall {
  Future<ApiCallResponse> call({
    String? versionsShortName = '',
  }) async {
    final baseUrl = BibleForUApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ListOfVersions',
      apiUrl: '${baseUrl}bibles',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListOfBooksCall {
  Future<ApiCallResponse> call({
    String? versionsShortName = '',
  }) async {
    final baseUrl = BibleForUApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ListOfBooks',
      apiUrl: '${baseUrl}bibles/${versionsShortName}/books',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListofChaptersCall {
  Future<ApiCallResponse> call({
    String? versionsShortName = '',
    String? booksShortName = '',
  }) async {
    final baseUrl = BibleForUApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ListofChapters',
      apiUrl: '${baseUrl}bibles/${versionsShortName}/books/${booksShortName}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListOfVersesCall {
  Future<ApiCallResponse> call({
    String? versionShortName = '',
    String? booksShortName = '',
    String? chaptersNum = '',
  }) async {
    final baseUrl = BibleForUApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ListOfVerses',
      apiUrl:
          '${baseUrl}bibles/${versionShortName}/books/${booksShortName}/chapters/${chaptersNum}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BibleForUApi Group Code

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