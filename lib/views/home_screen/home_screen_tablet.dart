part of home_screen_view;

// ignore: must_be_immutable
class _HomeScreenTablet extends StatelessWidget {
  final HomeScreenViewModel viewModel;

  _HomeScreenTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('HomeScreenTablet')),
    );
  }
}