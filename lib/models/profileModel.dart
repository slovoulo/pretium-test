class ProfileResponse {
  final int code;
  final String message;
  final ProfileData data;

  ProfileResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      code: json['code'],
      message: json['message'],
      data: ProfileData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class ProfileData {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String mobile;
  final String dob;
  final String idNo;
  final String? avatar;
  final Country country;

  ProfileData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.mobile,
    required this.dob,
    required this.idNo,
    this.avatar,
    required this.country,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      gender: json['gender'],
      mobile: json['mobile'],
      dob: json['dob'],
      idNo: json['id_no'],
      avatar: json['avatar'],
      country: Country.fromJson(json['country']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'gender': gender,
      'mobile': mobile,
      'dob': dob,
      'id_no': idNo,
      'avatar': avatar,
      'country': country.toJson(),
    };
  }
}

class Country {
  final int id;
  final String name;
  final String phoneCode;
  final String currencyCode;

  Country({
    required this.id,
    required this.name,
    required this.phoneCode,
    required this.currencyCode,
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
