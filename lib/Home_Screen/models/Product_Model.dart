class ProductModel
{
  late String name;
  late String image;
  late String mass;
  late String uId;
  late double rating;

  ProductModel({
    required this.name,
    required this.image,
    required this.mass,
    required this.rating,
  });

  ProductModel.fromJson(Map<String,dynamic> json)
  {
    name = json['name'];
    image = json['image'];
    mass = json['mass'];
    uId = json['uId'];
    rating = json['rating'];
  }

  Map<dynamic,dynamic> toMap()
  {
    return
      {
        image : 'image',
        name : 'name',
        mass : 'mass',
        uId : 'uId',
        rating : 'rating',
      };
  }
}
