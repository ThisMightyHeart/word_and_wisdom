import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start BibleForUApi Group Code

class BibleForUApiGroup {
  static String getBaseUrl() => 'https://bible4u.net/api/v1/';
  static Map<String, String> headers = {};
  static final ListOfVersionsCall listOfVersionsCall = ListOfVersionsCall();
  static final ListOfBooksCall listOfBooksCall = ListOfBooksCall();
  static final ListofChaptersCall listofChaptersCall = ListofChaptersCall();
  static final ListOfVersesCall listOfVersesCall = ListOfVersesCall();
}

class ListOfVersionsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = BibleForUApiGroup.getBaseUrl();
    try {
      final response = await ApiManager.instance.makeApiCall(
        callName: 'ListOfVersions',
        apiUrl: '${baseUrl}bibles',
        callType: ApiCallType.GET,
        headers: {
          'Accept': 'application/json',
        },
        params: {},
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: true,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      );

      if (response.succeeded && response.jsonBody != null) {
        final Map<String, dynamic> formattedResponse = {
          'data': response.jsonBody['data'] ?? [],
          'success': response.jsonBody['success'] ?? false
        };
        
        return ApiCallResponse(
          formattedResponse,
          response.headers,
          response.statusCode,
        );
      }
      
      return response;
    } catch (e) {
      print('API call error: $e');
      return ApiCallResponse(
        {
          'data': [],
          'success': false,
          'error': e.toString()
        },
        {},
        500,
      );
    }
  }
}

class ListOfBooksCall {
  Future<ApiCallResponse> call({
    String? versionsShortName = '',
  }) async {
    final baseUrl = BibleForUApiGroup.getBaseUrl();
    return ApiManager.instance.makeApiCall(
      callName: 'ListOfBooks',
      apiUrl: '${baseUrl}bibles/$versionsShortName',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
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
      apiUrl: '${baseUrl}bibles/$versionsShortName/books/$booksShortName',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
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
      apiUrl: '${baseUrl}bibles/$versionShortName/books/$booksShortName/chapters/$chaptersNum',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BibleForUApi Group Code
