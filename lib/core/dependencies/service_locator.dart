import 'package:get_it/get_it.dart';
import 'package:template_project/core/services/api/dio_consumer.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer());
}
