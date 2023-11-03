// ignore_for_file: camel_case_types, non_constant_identifier_names

class Analytics {
  Onload onload;
  Onclick onclick;
  Onsent onsent;
  Analytics(
      {required this.onload, required this.onclick, required this.onsent});
  factory Analytics.fromJson(Map<String, dynamic> json) {
    return Analytics(
      onload: Onload.fromJson(json['onload']),
      onclick: Onclick.fromJson(json['onclick']),
      onsent: Onsent.fromJson(json['onsent']),
    );
  }
}

class Onload {
  String url;
  Onload({required this.url});
  factory Onload.fromJson(Map<String, dynamic> json) {
    return Onload(url: json['url']);
  }
}

class Onclick {
  String url;
  Onclick({required this.url});
  factory Onclick.fromJson(Map<String, dynamic> json) {
    return Onclick(url: json['url']);
  }
}

class Onsent {
  String url;
  Onsent({required this.url});
  factory Onsent.fromJson(Map<String, dynamic> json) {
    return Onsent(url: json['url']);
  }
}

class Pagination {
  int count;
  int offset;
  int total_count;
  Pagination(
      {required this.count, required this.offset, required this.total_count});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      count: json['count'],
      offset: json['offset'],
      total_count: json['total_count'],
    );
  }
}

class Meta {
  String msg;
  String response_id;
  int status;

  Meta({required this.msg, required this.response_id, required this.status});
  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      msg: json['msg'],
      response_id: json['response_id'],
      status: json['status'],
    );
  }
}
