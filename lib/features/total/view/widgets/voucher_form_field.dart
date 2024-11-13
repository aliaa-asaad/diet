import 'package:diet/core/shared/widgets/custom_form_field.dart';
import 'package:diet/core/theme/assets/icons.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:diet/features/total/bloc/total_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        const Text(
          'Voucher',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomFormField(
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SvgPicture.asset(
                AppIcons.voucher,
                height: 24,
                width: 24,
              ),
            ),
            suffixIcon: TextButton(
              onPressed: () {},
              child: const Text(
                'Apply',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            hintText: 'Enter the voucher',
            controller: cubit.voucherController),
      ],
    );
  }
}
