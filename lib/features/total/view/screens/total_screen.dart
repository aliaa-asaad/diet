import 'package:diet/core/configurations/app_states.dart';
import 'package:diet/features/total/bloc/total_bloc.dart';
import 'package:diet/features/total/view/states/total_error_view.dart';
import 'package:diet/features/total/view/states/total_loaded_view.dart';
import 'package:diet/features/total/view/states/total_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalScreen extends StatelessWidget {
  const TotalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0), child: Divider()),
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => TotalBloc(),
        child: BlocBuilder<TotalBloc, AppState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const TotalLoadingView();
            } else if (state is LoadedState) {
              return  TotalLoadedView(cartItemsList: state.data,);
            } else if (state is Error) {
              return const TotalErrorView();
            }
            return const Text('no data');
          },
        ),
      ),
    );
  }
}
