class ProductModel
{
  late String name;
  late String image;
  late String mass;
  late String uId;
  late double rating;
  late String describe;
  late String type;

  ProductModel({
    required this.name,
    required this.image,
    required this.mass,
    required this.rating,
    required this.describe,
    required this.type,
  });

  ProductModel.fromJson(Map<String,dynamic> json)
  {
    name = json['name'];
    image = json['image'];
    mass = json['mass'];
    uId = json['uId'];
    rating = json['rating'];
    type = json['type'];
    describe = json['zdescribe'];
  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'image' : image,
        'name' : name,
        'mass' : mass,
        'uId' : uId,
        'rating' : rating,
        'type' : type,
        'zdescribe' : describe,
      };
  }
}
