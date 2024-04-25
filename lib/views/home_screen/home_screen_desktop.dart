part of home_screen_view;

// ignore: must_be_immutable
class _HomeScreenDesktop extends StatelessWidget {
  final HomeScreenViewModel viewModel;

  _HomeScreenDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('HomeScreenDesktop')),
    );
  }
}