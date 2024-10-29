import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diet/core/configurations/app_events.dart';
import 'package:diet/core/configurations/app_states.dart';

class RegisterBloc extends Bloc<AppEvent, AppState> {
  RegisterBloc() : super(InitState()) {
    on<ClickEvent>(register);
    on<CheckEvent>(toggleCheckBox);
  }

  //--------------------------------------variables--------------------------------------//
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController =
      TextEditingController(text: '(+971)');
  TextEditingController referralCodeController = TextEditingController();
  bool isChecked = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

//--------------------------------------functions--------------------------------------//
  Future<void> _postRegisterParams() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        log('email: ${emailController.text}');
        log('password: ${passwordController.text}');
      },
    );
  }

  //--------------------------------------events--------------------------------------//
  register(ClickEvent event, Emitter emit) async {
    emit(LoadingState());
    try {
      await _postRegisterParams();
      emit(LoadedState('Register successful'));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void toggleCheckBox(CheckEvent event, Emitter emit) {
    isChecked = !isChecked;
    emit(
      CheckState(),
    );
  }
}
