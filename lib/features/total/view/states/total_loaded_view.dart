import 'package:diet/features/cart/view/model/meal_model.dart';
import 'package:diet/features/total/view/widgets/choose_delivery_method.dart';
import 'package:diet/features/total/view/widgets/order_summary.dart';
import 'package:diet/features/total/view/widgets/select_branch_field.dart';
import 'package:diet/features/total/view/widgets/total_buttons.dart';
import 'package:diet/features/total/view/widgets/total_orders_list_view.dart';
import 'package:diet/features/total/view/widgets/voucher_form_field.dart';
import 'package:flutter/material.dart';

class TotalLoadedView extends StatelessWidget {
  final List<MealModel> cartItemsList;
  const TotalLoadedView({super.key, required this.cartItemsList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
     
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TotalOrdersListView(cartItemsList: cartItemsList),
          const SizedBox(
            height: 24,
          ),
          Padding(
           padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const VoucherFormField(),
                const SizedBox(
                  height: 24,
                ),
                const ChooseDeliveryMethod(),
                const SizedBox(
                  height: 24,
                ),
                const SelectBranchField(),
                const SizedBox(
                  height: 24,
                ),
                const OrderSummary(),
                const SizedBox(
                  height: 32,
                ),
                const TotalButtons(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
