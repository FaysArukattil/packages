import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:packages/cutom_ratingbar.dart';

class Ratingscreen extends StatefulWidget {
  const Ratingscreen({super.key});

  @override
  State<Ratingscreen> createState() => _RatingscreenState();
}

class _RatingscreenState extends State<Ratingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomRatingBar(
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              halfFilledIcon: Icons.star_half,
              onRatingChanged: (value) {
                debugPrint("Rating: $value");
              },
              initialRating: 2,
              maxRating: 5,
              filledColor: Colors.blue,
              size: 40,
            ),
            RatingBar.readOnly(
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              initialRating: 4,
              maxRating: 5,
              alignment: Alignment.center,
              filledColor: Colors.purpleAccent,
            ),
          ],
        ),
      ),
    );
  }
}
