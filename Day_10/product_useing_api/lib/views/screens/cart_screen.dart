import 'package:flutter/material.dart';
import 'package:product_useing_api/controllers/product_controller.dart';
import 'package:product_useing_api/models/product_model.dart';
import 'package:product_useing_api/views/widgets/list_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductController>(context);
    final List<ProductModel> items = controller.products.where((p) => p.isAdded).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: items.isEmpty
          ? const Center(child: Text('No items in the cart'))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final product = items[index];
                return ListWidget(product: product);
              },
            ),
    );
  }
}