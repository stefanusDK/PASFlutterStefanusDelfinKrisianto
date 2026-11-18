class FoodModel {
  final String name;
  final int price;
  final String description;
  final String image;

  const FoodModel({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });
}



const List<FoodModel> dummyFoods = [
  FoodModel(
    name: 'Nasi Goreng Spesial',
    price: 25000,
    description:
        'Nasi goreng bumbu rempah dengan telur mata sapi, ayam suwir, dan kerupuk.',
    image:
        'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500',
  ),
  FoodModel(
    name: 'Ayam Bakar Madu',
    price: 30000,
    description:
        'Ayam bakar olesan madu murni lengkap dengan sambal terasi dan lalapan.',
    image:
        'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500',
  ),
  FoodModel(
    name: 'Sate Ayam Madura',
    price: 28000,
    description:
        '10 tusuk sate ayam daging pilihan dengan siraman bumbu kacang kental.',
    image:
        'https://images.unsplash.com/photo-1529563021893-cc83c992d75d?w=500',
  ),
  FoodModel(
    name: 'Mie Ayam Bakso',
    price: 20000,
    description:
        'Mie kenyal dengan topping ayam kecap, sawi hijau, dan 2 butir bakso sapi.',
    image:
        'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500',
  ),
  FoodModel(
    name: 'Es Teh Manis Jumbo',
    price: 8000,
    description:
        'Minuman teh melati segar dengan gula asli dan es batu kristal.',
    image:
        'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500',
  ),
];
