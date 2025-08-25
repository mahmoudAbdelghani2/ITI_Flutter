import 'package:flutter/material.dart';
import 'package:product_useing_api/models/product_model.dart';
import 'package:product_useing_api/views/screens/details_screen.dart';

class GridWidget extends StatefulWidget {
  final ProductModel product;
  const GridWidget({super.key, required this.product});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
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
        margin: const EdgeInsets.all(8.0),
        elevation: 5,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.product.image,
                
                height: 150,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.product.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '\$${widget.product.price}',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
