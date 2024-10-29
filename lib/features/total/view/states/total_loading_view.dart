import 'package:flutter/material.dart';

class TotalLoadingView extends StatelessWidget {
  const TotalLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
