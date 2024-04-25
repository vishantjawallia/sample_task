part of home_screen_view;

// ignore: must_be_immutable
class _HomeScreenMobile extends StatelessWidget {
  final HomeScreenViewModel viewModel;

  const _HomeScreenMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Home Screen'),
            IconButton(
              onPressed: viewModel.onAppHandler,
              icon: const Icon(Icons.add),
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: SizedBox(
        child: viewModel.cardList.isEmpty
            ? const Center(
                child: Text(
                  'Not Input Field Found!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                child: Column(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: ListView.builder(
                          itemCount: viewModel.cardList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var obj = viewModel.cardList[index];

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 10),
                                          Text(
                                            '${obj['name']}',
                                          ),
                                          Text(
                                            '${obj['email']}',
                                          ),
                                          Text(
                                            '${obj['gender']}' == "0" ? "Male" : "Female",
                                          ),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () => viewModel.onEditHandler(index),
                                            icon: const Icon(Icons.edit),
                                          ),
                                          IconButton(
                                            onPressed: () => viewModel.onDeleteHandler(index),
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
