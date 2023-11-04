import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:talklytic/API/myException.dart';

class ApiHelper {
  Future<dynamic> getApiData(
      {required String url}) async {
    try {
      var res = await http.get(Uri.parse(url),

      );
              print('res:-$res');
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

       print('res:-$res');
      return jsonDecode(mData);
    case 400:
      throw BadRequestException(body: res.body.toString());
    case 401:
    case 403:
    case 407:
      throw UnAuthrisedException(body: res.body.toString());
    case 500:
      throw FetchDataException(body: "Error while communicating to server");
  }
}
