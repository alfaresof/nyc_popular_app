import 'package:flutter_test/flutter_test.dart';
import 'package:nyc_popular_app/common/network/network_exception.dart';
import 'package:nyc_popular_app/common/service/get_it.dart';
import 'package:nyc_popular_app/features/home/repo/home_repo.dart';

void main() async {
  await setup();
  test('The value in state should be change when user chose number', () async {
    final res = await HomeApi().getNyc(1);
    res.when(success: (val) {
      print('Success Connection / result is : ');
      print(val.toJson());
    }, failure: (val) {
      print('Error is : ');
      print(val.toErrorMessage());
    });
  });
}
