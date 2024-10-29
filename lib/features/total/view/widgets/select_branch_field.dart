import 'package:diet/core/configurations/app_events.dart';
import 'package:diet/core/configurations/app_states.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:diet/features/total/bloc/total_bloc.dart';
import 'package:diet/features/total/view/domain/branch_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectBranchField extends StatelessWidget {
  const SelectBranchField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TotalBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select a Branch',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () {
            showBranchSelectionModal(
                context, bloc.selectedBranch, bloc.branches);
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.border)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  bloc.selectedBranch.isEmpty
                      ? 'Select...'
                      : bloc.selectedBranch,
                  style: TextStyle(
                    color: bloc.selectedBranch.isEmpty
                        ? AppColors.hint
                        : AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          ),
        )
      ],
    );
  }

 }
 void showBranchSelectionModal(
      BuildContext context, String value, List<BranchDomain> values) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext _) {
        return BlocProvider.value(
          value: context.read<TotalBloc>(),
          child: BlocBuilder<TotalBloc, AppState>(
            buildWhen: (previous, current) => current is LoadedState,
            builder: (_, state) {
              final bloc = context.read<TotalBloc>();
              return Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Select Branch',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => RadioListTile<String>(
                              activeColor: AppColors.primaryColor,
                              value: values[index].name,
                              groupValue: bloc.selectedBranch,
                              onChanged: (String? value) {
                                bloc.add(ChooseEvent(value));
                              },
                              title: Text(
                                values[index].name,
                                style: const TextStyle(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                values[index].description,
                                style: const TextStyle(
                                  color: AppColors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: values.length),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
