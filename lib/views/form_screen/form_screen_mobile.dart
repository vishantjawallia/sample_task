part of 'form_screen_view.dart';

class _FormScreenMobile extends StatelessWidget {
  final FormScreenViewModel viewModel;

  const _FormScreenMobile(this.viewModel);

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
      body: RefreshIndicator(
        onRefresh: viewModel.onRefresh,
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: viewModel.formList.isEmpty
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
                        child: Form(
                          key: viewModel.formKey,
                          child: ListView.builder(
                            itemCount: viewModel.formList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var obj = viewModel.formList[index];
                              if (obj['type'] == "form") {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 4),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'ID:${obj['id']}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          TextFormField(
                                            initialValue: '${obj['name']}',
                                            onChanged: (value) => viewModel.onChangedHandler(value, 'name', index),
                                            validator: (value) => viewModel.validatorhandler(value, 'name', index),
                                            decoration: const InputDecoration(
                                              hintText: 'Enter name',
                                              labelText: 'Name',
                                            ),
                                          ),
                                          TextFormField(
                                            initialValue: '${obj['email']}',
                                            onChanged: (value) => viewModel.onChangedHandler(value, 'email', index),
                                            validator: (value) => viewModel.validatorhandler(value, 'email', index),
                                            decoration: const InputDecoration(
                                              hintText: 'Enter email',
                                              labelText: 'Email',
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Radio(
                                                    value: GendertCharacter.male,
                                                    groupValue: (obj['gender'] as GendertCharacter),
                                                    onChanged: (v) => viewModel.senderChange(index, v),
                                                  ),
                                                  const Text('Male'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Radio(
                                                    value: GendertCharacter.female,
                                                    groupValue: (obj['gender'] as GendertCharacter),
                                                    onChanged: (v) => viewModel.senderChange(index, v),
                                                  ),
                                                  const Text('Female'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
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
                                                obj['gender'] == GendertCharacter.male ? "Male" : "Female",
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
                              }
                            },
                          ),
                        ),
                      ),
                      if (viewModel.formList.isNotEmpty)
                        Column(
                          children: [
                            const SizedBox(width: 0.0, height: 16),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blue),
                                minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
                              ),
                              onPressed: viewModel.submitHandler,
                              child: const Text(
                                'Sumbit',
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
