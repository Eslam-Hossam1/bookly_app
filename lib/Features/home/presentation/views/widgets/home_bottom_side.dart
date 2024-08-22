import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeBottomSide extends StatelessWidget {
  const HomeBottomSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 24),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Best Seller",
                style: Styles.titleMedium,
              ),
            ],
          ),
          SizedBox(
            height: 105,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 70 / 110,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AssetsData.testImage))),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
