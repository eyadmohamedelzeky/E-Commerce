class LoginResponseModel {
  final String? message;
  final String? token;
  final String? name;
  final int? statusCode;
  final bool? status;

  LoginResponseModel({
    this.message,
    this.token,
    this.name,
    this.statusCode,
    this.status,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
      name: json['name'] as String?,
      statusCode: json['statusCode'] as int?,
      status: json['status'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
      'name': name,
      'statusCode': statusCode,
      'status': status,
    };
  }

  LoginResponseModel copyWith({
    String? message,
    String? token,
    String? name,
    int? statusCode,
    bool? status,
  }) {
    return LoginResponseModel(
      message: message ?? this.message,
      token: token ?? this.token,
      name: name ?? this.name,
      statusCode: statusCode ?? this.statusCode,
      status: status ?? this.status,
    );
  }
}
