import 'package:flutter_modular/flutter_modular.dart';

import '../core/core_module.dart';
import 'domain/repositories/chat_repository.dart';
import 'external/chat_datasource.dart';
import 'hci/pages/chat_page.dart';
import 'hci/stores/chat_store.dart';
import 'infra/datasources/chat_datasource.dart';
import 'infra/repositories/chat_repository.dart';

class ChatModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.addSingleton<IChatDatasource>(ChatDatasource.new);
    i.addSingleton<IChatRepository>(ChatRepository.new);
    i.add(ChatStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (contexto) => ChatPage(id: r.args.data));
  }
}
