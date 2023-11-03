// ignore_for_file: non_constant_identifier_names

import 'package:talklytic/Data/GIPHY/Trending_Modal/imageModal.dart';
import 'package:talklytic/Data/GIPHY/Trending_Modal/pagination.dart';

import 'UserModal.dart';

class MainDataModal {
  List<GifData> data;
  Pagination pagination;
  Meta meta;
  MainDataModal(
      {required this.data, required this.pagination, required this.meta});
  factory MainDataModal.fromJson(Map<String, dynamic> json) {
    List<GifData> mUser = [];
    for (Map<String, dynamic> eachUser in json['data']) {
      mUser.add(GifData.fromJson(eachUser));
    }
    return MainDataModal(
      data: mUser,
      pagination: json['pagination'],
      meta: json['meta'],
    );
  }
}

class GifData {
  String type;
  String id;
  String url;
  String slug;
  String bitly_gif_url;
  String bitly_url;
  String embed_url;
  String username;
  String title;
  String source;
  String rating;
  String content_url;
  String source_tld;
  String source_post_url;
  String import_datetime;
  String trending_datetime;
  String analytics_response_payload;
  bool is_sticker;
  Image images;
  User user;
  Analytics analytics;
  GifData({
    required this.analytics,
    required this.analytics_response_payload,
    required this.bitly_gif_url,
    required this.bitly_url,
    required this.content_url,
    required this.embed_url,
    required this.id,
    required this.images,
    required this.import_datetime,
    required this.is_sticker,
    required this.rating,
    required this.slug,
    required this.source,
    required this.source_post_url,
    required this.source_tld,
    required this.title,
    required this.trending_datetime,
    required this.type,
    required this.url,
    required this.user,
    required this.username,
  });
  factory GifData.fromJson(Map<String, dynamic> json) {
    return GifData(
      analytics_response_payload: json['analytics_response_payload'],
      bitly_gif_url: json['bitly_gif_url'],
      bitly_url: json['bitly_url'],
      content_url: json['content_url'],
      embed_url: json['embed_url'],
      id: json['id'],
      import_datetime: json['import_datetime'],
      is_sticker: json['is_sticker'],
      rating: json['rating'],
      slug: json['slug'],
      source: json['source'],
      source_post_url: json['source_post_url'],
      source_tld: json['source_tld'],
      title: json['title'],
      trending_datetime: json['trending_datetime'],
      type: json['type'],
      url: json['url'],
      username: json['username'],
      analytics: Analytics.fromJson(json['analytics']),
      images: Image.fromJson(json['images']),
      user: User.fromJson(json['user']),
    );
  }
}
