class NetworkApp {
  final int id;
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  NetworkApp({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });
  factory NetworkApp.fromMap(Map<String, dynamic> map) {
    return NetworkApp(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      coverUrl: map['coverUrl'] as String,
    );
  }
  static fromJson(p) {}
}
