import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diet/core/configurations/app_events.dart';
import 'package:diet/core/configurations/app_states.dart';

class LoginBloc extends Bloc<AppEvent, AppState> {
  LoginBloc() : super(InitState()) {
    on<ClickEvent>(login);
  }

  //--------------------------------------variables--------------------------------------//
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

//--------------------------------------functions--------------------------------------//
  Future<void> _postLoginParams() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        log('email: ${emailController.text}');
        log('password: ${passwordController.text}');
      },
    );
  }

  //--------------------------------------events--------------------------------------//
  login(ClickEvent event, Emitter emit) async {
    emit(LoadingState());
    try {
      await _postLoginParams();
      emit(LoadedState('Login successful'));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
