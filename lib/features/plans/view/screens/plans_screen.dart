import 'package:diet/core/configurations/app_states.dart';
import 'package:diet/core/theme/assets/icons.dart';
import 'package:diet/features/cart/view/model/meal_model.dart';
import 'package:diet/features/plans/cubit/plans_cubit.dart';
import 'package:diet/features/plans/view/widgets/plans_loaded_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0), child: Divider()),
        title: const Padding(
          padding: EdgeInsetsDirectional.only(end: 24),
          child: Text(
            'Plans',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsetsDirectional.only(end: 24),
            icon: SvgPicture.asset(AppIcons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => PlansCubit()..getCartItems(),
        child: BlocBuilder<PlansCubit, AppState>(
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
              return PlansLoadedView(cartItemsList: cartItemsList);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
