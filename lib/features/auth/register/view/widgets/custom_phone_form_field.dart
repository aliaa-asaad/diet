import 'package:diet/core/configurations/validations.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:diet/features/auth/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneFormField extends StatelessWidget {
  const CustomPhoneFormField({
    super.key,
    required this.bloc,
  });

  final RegisterBloc bloc;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      validator: Validations.validatePhoneNumber,
      keyboardType: TextInputType.phone,
      controller: bloc.phoneNumberController,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        hintStyle: TextStyle(color: Color(0xffBFBFBF)),
      ),
      countries: const [
        Country(
            name: 'Egypt',
            flag: '🇪🇬',
            code: 'EG',
            dialCode: '20',
            nameTranslations: {
              'en': 'Egypt',
              'ar': 'مصر',
            },
            minLength: 11,
            maxLength: 11)
      ],
      onChanged: (phone) {
        bloc.phoneNumberController.text = phone.number;
      },
    );
  }
}
