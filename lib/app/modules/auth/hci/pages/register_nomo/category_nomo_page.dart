import 'package:autonoma/app/modules/core/widgets/search_categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../stores/register_nomo/category_nomo_store.dart';
import '../../widgets/button_next_widget.dart';

class CategoryNomoPage extends StatefulWidget {
  const CategoryNomoPage({super.key});

  @override
  State<CategoryNomoPage> createState() => _CategoryNomoPageState();
}

class _CategoryNomoPageState extends State<CategoryNomoPage> {
  CategoryNomoStore store = Modular.get<CategoryNomoStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              'Informe sua localização de trabalho',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Certificar-se de que sua localização esteja corretamente divulgada é crucial para que seus clientes possam encontrá-lo(a) com facilidade.',
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SizedBox(
                  width: 86,
                  child: TextFormField(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                    child: TextFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                )),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Selecione as categorias das quais você atua',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'As categorias são fundamentais para que seus clientes possam encontrá-lo(a) com facilidade.',
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Selecionar Categorias'),
              trailing: const Icon(
                Icons.arrow_forward,
                size: 18,
              ),
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  isDismissible: false,
                  enableDrag: true,
                  context: context,
                  builder: (context) => LayoutBuilder(
                    builder: (context, constraints) => SizedBox(
                      height: (constraints.maxHeight - 56),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: SearchCategoriesWidget(
                          onSelected: store.setCategories,
                          initialValue: store.state.categories,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            Text(
              'Categorias Selecionadas',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            RxBuilder(builder: (context) {
              if (store.state.categories.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Nenhuma Categoria selecionada',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              }
              return SafeArea(
                child: SizedBox(
                  height: 56,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: store.state.categories.length,
                    itemBuilder: (context, index) {
                      final category = store.state.categories[index];
                      return Chip(
                        label: Text(category.name),
                        deleteIcon: const Icon(Icons.close),
                        onDeleted: () {
                          final newState = store.state.categories
                            ..removeAt(index);
                          store.setCategories(newState);
                        },
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                  ),
                ),
              );
            })
          ],
        ),
      ),
      floatingActionButton: ButtonNextWidget(
        value: 'Avançar',
        onPressed: () {},
      ),
    );
  }
}
