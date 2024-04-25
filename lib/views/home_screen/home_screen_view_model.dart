import 'package:get/get.dart';
import 'package:sample_task/config/preference.dart';
import 'package:sample_task/views/form_screen/form_screen_view.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  List cardList = [];

  HomeScreenViewModel() {
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    //Write your models loading codes here

    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }

  onEditHandler(int index) {
    Get.to(() => FormScreenView(singleRoom: {}));
  }

  onDeleteHandler(int index) {}

  void onAppHandler() {
    Get.to(() => FormScreenView());
  }
}
