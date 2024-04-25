library home_screen_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'home_screen_view_model.dart';

part 'home_screen_mobile.dart';
part 'home_screen_tablet.dart';
part 'home_screen_desktop.dart';

// ignore: must_be_immutable
class HomeScreenView extends StatelessWidget {
  static const routeName = '/home_screen';

  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      viewModelBuilder: () => HomeScreenViewModel(),
      onViewModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return ScreenTypeLayout.builder(
          mobile: (_) => _HomeScreenMobile(viewModel),
          desktop: (_) => _HomeScreenMobile(viewModel),
          tablet: (_) => _HomeScreenMobile(viewModel),
        );
      },
    );
  }
}
