import 'package:flutter/material.dart';

class CustomRatingBar extends StatefulWidget {
  final IconData filledIcon;
  final IconData halfFilledIcon;
  final IconData emptyIcon;
  final double initialRating;
  final int maxRating;
  final Color filledColor;
  final Color halfFilledColor;
  final Color emptyColor;
  final double size;
  final bool isHalfAllowed;
  final bool readOnly;
  final Alignment alignment;
  final ValueChanged<double>? onRatingChanged;

  const CustomRatingBar({
    super.key,
    required this.filledIcon,
    required this.emptyIcon,
    this.onRatingChanged,
    this.halfFilledIcon = Icons.star_half,
    this.initialRating = 0.0,
    this.maxRating = 5,
    this.filledColor = Colors.amber,
    this.halfFilledColor = Colors.amber,
    this.emptyColor = Colors.grey,
    this.size = 30,
    this.isHalfAllowed = false,
    this.readOnly = false,
    this.alignment = Alignment.center,
  });

  @override
  State<CustomRatingBar> createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  late double rating;

  @override
  void initState() {
    super.initState();
    rating = widget.initialRating;
  }

  void _updateRating(int index) {
    if (widget.readOnly) return;

    double newRating = index + 1.0;

    setState(() => rating = newRating);
    widget.onRatingChanged?.call(rating);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.maxRating, (index) {
          double currentStarValue = index + 1.0;

          IconData icon;
          Color color;

          if (rating >= currentStarValue) {
            icon = widget.filledIcon;
            color = widget.filledColor;
          } else if (widget.isHalfAllowed && rating >= currentStarValue - 0.5) {
            icon = widget.halfFilledIcon;
            color = widget.halfFilledColor;
          } else {
            icon = widget.emptyIcon;
            color = widget.emptyColor;
          }

          return GestureDetector(
            onTap: widget.readOnly ? null : () => _updateRating(index),
            child: Icon(icon, color: color, size: widget.size),
          );
        }),
      ),
    );
  }
}
