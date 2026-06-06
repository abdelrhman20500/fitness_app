
class PlansModel {
  String? description;
  int? durationWeeks;
  int? id;
  String? image;
  String? level;
  String? name;
  List<Steps>? steps;

  PlansModel({this.description, this.durationWeeks, this.id, this.image, this.level, this.name, this.steps});

  PlansModel.fromJson(Map<String, dynamic> json) {
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["durationWeeks"] is num) {
      durationWeeks = (json["durationWeeks"] as num).toInt();
    }
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["level"] is String) {
      level = json["level"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["steps"] is List) {
      steps = json["steps"] == null ? null : (json["steps"] as List).map((e) => Steps.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["description"] = description;
    data["durationWeeks"] = durationWeeks;
    data["id"] = id;
    data["image"] = image;
    data["level"] = level;
    data["name"] = name;
    if(steps != null) {
      data["steps"] = steps?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Steps {
  int? day;
  int? duration;
  String? reps;
  int? week;
  String? workoutName;

  Steps({this.day, this.duration, this.reps, this.week, this.workoutName});

  Steps.fromJson(Map<String, dynamic> json) {
    if(json["day"] is num) {
      day = (json["day"] as num).toInt();
    }
    if(json["duration"] is num) {
      duration = (json["duration"] as num).toInt();
    }
    if(json["reps"] is String) {
      reps = json["reps"];
    }
    if(json["week"] is num) {
      week = (json["week"] as num).toInt();
    }
    if(json["workoutName"] is String) {
      workoutName = json["workoutName"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["day"] = day;
    data["duration"] = duration;
    data["reps"] = reps;
    data["week"] = week;
    data["workoutName"] = workoutName;
    return data;
  }
}