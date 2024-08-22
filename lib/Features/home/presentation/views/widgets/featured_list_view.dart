import 'package:bookly_app/Features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.276,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const FeaturedListViewItem();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 8,
            );
          },
          itemCount: 20),
    );
  }
}
