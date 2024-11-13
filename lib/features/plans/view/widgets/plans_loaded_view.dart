import 'package:diet/features/cart/view/model/meal_model.dart';
import 'package:diet/features/plans/view/widgets/plans_list_tile.dart';
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
        padding: const EdgeInsets.all(24),
        itemBuilder: (context, index) =>
            PlansListTile(cartItemsList: cartItemsList[index]),
        separatorBuilder: (context, index) => const Divider(
              height: 32,
            ),
        itemCount: cartItemsList.length);
  }
}
