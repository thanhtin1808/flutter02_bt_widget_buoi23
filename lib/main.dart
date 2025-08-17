import 'package:flutter/material.dart';
import 'package:flutter_bt_buoi23/cart_section.dart';
import 'package:flutter_bt_buoi23/product_catalog_section.dart';
import 'product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoe Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ShoeStorePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShoeStorePage extends StatefulWidget {
  const ShoeStorePage({super.key});

  @override
  State<ShoeStorePage> createState() => _ShoeStorePageState();
}

class _ShoeStorePageState extends State<ShoeStorePage> {
  List<CartItem> cartItems = [
    CartItem(
      name: 'Nike Air Max',
      price: 120.0,
      quantity: 1,
      image: 'assets/images/nike_air_max.png',
    ),
    CartItem(
      name: 'Adidas Ultraboost',
      price: 150.0,
      quantity: 1,
      image: 'assets/images/addidas_ulttra.png',
    ),
    CartItem(
      name: 'Nike Air Max 2',
      price: 120.0,
      quantity: 1,
      image: 'assets/images/nike_air_max2.png',
    ),
    CartItem(
      name: 'Nike Air Max 4',
      price: 120.0,
      quantity: 10,
      image: 'assets/images/nike_air_max_4.png',
    ),
  ];

  List<Product> products = [
    Product(
      name: 'Nike Air Max',
      price: 120.0,
      image: 'assets/images/nike_air_max.png',
    ),
    Product(
      name: 'Adidas Ultraboost',
      price: 150.0,
      image: 'assets/images/addidas_ulttra.png',
    ),
    Product(
      name: 'Nike Air Max 2',
      price: 120.0,
      image: 'assets/images/nike_air_max2.png',
    ),
  ];

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void removeFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void addToCart(Product product) {
    setState(() {
      // Check if item already exists in cart
      int existingIndex = cartItems.indexWhere(
        (item) => item.name == product.name,
      );
      if (existingIndex != -1) {
        cartItems[existingIndex].quantity++;
      } else {
        cartItems.add(
          CartItem(
            name: product.name,
            price: product.price,
            quantity: 1,
            image: product.image,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Shoe Store',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.blue[400],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cart Section
            CartSection(
              cartItems: cartItems,
              totalPrice: totalPrice,
              removeFromCart: removeFromCart,
            ),
            const SizedBox(height: 5),
            // Product Catalog Section
            ProductCatalogSection(products: products, addToCart: addToCart),
          ],
        ),
      ),
    );
  }
}
