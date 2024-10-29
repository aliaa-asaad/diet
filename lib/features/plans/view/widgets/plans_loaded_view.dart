import 'dart:io';

import 'package:diet/core/theme/colors.dart';
import 'package:diet/features/cart/view/model/meal_model.dart';
import 'package:flutter/material.dart';

class PlansLoadedView extends StatelessWidget {
  const PlansLoadedView({
    super.key,
    required this.cartItemsList,
  });

  final List<MealModel> cartItemsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    cartItemsList[index].image,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  cartItemsList[index].name,
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
                      '\$${cartItemsList[index].description}',
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
                      '\$${cartItemsList[index].price}',
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
              ),
            ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: cartItemsList.length);
  }
}
