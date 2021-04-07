import 'package:get_it/get_it.dart';
import 'package:renter_manager/services/firestore_api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api(pathToCollection: 'renters'));
}
