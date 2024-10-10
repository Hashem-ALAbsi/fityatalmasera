// import 'dart:ffi';

class SongApi {
  int? id;
  String? name;
  String? description;
  String? songUrl;

  SongApi.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    description = json['description'] ?? "";
    songUrl = json['songUrl'] ?? "";
  }
}

class CheckVersionApi {
  int? id;
  String? submassage;
  String? massage;
  bool? IsAuthenticated;

  CheckVersionApi.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    submassage = json['submassage'] ?? "";
    massage = json['massage'] ?? "";
    IsAuthenticated = json['IsAuthenticated'] ?? false;
  }
}
