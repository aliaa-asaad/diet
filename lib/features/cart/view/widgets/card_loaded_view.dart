import 'package:diet/features/cart/view/model/meal_model.dart';
import 'package:diet/features/cart/view/widgets/cart_list_tile.dart';
import 'package:flutter/material.dart';

class CartLoadedView extends StatelessWidget {
  const CartLoadedView({
    super.key,
    required this.cartItemsList,
  });

  final List<MealModel> cartItemsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: CartListTile(cartItemsList: cartItemsList[index]),
            ),
        separatorBuilder: (context, index) => const Divider(
              height: 32,
            ),
        itemCount: cartItemsList.length);
  }
}
