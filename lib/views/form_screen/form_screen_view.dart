library form_screen_view;

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'form_screen_view_model.dart';

part 'form_screen_mobile.dart';
part 'form_screen_tablet.dart';
part 'form_screen_desktop.dart';

// ignore: must_be_immutable
class FormScreenView extends StatelessWidget {
  static const routeName = '/form_screen';
  final Map? singleRoom;

  const FormScreenView({super.key, this.singleRoom});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FormScreenViewModel>.reactive(
      viewModelBuilder: () => FormScreenViewModel(singleRoom),
      onViewModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return ScreenTypeLayout.builder(
          mobile: (_) => _FormScreenMobile(viewModel),
          desktop: (_) => _FormScreenMobile(viewModel),
          tablet: (_) => _FormScreenMobile(viewModel),
        );
      },
    );
  }
}
