class LevelModel {
  int? id;
  String? name;
  int? type;

  LevelModel({
    this.id,
    this.name,
    this.type,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
      };
}
