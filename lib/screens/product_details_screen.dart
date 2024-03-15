import 'dart:math';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/shoe_model.dart';
import 'package:shopping_app/provider/product_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Shoe product;
  const ProductDetailsScreen({super.key, required this.product});
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late String selectedSize;

  late AnimationController animationController;
  bool isAdded = false;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.product.sizes.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.title.toUpperCase(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: widget.product.productImgUrls.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 300,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(
                              widget.product.productImgUrls[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    widget.product.productImgUrls.length > 1
                        ? DotsIndicator(
                            dotsCount: widget.product.productImgUrls.length,
                            position: double.parse(index.toString()),
                            decorator: const DotsDecorator(
                              color: Colors.white,
                              activeColor: Colors.deepPurple,
                            ),
                          )
                        : Container(),
                  ],
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$ ${widget.product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.product.sizes.length,
                    itemBuilder: (context, index) {
                      final size = widget.product.sizes[index];
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            backgroundColor: selectedSize == size
                                ? Colors.grey
                                : Colors.black12,
                            label: Text(size),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Random random = Random();
                    List<String> selectedSizes = [];
                    selectedSizes.add(selectedSize);
                    final shoe = Shoe(
                      id: random.nextInt(10000).toString(),
                      title: widget.product.title,
                      brand: widget.product.brand,
                      brandImgUrl: widget.product.brandImgUrl,
                      price: widget.product.price,
                      sizes: selectedSizes,
                      productImgUrls: widget.product.productImgUrls,
                    );
                    Provider.of<ProductProvider>(context, listen: false)
                        .addProduct(shoe);
                    setState(() {
                      isAdded = true;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: isAdded ? 300 : 150,
                    height: 60,
                    decoration: BoxDecoration(
                      color: isAdded ? Colors.green : Colors.deepPurple,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isAdded ? Icons.check : Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        Text(isAdded ? 'Successfully added' : 'Add to Cart'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
