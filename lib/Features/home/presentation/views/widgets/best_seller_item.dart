import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class VerticalListBookItem extends StatelessWidget {
  const VerticalListBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.kDetailsView);
      },
      child: SizedBox(
        height: 120,
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
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      "Harry Potter and the Goblet of Fire",
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGTSectraFineFontFamily),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "J.K. Rowling",
                    style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(.7)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "19.99 €",
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const BookRating()
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
