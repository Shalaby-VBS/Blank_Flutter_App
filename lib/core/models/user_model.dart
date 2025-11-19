class UserModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? gender;
  final String? dateOfBirth;
  final String? profileImage;
  final bool? isActive;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.gender,
    this.dateOfBirth,
    this.profileImage,
    this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      profileImage: json['profile_image'] as String?,
      isActive: json['is_active'] as bool?,
    );
  }
}
