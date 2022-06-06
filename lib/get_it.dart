import 'package:get_it_test/model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void initialGetIt() {
  //simple registration
  //GetIt.I.registerSingleton<AppModel>(AppModel(counter: -10));
  //lazy regisration
  GetIt.I.registerSingleton<AppModel>(AppModel());
}
//getIt<AppModel>().myParam;
//getIt<AppModel>().AppModelMethod();