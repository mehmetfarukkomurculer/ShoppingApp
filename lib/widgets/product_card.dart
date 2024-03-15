import 'package:flutter/material.dart';
import 'package:shopping_app/models/shoe_model.dart';
import 'package:shopping_app/screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  final Shoe product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              product: product,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    height: 50,
                    width: 50,
                    product.brandImgUrl,
                  ),
                ),
                Expanded(
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      color: Colors.deepPurple,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Image.network(
                product.productImgUrls.first,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "\$ ${product.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
