import 'dart:convert';

PostResponse postResponseFromJson(String str) => PostResponse.fromJson(
      json.decode(str),
    );

String postResponseToJson(PostResponse data) => json.encode(
      data.toJson(),
    );

class PostResponse {
  PostResponse({
    required this.name,
    required this.jobTitle,
    this.id,
    this.createdAt,
  });

  String name;
  String jobTitle;
  String? id;
  DateTime? createdAt;

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        name: json["name"],
        jobTitle: json["jobTitle"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "jobTitle": jobTitle,
        "id": id,
        "createdAt": createdAt != null ? createdAt!.toIso8601String() : null,
      };
}
