import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeBottomSide extends StatelessWidget {
  const HomeBottomSide({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 48),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Best Seller",
                style: Styles.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
