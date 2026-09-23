import 'package:get/get.dart';
import 'package:asad_gadget/app/models/sample_item_model.dart';
import '../repositories/root_repository.dart';

class RootController extends GetxController {
  final currentIndex = 0.obs;
  final sampleItems = <SampleItemModel>[].obs;
  final isLoading = false.obs;

  late final RootRepository _repository;

  @override
  void onInit() {
    super.onInit();
    _repository = Get.find<RootRepository>();
    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    final response = await _repository.fetchRootData();
    if (response['status'] == 'success' && response['data'] != null) {
      final rawList = response['data'] as List;
      final parsedModels = rawList.map((e) => SampleItemModel.fromJson(e)).toList();
      sampleItems.assignAll(parsedModels);
    }
    isLoading.value = false;
  }

  void changePage(int index) {
    currentIndex.value = index;
  }
}
