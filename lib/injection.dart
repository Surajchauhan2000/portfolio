const locator = Locator();

class Injection {
  static void setUp() {
    locator.put(ImplContactService());
    locator.put(ContactViewModel(service: locator.get<ImplContactService>()));
  }
}
