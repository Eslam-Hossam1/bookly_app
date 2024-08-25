import 'dart:developer';

import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              text: "Free",
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
            onPressed: () async {
              final Uri url = Uri.parse(bookModel.volumeInfo.previewLink!);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                log('Could not launch $url');
              }
            },
            backgroundColor: const Color(0xffEF8262),
            text: "Free Preview",
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          )),
        ],
      ),
    );
  }
}
