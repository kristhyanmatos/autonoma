import 'package:autonoma/app/modules/core/core_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'domain/repositories/auth_repository.dart';
import 'domain/repositories/nomo_repository.dart';
import 'domain/services/image_service.dart';
import 'external/auth_datasource.dart';
import 'external/image_datasource.dart';
import 'external/nomo_datasource.dart';
import 'external/storage_datasource.dart';
import 'hci/pages/login_page.dart';
import 'hci/pages/register_nomo/category_nomo_page.dart';
import 'hci/pages/register_nomo/completed_nomo_page.dart';
import 'hci/pages/register_nomo/user_nomo_page.dart';
import 'hci/pages/register_nomo/welcome_nomo_page.dart';
import 'hci/stores/login_store.dart';
import 'hci/stores/register_nomo/category_nomo_store.dart';
import 'hci/stores/register_nomo/user_nomo_store.dart';
import 'hci/stores/register_nomo/welcome_nomo_store.dart';
import 'hci/stores/widgets/banner_store.dart';
import 'infra/datasources/auth_datasource.dart';
import 'infra/datasources/image_datasource.dart';
import 'infra/datasources/nomo_datasource.dart';
import 'infra/datasources/storage_datasource.dart';
import 'infra/repositories/auth_repository.dart';
import 'infra/repositories/nomo_repository.dart';
import 'infra/services/image_service.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.addInstance(FirebaseAuth.instance);
    i.addInstance(FirebaseStorage.instance);
    i.addInstance(GoogleSignIn());
    i.addSingleton<IStorageImageDatasource>(StorageImageDatasource.new);
    i.addSingleton<IImageDatasource>(ImageDatasource.new);
    i.addSingleton<INomoDatasource>(NomoDatasource.new);
    i.addSingleton<IAuthDatasource>(AuthDatasource.new);
    i.addSingleton<IImageService>(ImageService.new);
    i.addSingleton<IAuthRepository>(AuthRepository.new);
    i.addSingleton<INomoRepository>(NomoRepository.new);
    i.add(LoginStore.new);
    i.add(CategoryNomoStore.new);
    i.add(UserNomoStore.new);
    i.add(WelcomeNomoStore.new);
    i.add(BannerStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const LoginPage());
    r.child('/category_nomo', child: (context) => const CategoryNomoPage());
    r.child('/completed_nomo', child: (context) => const CompletedNomoPage());
    r.child('/user_nomo', child: (context) => const UserNomoPage());
    r.child('/welcome_nomo', child: (context) => const WelcomeNomoPage());
  }
}
