
class TrainerModel {
  int? experienceYears;
  String? image;
  String? name;
  double? rating;
  String? specialty;

  TrainerModel({this.experienceYears, this.image, this.name, this.rating, this.specialty});

  TrainerModel.fromJson(Map<String, dynamic> json) {
    if(json["experienceYears"] is num) {
      experienceYears = (json["experienceYears"] as num).toInt();
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["rating"] is num) {
      rating = (json["rating"] as num).toDouble();
    }
    if(json["specialty"] is String) {
      specialty = json["specialty"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["experienceYears"] = experienceYears;
    data["image"] = image;
    data["name"] = name;
    data["rating"] = rating;
    data["specialty"] = specialty;
    return data;
  }
}