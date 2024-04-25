part of form_screen_view;

// ignore: must_be_immutable
class _FormScreenTablet extends StatelessWidget {
  final FormScreenViewModel viewModel;

  _FormScreenTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('FormScreenTablet'),
      ),
    );
  }
}
