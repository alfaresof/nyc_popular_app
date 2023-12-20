import 'package:flutter/cupertino.dart';
import 'package:nyc_popular_app/common/network/network_exception.dart';
import 'package:nyc_popular_app/features/home/domain/state.dart';
import 'package:nyc_popular_app/features/home/repo/home_repo.dart';
import 'package:riverpod/riverpod.dart';

import '../../../common/widgets/snack_bar.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState.initial());

  void getNyc(BuildContext context) async {
    state = await state.copyWith(status: HomeStatus.loading);

    final res = await HomeApi().getNyc(state.chosenPeriod);
    res.when(success: (val) {
      state = state.copyWith(
        status: HomeStatus.init,
        resultModel: val,
      );
    }, failure: (val) {
      state = state.copyWith(status: HomeStatus.init);
      showCustomSnackBar(
        content: val.toErrorMessage(),
        context: context,
      );
    });
  }

  void setPeriod(value) {
    state = state.copyWith(
      chosenPeriod: value,
    );
  }
}
