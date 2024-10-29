import 'package:diet/core/theme/colors.dart';
import 'package:diet/features/cart/view/model/meal_model.dart';
import 'package:flutter/material.dart';

class TotalOrdersListView extends StatelessWidget {
  const TotalOrdersListView({
    super.key,
    required this.cartItemsList,
  });

  final List<MealModel> cartItemsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => ListTile(
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
                '\$${cartItemsList[index].price}',
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: cartItemsList.length);
  }
}
