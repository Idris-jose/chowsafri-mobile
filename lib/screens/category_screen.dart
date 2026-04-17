import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';
import '../widgets/navigation/custom_nav_bar.dart';
import 'food_details_screen.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // 🔍 Filter items based on category
    final filteredItems = foodItems
        .where((item) => item.categoryId == category.id)
        .toList();

    return Scaffold(
      appBar: const CustomNavBar(),
      backgroundColor: const Color(0xFFEBEBEB),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // 👇 Category name at the top, left-aligned
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              category.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),

          // 👇 The list of cards
          ...filteredItems.map((item) {
            return GestureDetector(
              onTap: () {
               showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return DraggableScrollableSheet(
                      initialChildSize: 0.85,
                      minChildSize: 0.5,
                      maxChildSize: 0.85,
                      expand: false,
                      builder: (context, scrollController) {
                        return SingleChildScrollView(
                          controller: scrollController,
                          child: FoodDetailScreen(item: item),
                        );
                      },
                    );
                  },
                );
              },
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item.image,
                              fit: BoxFit.cover,
                              errorBuilder: (ctx, err, stack) =>
                                  const SizedBox(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.visibility,
                          color: Color(0xFF92AD1A),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    color: const Color(0xFFF9FFDC),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.image_outlined,
                          color: Color(0xFF92AD1A),
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "See what this looks like when served",
                          style: TextStyle(
                            color: Color(0xFF92AD1A),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            );
          }).toList(),
        ],
      ),
    );
  }
}