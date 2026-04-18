import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final List<String> imageUrls;

  const ImageSection({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index < imageUrls.length - 1 ? 8 : 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
               child: AspectRatio(
                aspectRatio: 1, 
                child: Image.asset(
                  imageUrls[index],
                  fit: BoxFit.cover, 
                ),
               ),
            ),
          );
        },
      ),
    );
  }
}