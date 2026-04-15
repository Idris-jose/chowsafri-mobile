import 'package:chowsafari_mobile/models/food_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/custom_toast.dart';
import '../widgets/food_image_carousel.dart';

class FoodDetailScreen extends StatefulWidget {
  final FoodItem item;
  const FoodDetailScreen({super.key, required this.item});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int quantity = 1;
  int takeout = 0;

  int get takeoutTotal {
    return (widget.item.takeoutPrice * takeout).toInt();
  }

  int get totalPrice {
    final foodTotal = widget.item.price * quantity;
    final takeoutTotal = widget.item.takeoutPrice * takeout;
    return foodTotal.toInt() + takeoutTotal.toInt();
  }

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: Container(
          width: double.infinity,
          color: Colors.white, // cleaner than BoxDecoration here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FoodImageCarousel(images: widget.item.images, height: 300),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Title and price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.item.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "₦${widget.item.price}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 👈 LEFT SIDE (ICON + TEXT AS ONE UNIT)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFFF9FFDC),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: Color(0xFF92AD1A),
                                size: 20,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                widget.item.time,
                                style: const TextStyle(
                                  color: Color(0xFF92AD1A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // 👉 RIGHT SIDE (QUANTITY)
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFEAFFE9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                  color: Color(0xFF448A10),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (quantity > 1) quantity--;
                                  });
                                },
                              ),
                              Text(
                                quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF448A10),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  color: Color(0xFF448A10),
                                ),
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // 🔹 Quantity selector
                    const SizedBox(height: 16),
                    // 🔹 Description
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.item.description,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight(500),
                            color: Color(0xFFF7C7C7C),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Takeout",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF12190B),
                      ),
                    ),
                    Text(
                      "${takeout.toString()} take out added ~ ${takeout > 0 ? '₦${takeoutTotal.toStringAsFixed(2)}' : 'free'}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight(500),
                        color: Color(0xFF7C7C7C),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFEBEBEB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Color(0xFF12190B),
                            ),
                            onPressed: () {
                              setState(() {
                                if (takeout > 1) takeout--;
                              });
                            },
                          ),
                          Text(
                            takeout.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF12190B),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Color(0xFF12190B),
                            ),
                            onPressed: () {
                              setState(() {
                                takeout++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "₦${totalPrice.toString()}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                top: false,
                minimum: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF448A10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      CustomToast.show(
                        context,
                        message: 'Added to menu',
                      );
                    },
                    child: const Text(
                      "Add to order list",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
