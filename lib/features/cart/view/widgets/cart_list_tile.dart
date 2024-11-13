import 'package:diet/core/configurations/app_events.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:diet/features/cart/bloc/cart_bloc.dart';
import 'package:diet/features/cart/view/model/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartListTile extends StatelessWidget {
  const CartListTile({
    super.key,
    required this.cartItemsList,
  });

  final MealModel cartItemsList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartItemsList.name,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 14,
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
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.border,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context)
                          .add(RemoveEvent(cartItemsList.id));
                    },
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(
                      Icons.remove,
                      color: AppColors.grey,
                      size: 16,
                    ),
                  ),
                  Text('${cartItemsList.quantity}'),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context)
                          .add(AddEvent(cartItemsList.id));
                    },
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(
                      Icons.add,
                      size: 16,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            cartItemsList.image,
            width: 64,
            height: 64,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
