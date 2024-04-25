part of form_screen_view;

// ignore: must_be_immutable
class _FormScreenDesktop extends StatelessWidget {
  final FormScreenViewModel viewModel;

  _FormScreenDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('FormScreenDesktop')),
    );
  }
}