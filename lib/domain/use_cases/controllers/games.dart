import 'package:get/get.dart';

class GamesController extends GetxController {
  // Observables
  final _gameIndex = 0.obs;

  set gameIndex(int index) {
    _gameIndex.value = index;
  }

  // Reactive Getters
  RxInt get reactiveScreenIndex => _gameIndex;

  // Getters
  int get screenIndex => _gameIndex.value;
}
