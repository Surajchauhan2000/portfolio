import 'package:get_it/get_it.dart';
import 'package:portfolio/services/implementation/impl_contact_service.dart';

import 'domain/contact_viewmodel.dart';

final locator = GetIt.instance;

class Injection {
  static void setUp() {
    locator
        .registerLazySingleton<ImplContactService>(() => ImplContactService());
    locator.registerLazySingleton<ContactViewModel>(
        () => ContactViewModel(service: locator.get<ImplContactService>()));
  }
}
