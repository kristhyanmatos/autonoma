import 'package:autonoma/app/modules/core/messages/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../stores/register_nomo/user_nomo_store.dart';
import '../../widgets/button_next_widget.dart';
import '../../widgets/banner_widget.dart';

class UserNomoPage extends StatefulWidget {
  const UserNomoPage({super.key});

  @override
  State<UserNomoPage> createState() => _UserNomoPageState();
}

class _UserNomoPageState extends State<UserNomoPage> {
  UserNomoStore store = Modular.get<UserNomoStore>();
  final _formKey = GlobalKey<FormState>();
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
              return const Center(child: CircularProgressIndicator());
            }
            return Form(
              key: _formKey,
              child: ListView(
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Obrigatório.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: TripleBuilder(
        store: store,
        builder: (context, _) {
          return ButtonNextWidget(
            value: 'Avançar',
            onPressed: () {
              if (store.state.urlPhoto.isEmpty) {
                showMessage('Por favor, seleciona uma Foto Principal');
              } else {
                if (_formKey.currentState?.validate() == true) {
                  if (!store.isLoading) {
                    store.putUser();
                  }
                }
              }
            },
          );
        },
      ),
    );
  }
}
