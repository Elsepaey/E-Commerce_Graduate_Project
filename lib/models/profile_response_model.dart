class ProfileResponseModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? date;
  final String? gender;
  final String? phone;
  final String? userName;
  final String? image;

  ProfileResponseModel({
    this.firstName,
    this.lastName,
    this.email,
    this.date,
    this.gender,
    this.phone,
    this.userName,
    this.image,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      date: json['date_of_birth'],
      gender: json['gender'],
      phone: json['phone_number'],
      userName: json['username'],
      image: json['image'],
    );
  }

  ProfileResponseModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? date,
    String? gender,
    String? phone,
    String? userName,
    String? image,
  }) {
    return ProfileResponseModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.lastName,
      date: date ?? this.date,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      userName: userName ?? this.userName,
      image: image ?? this.image,
    );
  }



//   {
//     "first_name": "nadia2",
//     "last_name": "Doe",
//     "email": "nadia@gmail2.com",
//     "date_of_birth": "1990-01-01",
//     "gender": "M",
//     "phone_number": "01236587213",
//     "username": "nadia2",
//     "image": "https://mohamednowar.pythonanywhere.com/media/profile_images/default.jpg"
// }
}
