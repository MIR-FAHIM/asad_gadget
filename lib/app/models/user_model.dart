class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? token;
  final String? userType;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.token,
    this.userType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userData = json['user'] is Map<String, dynamic> ? json['user'] : json;
    return UserModel(
      id: userData['id'] is int
          ? userData['id']
          : int.tryParse(userData['id']?.toString() ?? '0'),
      name: userData['name']?.toString(),
      email: userData['email']?.toString(),
      phone: userData['phone']?.toString(),
      token: json['token']?.toString() ?? userData['token']?.toString(),
      userType: userData['user_type']?.toString() ?? 'customer',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'token': token,
      'user_type': userType,
    };
  }
}
