import 'package:diet/core/shared/widgets/custom_form_field.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:diet/features/total/bloc/total_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoucherFormField extends StatelessWidget {
  const VoucherFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TotalBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Voucher',style: TextStyle(
          color: AppColors.black,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),),
        const SizedBox(
          height: 8,
        ),
        CustomFormField(
            hintText: 'Enter the voucher', controller: cubit.voucherController),
      ],
    );
  }
}
