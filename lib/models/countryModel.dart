class CountryModel {
  final int code;
  final String message;
  final List<Country> data;

  CountryModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json['code'],
      message: json['message'],
      data: (json['data'] as List).map((i) => Country.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data.map((country) => country.toJson()).toList(),
    };
  }
}

class Country {
  final int id;
  final String name;
  final String phoneCode;
  final String currencyCode;
  String? imagePath;

  Country({
    required this.id,
    required this.name,
    required this.phoneCode,
    required this.currencyCode,
    this.imagePath
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      phoneCode: json['phone_code'],
      currencyCode: json['currency_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone_code': phoneCode,
      'currency_code': currencyCode,
    };
  }
}
