import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_sliver_list.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: CustomAppBar()),
        const SliverToBoxAdapter(child: FeaturedListView()),
        const SliverPadding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
            top: 51,
          ),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Best Seller",
                  style: Styles.textStyle18,
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          sliver: BestSellerSliverList(),
        )
      ],
    );
  }
}
