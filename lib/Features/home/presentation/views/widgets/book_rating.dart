import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.averageRating,
    required this.ratingCounts,
  });
  final MainAxisAlignment mainAxisAlignment;
  final num averageRating;
  final int ratingCounts;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          "$averageRating",
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          "($ratingCounts)",
          style: Styles.textStyle14.copyWith(
              color: Colors.white.withOpacity(.5), fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
