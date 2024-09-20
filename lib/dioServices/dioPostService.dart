import 'dart:io';

import 'package:dio/dio.dart';

import 'baseURL.dart';
import 'dioClient.dart';

class DioPostService extends DioClient {
  DioClient _client = new DioClient();

  Future<Response> pretiumLogin(
      { required Map<String, dynamic> body}) async {
    try {
      Dio _client = Dio();

      return await _client.post(
        BaseURL.Baseurl + "/login",
        data: body,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
    } on DioError catch (dioError) {
      String errorMessage;
      if (dioError.type == DioErrorType.connectionTimeout) {
        errorMessage = 'Connection timeout, please try again later.';
      } else if (dioError.type == DioErrorType.sendTimeout) {
        errorMessage = 'Send timeout, please try again later.';
      } else if (dioError.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Receive timeout, please try again later.';
      } else if (dioError.type == DioErrorType.badResponse) {
        errorMessage = 'Received invalid status code: ${dioError.response?.statusCode}';
      } else if (dioError.type == DioErrorType.cancel) {
        errorMessage = 'Request to server was cancelled.';
      } else {
        errorMessage = 'Unexpected error occurred: ${dioError.message}';
      }
      throw new Exception(errorMessage);
    }
  }
  ///Fetch countries

  Future<Response> fetchCountries(
      ) async {
    try {
      Dio _client = Dio();

      return await _client.post(
        BaseURL.Baseurl + "/countries",
          options: Options(headers: {
            'Authorization': 'Bearer 263|ayC5GBaByhte58rVWUICXUqzdUL3ytcnRepeHHc394f533a6',
          })

      );
    } on DioError catch (dioError) {
      String errorMessage;
      if (dioError.type == DioErrorType.connectionTimeout) {
        errorMessage = 'Connection timeout, please try again later.';
      } else if (dioError.type == DioErrorType.sendTimeout) {
        errorMessage = 'Send timeout, please try again later.';
      } else if (dioError.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Receive timeout, please try again later.';
      } else if (dioError.type == DioErrorType.badResponse) {
        errorMessage = 'Received invalid status code: ${dioError.response?.statusCode}';
      } else if (dioError.type == DioErrorType.cancel) {
        errorMessage = 'Request to server was cancelled.';
      } else {
        errorMessage = 'Unexpected error occurred: ${dioError.message}';
      }
      throw new Exception(errorMessage);
    }
  }

  ///Fetch utilities
  Future<Response> fetchUtilities(
     ) async {
    try {
      Dio _client = Dio();

      return await _client.post(
        BaseURL.Baseurl + "/utilities",

          options: Options(headers: {
            'Authorization': 'Bearer 263|ayC5GBaByhte58rVWUICXUqzdUL3ytcnRepeHHc394f533a6',
          })
      );
    } on DioError catch (dioError) {
      String errorMessage;
      if (dioError.type == DioErrorType.connectionTimeout) {
        errorMessage = 'Connection timeout, please try again later.';
      } else if (dioError.type == DioErrorType.sendTimeout) {
        errorMessage = 'Send timeout, please try again later.';
      } else if (dioError.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Receive timeout, please try again later.';
      } else if (dioError.type == DioErrorType.badResponse) {
        errorMessage = 'Received invalid status code: ${dioError.response?.statusCode}';
      } else if (dioError.type == DioErrorType.cancel) {
        errorMessage = 'Request to server was cancelled.';
      } else {
        errorMessage = 'Unexpected error occurred: ${dioError.message}';
      }
      throw new Exception(errorMessage);
    }
  }

  Future<Response> updateCountry(messageData
     ) async {
    try {
      Dio _client = Dio();

      return await _client.post(

        BaseURL.Baseurl + "/update-country",
          data: messageData,

          options: Options(headers: {
            'Authorization': 'Bearer 263|ayC5GBaByhte58rVWUICXUqzdUL3ytcnRepeHHc394f533a6',
          })
      );
    } on DioError catch (dioError) {
      String errorMessage;
      if (dioError.type == DioErrorType.connectionTimeout) {
        errorMessage = 'Connection timeout, please try again later.';
      } else if (dioError.type == DioErrorType.sendTimeout) {
        errorMessage = 'Send timeout, please try again later.';
      } else if (dioError.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Receive timeout, please try again later.';
      } else if (dioError.type == DioErrorType.badResponse) {
        errorMessage = 'Received invalid status code: ${dioError.response?.statusCode}';
      } else if (dioError.type == DioErrorType.cancel) {
        errorMessage = 'Request to server was cancelled.';
      } else {
        errorMessage = 'Unexpected error occurred: ${dioError.message}';
      }
      throw new Exception(errorMessage);
    }
  }

  ///Fetch profile info
  Future<Response> fetchprofileInfo(
      ) async {
    try {
      Dio _client = Dio();

      return await _client.post(
        BaseURL.Baseurl + "/profile-information",

          options: Options(headers: {
            'Authorization': 'Bearer 263|ayC5GBaByhte58rVWUICXUqzdUL3ytcnRepeHHc394f533a6',
          })
      );
    } on DioError catch (dioError) {
      String errorMessage;
      if (dioError.type == DioErrorType.connectionTimeout) {
        errorMessage = 'Connection timeout, please try again later.';
      } else if (dioError.type == DioErrorType.sendTimeout) {
        errorMessage = 'Send timeout, please try again later.';
      } else if (dioError.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Receive timeout, please try again later.';
      } else if (dioError.type == DioErrorType.badResponse) {
        errorMessage = 'Received invalid status code: ${dioError.response?.statusCode}';
      } else if (dioError.type == DioErrorType.cancel) {
        errorMessage = 'Request to server was cancelled.';
      } else {
        errorMessage = 'Unexpected error occurred: ${dioError.message}';
      }
      throw new Exception(errorMessage);
    }
  }






}