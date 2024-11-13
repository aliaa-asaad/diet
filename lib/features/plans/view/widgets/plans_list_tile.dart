import 'dart:io';

import 'package:diet/core/theme/colors.dart';
import 'package:diet/features/cart/view/model/meal_model.dart';
import 'package:flutter/material.dart';

class PlansListTile extends StatelessWidget {
  const PlansListTile({
    super.key,
    required this.cartItemsList,
  });

  final MealModel cartItemsList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          cartItemsList.image,
          width: 64,
          height: 64,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        cartItemsList.name,
        style: const TextStyle(
          color: AppColors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$${cartItemsList.description}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '\$${cartItemsList.price}',
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      trailing: Platform.isIOS
          ? IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            )
          : IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward),
            ),
    );
  }
}
