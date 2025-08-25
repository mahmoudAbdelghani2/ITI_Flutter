import 'package:flutter/material.dart';
import 'package:product_useing_api/controllers/product_controller.dart';
import 'package:product_useing_api/models/product_model.dart';
import 'package:product_useing_api/views/screens/details_screen.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatefulWidget {
  final ProductModel product;
  const ListWidget({super.key, required this.product});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsScreen(product: widget.product),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        elevation: 5,
        color: const Color.fromARGB(255, 104, 182, 246),
        child: ListTile(
          leading: Image.network(
            widget.product.image,
            height: 60,
            width: 60,
          ),
          title: Text(
            widget.product.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text(
            '\$${widget.product.price}',
            style: TextStyle(fontSize: 15),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm Deletion'),
                    content: Text(
                      'Are you sure you want to delete this product?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Provider.of<ProductController>(
                            context,
                            listen: false,
                          ).removeProduct(widget.product);
                          Navigator.of(context).pop();
                        },
                        child: Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
