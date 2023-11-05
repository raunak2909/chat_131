// ignore_for_file: file_names, camel_case_types, constant_identifier_names

import 'package:talklytic/API/Giphy_API_Key.dart';

class Gif_api_url {
  static const BASE_URL = 'https://api.giphy.com/v1/gifs/';
  static const trending_url = '${BASE_URL}trending?api_key=${Gif_api_key.KEY}';
  static const search_url = '${BASE_URL}search?api_key=${Gif_api_key.KEY}';
}
