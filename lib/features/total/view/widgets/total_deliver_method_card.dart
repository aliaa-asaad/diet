import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';

class TotalDeliveryMethodCard extends StatelessWidget {
  final Color background;
  final String title;
  final double width;
  final Border border;
  final String image;
  final Function() onTap;

  const TotalDeliveryMethodCard({
    super.key,
    required this.background,
    required this.title,
    required this.width,
    required this.border,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 52,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: background),
          child: Stack(
            children: [
              Container(
                width: width,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  border: border,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(8),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      image,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(title)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
