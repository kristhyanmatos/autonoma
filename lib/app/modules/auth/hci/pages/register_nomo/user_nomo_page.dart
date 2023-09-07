import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../stores/register_nomo/user_nomo_store.dart';
import '../../widgets/banner_widget.dart';

class UserNomoPage extends StatefulWidget {
  const UserNomoPage({super.key});

  @override
  State<UserNomoPage> createState() => _UserNomoPageState();
}

class _UserNomoPageState extends State<UserNomoPage> {
  UserNomoStore store = Modular.get<UserNomoStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo NoMo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: RxBuilder(
          builder: (context) {
            if (store.isLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            return ListView(
              clipBehavior: Clip.none,
              children: [
                Text(
                  'Escolha uma Foto Principal',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Text(
                  'Essa foto será exibida para seus clientes durantes as buscas.',
                ),
                const SizedBox(height: 16),
                BannerWidget(
                  onChanged: store.setUserPhotoUrl,
                  value: store.state.urlPhoto,
                ),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 16),
                Text(
                  'Informe o seu Nome Comercial',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Text(
                  'Se você é conhecido pelo seu nome, não tem problema, vá em frente.',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: store.state.name,
                  onChanged: (value) {
                    store.setUserName(value);
                  },
                  decoration: const InputDecoration(
                    hintText: 'O seu nome comercial',
                    label: Text('Nome'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        child: TripleBuilder(
          store: store,
          builder: (context, _) {
            return FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              onPressed: () {
                if (!store.isLoading) {
                  store.putUser();
                }
              },
              child: Text(
                'Avançar',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}
