import 'package:flutter/foundation.dart';

import '../models/shoe_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<Shoe> _products = [
    Shoe(
      id: '0',
      title: 'Nike Dunk Low Retro',
      brand: 'Nike',
      brandImgUrl:
          'https://cdn.iconscout.com/icon/free/png-256/free-nike-3-202655.png',
      price: 44.52,
      sizes: [
        'EU 39',
        'EU 40',
        'EU 40.5',
        'EU 41',
        'EU 42',
        'EU 42.5',
        'EU 43',
        'EU 44'
      ],
      productImgUrls: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b1bcbca4-e853-4df7-b329-5be3c61ee057/dunk-low-retro-ayakkab%C4%B1s%C4%B1-mhrtZC.png'
      ],
    ),
    Shoe(
      id: '1',
      title: 'Nike Air Monarch IV',
      brand: 'Nike',
      brandImgUrl:
          'https://cdn.iconscout.com/icon/free/png-256/free-nike-3-202655.png',
      price: 49.99,
      sizes: [
        'EU 40',
        'EU 44',
        'EU 44.5',
        'EU 45',
        'EU 46',
        'EU 47',
        'EU 47.5',
        'EU 48.5',
        'EU 49.5',
      ],
      productImgUrls: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/f9a8deaa-87f2-4191-92b8-c7661aae48de/air-monarch-4-antrenman-ayakkab%C4%B1s%C4%B1-VrTWXJJn.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/2013aa36-3cf6-46a0-ad9a-cd5ff7927a11/air-monarch-4-antrenman-ayakkab%C4%B1s%C4%B1-VrTWXJJn.png'
      ],
    ),
    Shoe(
      id: '2',
      title: 'Superstar',
      brand: 'Adidas',
      brandImgUrl:
          'https://static.vecteezy.com/system/resources/previews/019/136/412/non_2x/adidas-logo-adidas-icon-free-free-vector.jpg',
      price: 40.25,
      sizes: [
        '36 2/3',
        '37 1/3',
        '38',
        '38 2/3',
        '39 1/3',
        '40',
        '40 2/3',
        '41 1/3',
        '42',
        '42 2/3',
        '43 1/3',
        '44',
        '44 2/3',
        '45 1/3',
        '46',
        '46 2/3',
        '47 1/3',
      ],
      productImgUrls: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7ed0855435194229a525aad6009a0497_9366/Superstar_Ayakkabi_Beyaz_EG4958_01_standard.jpg',
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8a358bcd5e3d453da815aad6009a249e_9366/Superstar_Ayakkabi_Beyaz_EG4958_02_standard_hover.jpg'
      ],
    ),
    Shoe(
      id: '3',
      title: 'COURT STAR SL',
      brand: 'Puma',
      brandImgUrl:
          'https://cdn.iconscout.com/icon/free/png-512/free-puma-202674.png?f=webp&w=256',
      price: 65.00,
      sizes: ['45'],
      productImgUrls: [
        'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa/global/384676/04/sv01/fnd/TUR/w/1000/h/1000/fmt/png'
      ],
    ),
    Shoe(
      id: '4',
      title: 'FUSE 2.0',
      brand: 'Puma',
      brandImgUrl:
          'https://cdn.iconscout.com/icon/free/png-512/free-puma-202674.png?f=webp&w=256',
      price: 54.25,
      sizes: ['40', '44'],
      productImgUrls: [
        'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa/global/376151/22/sv01/fnd/TUR/w/560/h/560/fmt/png'
      ],
    ),
    Shoe(
      id: '5',
      title: 'TEVERIS BASE NITRO',
      brand: 'Puma',
      brandImgUrl:
          'https://cdn.iconscout.com/icon/free/png-512/free-puma-202674.png?f=webp&w=256',
      price: 48.55,
      sizes: ['36', '37'],
      productImgUrls: [
        'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa/global/388911/02/sv01/fnd/TUR/w/1000/h/1000/fmt/png'
      ],
    ),
    Shoe(
      id: '6',
      title: 'VOYAGE NITRO 2',
      brand: 'Puma',
      brandImgUrl:
          'https://cdn.iconscout.com/icon/free/png-512/free-puma-202674.png?f=webp&w=256',
      price: 74.99,
      sizes: ['41', '42', '44', '45'],
      productImgUrls: [
        'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa/global/376919/08/sv01/fnd/TUR/w/1000/h/1000/fmt/png'
      ],
    ),
  ];

  List<Shoe> get products => _products;

  final List<Shoe> _cart = [];

  List<Shoe> get cart => _cart;

  void addProduct(Shoe product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeProduct(Shoe product) {
    _cart.remove(product);
    notifyListeners();
  }
}
