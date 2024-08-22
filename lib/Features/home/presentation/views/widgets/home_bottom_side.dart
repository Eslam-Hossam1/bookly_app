import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeBottomSide extends StatelessWidget {
  const HomeBottomSide({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
        top: 51,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Best Seller",
                style: Styles.textStyle18,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const BestSellerItem()
        ],
      ),
    );
  }
}
