import 'package:flutter/material.dart';
import 'package:product_useing_api/controllers/product_controller.dart';
import 'package:product_useing_api/models/product_model.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final ProductModel product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.product.image,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
              const SizedBox(height: 16),
              Text(
                widget.product.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              // Price
              Card(
                child: ListTile(
                  leading: const Icon(Icons.price_change),
                  title: const Text(
                    'Price',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  subtitle: Text(
                    '\$${widget.product.price}',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Category
              Card(
                child: ListTile(
                  leading: const Icon(Icons.category),
                  title: const Text(
                    'Category',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  subtitle: Text(
                    widget.product.category,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Description
              Card(
                child: ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text(
                    'Description',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  subtitle: Text(
                    widget.product.description,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Rating
              Card(
                child: ListTile(
                  leading: const Icon(Icons.star),
                  title: const Text(
                    'Rating',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  subtitle: Text(
                    '${widget.product.rating.rate}',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
              // Count
              Card(
                child: ListTile(
                  leading: const Icon(Icons.numbers),
                  title: const Text(
                    'Count',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  subtitle: Text(
                    '${widget.product.rating.count}',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Consumer<ProductController>(
                builder: (context, productController, child) {
                  final product = widget.product;
                  final bool isAdded = product.isAdded;
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ElevatedButton(
                      onPressed: () {
                        if (isAdded) {
                          productController.removeProduct(product);
                        } else {
                          productController.addProduct(product);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isAdded ? Colors.red : Colors.green,
                      ),
                      child: Text(isAdded ? 'Remove from Cart' : 'Add to Cart'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
