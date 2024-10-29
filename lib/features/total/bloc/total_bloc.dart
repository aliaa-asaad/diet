import 'package:diet/core/configurations/app_events.dart';
import 'package:diet/core/configurations/app_states.dart';
import 'package:diet/features/cart/view/model/meal_model.dart';
import 'package:diet/features/total/view/domain/branch_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalBloc extends Bloc<AppEvent, AppState> {
  TotalBloc() : super(LoadingState()) {
    on<GetDataEvent>(getCartItems);
    on<ChooseEvent>(chooseBranch);
    on<UpdateEvent>(addFees);
    add(GetDataEvent());
  }

  //======================================
  //====================================== Variables
  //======================================

  TextEditingController voucherController = TextEditingController();
  int selectedMethod = -1;

  String selectedBranch = "";
  List<BranchDomain> branches = [
    BranchDomain(
        name: 'Richdiets Branch one',
        description: 'Dubai, Street 55 Dub Tower'),
    BranchDomain(
        name: 'Richdiets Branch two',
        description: 'Dubai, Street 55 Dub Tower'),
  ];

  List<MealModel> cartItemsList = List.generate(
    2,
    (index) => MealModel(
      id: index,
      name: 'Meal $index',
      price: 100.0 * (index + 1),
      image: 'https://picsum.photos/200/300',
      description: 'This is a description for meal $index',
    ),
  );

  double total = 0.0;
  double deliveryFee = 10;

  //======================================
  //====================================== Functions
  //======================================
  Future<List<MealModel>> _requestCartItems() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        total = cartItemsList
            .map((e) => e.price)
            .reduce((value, element) => value + element);
        return cartItemsList;
      },
    );
  }

  void _chooseBranch(String branch) {
    selectedBranch = branch;
  }

  void _addFees() {
    total += deliveryFee;
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

  chooseBranch(
    ChooseEvent event,
    Emitter emit,
  ) {
    String branch = event.data;
    _chooseBranch(branch);

    emit(LoadedState(cartItemsList));
  }

  addFees(
    UpdateEvent event,
    Emitter emit,
  ) {
    _addFees();
    emit(LoadedState(cartItemsList));
  }
}
