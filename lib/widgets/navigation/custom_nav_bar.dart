import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBack;

  const CustomNavBar({
    super.key,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFEBEBEB),
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 70,

      leading: showBack
          ? Center(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 2.0),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          : null,

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Image.asset(
            'assets/logo/logo.png',
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}