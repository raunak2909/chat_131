// ignore_for_file: non_constant_identifier_names

class User {
  String avatar_url;
  String banner_image;
  String banner_url;
  String description;
  String display_name;
  String instagram_url;
  String profile_url;
  String username;
  String website_url;
  bool is_verified;
  
  User(
      {required this.avatar_url,
      required this.banner_image,
      required this.banner_url,
      required this.description,
      required this.display_name,
      required this.instagram_url,
      required this.profile_url,
      required this.username,
      required this.website_url,
      required this.is_verified});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        avatar_url: json['avatar_url'],
        banner_image: json['banner_image'],
        banner_url: json['banner_url'],
        description: json['description'],
        display_name: json['display_name'],
        instagram_url: json['instagram_url'],
        profile_url: json['profile_url'],
        username: json['username'],
        website_url: json['website_url'],
        is_verified: json['is_verified']);
  }
}
