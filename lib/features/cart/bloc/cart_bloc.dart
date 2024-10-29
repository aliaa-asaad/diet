import 'package:diet/core/configurations/app_events.dart';
import 'package:diet/core/configurations/app_states.dart';
import 'package:diet/features/cart/view/model/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<AppEvent, AppState> {
  CartBloc() : super(LoadingState()) {
    on<GetDataEvent>(getCartItems);
    on<AddEvent>(increaseItemQuantity);
    on<RemoveEvent>(decreaseItemQuantity);
    add(GetDataEvent());
  }

  //======================================
  //====================================== Variables
  //======================================
  List<MealModel> cartItemsList = List.generate(
          10,
          (index) => MealModel(
            id: index,
            name: 'Meal $index',
            price: 10.0 * (index + 1),
            image: 'https://picsum.photos/200/300',
            description: 'This is a description for meal $index',
          ),
        );

  //======================================
  //====================================== Functions
  //======================================
  Future<List<MealModel>> _requestCartItems() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return cartItemsList;
      },
    );
  }

  void _increaseItemQuantity(int id) {
    final index = cartItemsList.indexWhere((element) => element.id == id);
    cartItemsList[index].quantity++;
  }

  void _decreaseItemQuantity(int id) {
    final index = cartItemsList.indexWhere((element) => element.id == id);
    if (index != -1) {
      if (cartItemsList[index].quantity > 1) {
        cartItemsList[index].quantity--;
      } else {
        cartItemsList.removeAt(index);
      }
    }
  }

  //======================================
  //====================================== Events
  //======================================
  getCartItems(GetDataEvent event, Emitter emit) async {
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

  increaseItemQuantity(AddEvent event, Emitter emit) {
    int id = event.data;
    _increaseItemQuantity(id);
    emit(LoadedState(cartItemsList));
  }

  decreaseItemQuantity(RemoveEvent event, Emitter emit) {
    int id = event.data;
    _decreaseItemQuantity(id);
    emit(LoadedState(cartItemsList));
  }
}
