class UtilityModel {
  final int code;
  final String message;
  final List<UtilityData> data;

  UtilityModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory UtilityModel.fromJson(Map<String, dynamic> json) {
    return UtilityModel(
      code: json['code'],
      message: json['message'],
      data: (json['data'] as List)
          .map((utilityJson) => UtilityData.fromJson(utilityJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data.map((utility) => utility.toJson()).toList(),
    };
  }
}

class UtilityData {
  final int id;
  final String code;
  final String name;
  final String category;
  final String lowLimit;
  final String highLimit;
  final String icon;
  final Utility utility;

  UtilityData({
    required this.id,
    required this.code,
    required this.name,
    required this.category,
    required this.lowLimit,
    required this.highLimit,
    required this.icon,
    required this.utility,
  });

  factory UtilityData.fromJson(Map<String, dynamic> json) {
    return UtilityData(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      category: json['category'],
      lowLimit: json['low_limit'],
      highLimit: json['high_limit'],
      icon: json['icon'],
      utility: Utility.fromJson(json['utility']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'category': category,
      'low_limit': lowLimit,
      'high_limit': highLimit,
      'icon': icon,
      'utility': utility.toJson(),
    };
  }
}

class Utility {
  final int id;
  final String name;
  final DateTime createdAt;

  Utility({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Utility.fromJson(Map<String, dynamic> json) {
    return Utility(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
