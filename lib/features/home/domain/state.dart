import '../models/result_model.dart';

enum HomeStatus { init, loading }

class HomeState {
  final int chosenPeriod;
  final ResultModel resultModel;
  final HomeStatus status;

  HomeState({
    required this.resultModel,
    required this.chosenPeriod,
    required this.status,
  });

  factory HomeState.initial() {
    return HomeState(
      chosenPeriod: 1,
      status: HomeStatus.loading,
      resultModel: ResultModel(
        status: '',
        copyright: '',
        numResults: 0,
        results: [],
      ),
    );
  }

  HomeState copyWith(
      {int? chosenPeriod, ResultModel? resultModel, HomeStatus? status}) {
    return HomeState(
      resultModel: resultModel ?? this.resultModel,
      chosenPeriod: chosenPeriod ?? this.chosenPeriod,
      status: status ?? this.status,
    );
  }
}
