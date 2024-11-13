import 'package:diet/core/configurations/app_events.dart';
import 'package:diet/core/configurations/app_states.dart';
import 'package:diet/core/constants/api_constance.dart';
import 'package:diet/core/handlers/shared_handler.dart';
import 'package:diet/core/network/dio_helper.dart';
import 'package:diet/features/auth/register/data/params/register_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      TextEditingController();
  TextEditingController referralCodeController = TextEditingController();
  bool isChecked = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

//--------------------------------------functions--------------------------------------//
  Future<String> _postRegister(RegisterParams body) async {
    try {
     
      final response = await DioHelper.post(
        ApiConstance.register,
        data: body.toMap(),
      );
      return response.data['message'];
    } catch (e) {
      throw (e.toString());
    }
  }

  //--------------------------------------events--------------------------------------//
  register(ClickEvent event, Emitter emit) async {
    emit(LoadingState());
    try {
       final params = RegisterParams(
          email: emailController.text,
          password: passwordController.text,
          name: fullNameController.text,
          phoneNumber: phoneNumberController.text,
          confirmPassword: confirmPasswordController.text);
      await _postRegister(params);
       await SharedHandler.instance!.setData(SharedKeys().isLogin, value: true);
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
