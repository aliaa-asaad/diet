import 'package:diet/core/configurations/app_states.dart';
import 'package:diet/features/cart/view/model/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlansCubit extends Cubit<AppState> {
  PlansCubit() : super(LoadingState());

  //======================================
  //====================================== Variables
  //======================================
  List<MealModel> cartItemsList = [];

  //======================================
  //====================================== Functions
  //======================================
  Future<List<MealModel>> _requestCartItems() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return List.generate(
          10,
          (index) => MealModel(
            id: index,
            name: 'Meal $index',
            price: 10.0 * (index + 1),
            image: 'https://picsum.photos/200/300',
            description: 'This is a description for meal $index',
          ),
        );
      },
    );
  }

  //======================================
  //====================================== Events
  //======================================
  getCartItems() async {
    emit(LoadingState());
    try {
      cartItemsList = await _requestCartItems();
      if (cartItemsList.isNotEmpty) {
        emit(LoadedState(cartItemsList));
      } else {
        emit(EmptyState());
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
