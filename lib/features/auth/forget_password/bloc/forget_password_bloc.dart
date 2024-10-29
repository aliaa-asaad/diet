import 'dart:developer';

import 'package:diet/core/configurations/app_events.dart';
import 'package:diet/core/configurations/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordBloc extends Bloc<AppEvent, AppState> {
  ForgetPasswordBloc() : super(InitState()) {
    on<ClickEvent>(forgetPassword);
  }

  //--------------------------------------variables--------------------------------------//
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

//--------------------------------------functions--------------------------------------//
  Future<void> _postForgetPasswordParams() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        log('email: ${emailController.text}');
      },
    );
  }

  //--------------------------------------events--------------------------------------//
  forgetPassword(ClickEvent event, Emitter emit) async {
    emit(LoadingState());
    try {
      await _postForgetPasswordParams();
      emit(LoadedState('forget Password successful'));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
