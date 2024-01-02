class UserModel {
  final String name;
  final String cedula;
  final String country;
  final String city;
  final String phoneNumber;
  final String email;
  final String password;

  const UserModel(this.cedula, this.name, this.email, this.city, this.country,
      this.phoneNumber, this.password);

  toJSON() {
    return {
      "id": cedula,
      "fullName": name,
      "email": email,
      "password": password,
      "phoneNo": phoneNumber,
      "city": city,
      "country": country,
    };
  }
}
