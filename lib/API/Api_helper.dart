// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:talklytic/API/myException.dart';

class ApiHelper {
  Future<dynamic> getApiData({required String url}) async {
    try {
      var res = await http.get(
        Uri.parse(url),
      );
      return returnDataResponse(res);
    } on SocketException {
      throw FetchDataException(body: "Internet Error");
    }
  }
}

dynamic returnDataResponse(http.Response res) {
  switch (res.statusCode) {
    case 200:
      var mData = res.body;
      return jsonDecode(mData);
    case 400:
      throw BadRequestException(body: res.body.toString());
    case 401:
    case 403:
      throw UnAuthrisedException(body: res.body.toString());
    case 404:
      throw UnAuthrisedException(
          body:
              "The particular GIF or Sticker you are requesting was not found. This occurs, for example, if you request a GIF by using an id that does not exist.");
    case 407:
      throw UnAuthrisedException(body: res.body.toString());
    case 414:
      throw FetchDataException(
          body: "The length of the search query exceeds 50 characters.");
    case 500:
      throw FetchDataException(body: "Error while communicating to server");
    default:
      throw FetchDataException(body: "Unknown error:- ${res.body}");
  }
}
