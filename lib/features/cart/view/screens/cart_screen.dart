import 'package:diet/core/configurations/app_states.dart';
import 'package:diet/features/cart/bloc/cart_bloc.dart';
import 'package:diet/features/cart/view/model/meal_model.dart';
import 'package:diet/features/cart/view/widgets/card_loaded_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0), child: Divider()),
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => CartBloc(),
        child: BlocBuilder<CartBloc, AppState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is EmptyState) {
              return const Center(
                child: Text('No items in the cart'),
              );
            } else if (state is LoadedState) {
              List<MealModel> cartItemsList = state.data as List<MealModel>;
              return CartLoadedView(cartItemsList: cartItemsList);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
