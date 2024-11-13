import 'package:diet/features/cart/view/model/meal_model.dart';
import 'package:diet/features/total/view/widgets/total_order_list_tile.dart';
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
        itemBuilder: (context, index) =>
            TotalOrderTile(cartItemsList: cartItemsList[index]),
        separatorBuilder: (context, index) => const Divider(
              height: 32,
            ),
        itemCount: cartItemsList.length);
  }
}
