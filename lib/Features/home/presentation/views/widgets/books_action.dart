import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: const Row(
        children: [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              text: "19.99€",
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              fontWeight: FontWeight.w900,
            ),
          ),
          Expanded(
              child: CustomButton(
            backgroundColor: Color(0xffEF8262),
            text: "Free Preview",
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          )),
        ],
      ),
    );
  }
}
