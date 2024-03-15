import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/product_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late List<Animation<Offset>> animations = [];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, _) {
          final cart = productProvider.cart;
          animations = List.generate(
            cart.length,
            (index) =>
                Tween(begin: const Offset(-1, 0), end: Offset.zero).animate(
              CurvedAnimation(
                parent: controller,
                curve: Interval(index * (1 / cart.length), 1),
              ),
            ),
          );
          controller.forward();
          return cart.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    final cartItem = cart[index];
                    return Column(
                      children: [
                        SlideTransition(
                          position: animations[index],
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(cartItem.productImgUrls.first),
                            ),
                            title: Text(cartItem.title),
                            subtitle: Text('Size: ${cartItem.sizes.first}'),
                            trailing: IconButton(
                              onPressed: () {
                                productProvider.removeProduct(cartItem);
                              },
                              icon: const Icon(
                                Icons.delete,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                  itemCount: cart.length,
                )
              : const Center(
                  child: Text(
                    'You do not have any product in your cart.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                );
        },
      ),
    );
  }
}
