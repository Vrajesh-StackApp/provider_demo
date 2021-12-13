import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider_demo/pages/home_page.dart';
import 'package:provider_demo/pages/provider_page.dart';
import 'package:provider_demo/utils/app_string.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppString.homePage, child: (_, __) => const HomePage()),
        ChildRoute(AppString.providerPage, child: (_, __) => const ProviderPage()),
      ];
}
