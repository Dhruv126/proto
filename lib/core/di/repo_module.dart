import 'package:get_it/get_it.dart';
import 'package:proto/repo/hotlines_repo/home_repo.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator() async {
  await locator.allReady();
}

setUpRepositoryModule() {
  locator.registerFactory<CountriesRepoHotLines>(() => CountriesRepoHotLines());
}
