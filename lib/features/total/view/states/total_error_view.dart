import 'package:diet/core/configurations/app_events.dart';
import 'package:diet/features/total/bloc/total_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalErrorView extends StatelessWidget {
  const TotalErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<TotalBloc>().add(GetDataEvent());
      },
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.refresh,
              size: 48,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'An error occurred. Tap to retry',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
