class RegisterModel
{
  late String name;
  late String email;
  late String uId;
  late String phone;
  late String image;

  RegisterModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.phone,
    required this.image,

  });

  RegisterModel.fromJson(Map<String,dynamic>? json)
  {
    name = json!['name'] ?? ' ';
    uId = json['uId'] ?? ' ';
    email = json['email'] ?? ' ';
    phone = json['phone'] ?? ' ';
    image = json['image'] ?? ' ';
  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'name' : name,
        'email' : email,
        'uId' : uId,
        'phone' : phone,
        'image' : image,
      };
  }

}