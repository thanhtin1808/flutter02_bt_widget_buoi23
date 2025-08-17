import 'package:flutter/material.dart';

// Pass cartItems, totalPrice, and removeFromCart from parent
class CartSection extends StatelessWidget {
  final List cartItems;
  final double totalPrice;
  final Function(int) removeFromCart;

  const CartSection({
    super.key,
    required this.cartItems,
    required this.totalPrice,
    required this.removeFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Giỏ hàng',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Product Image
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: item.image != null && item.image.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item.image,
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            )
                          : const Icon(
                              Icons.shopping_bag,
                              color: Colors.grey,
                            ),
                    ),
                    const SizedBox(width: 12),
                    // Product Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Giá: ${item.price.toStringAsFixed(1)} \$',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Quantity
                    Text(
                      'Số lượng: ${item.quantity}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Delete Button
                    GestureDetector(
                      onTap: () => removeFromCart(index),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          Icons.delete,
                          color: Colors.red[400],
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          // Total Price
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tổng tiền:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '${totalPrice.toStringAsFixed(2)} \$',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[500],
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