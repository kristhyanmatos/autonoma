import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../domain/entities/category.dart';
import '../stores/categories_store.dart';
import '../stores/categories_options_store.dart';

class SearchCategoriesWidget extends StatefulWidget {
  final List<Category> initialValue;
  final void Function(List<Category>) onSelected;
  const SearchCategoriesWidget({
    super.key,
    required this.onSelected,
    required this.initialValue,
  });

  @override
  State<SearchCategoriesWidget> createState() => _SearchCategoriesWidgetState();
}

class _SearchCategoriesWidgetState extends State<SearchCategoriesWidget> {
  CategoriesStore categoriesStore = Modular.get<CategoriesStore>();
  TextEditingController controllerSearchBar = TextEditingController();
  CategoriesOptionsStore categoriesOptionsStore =
      Modular.get<CategoriesOptionsStore>();
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await categoriesStore.getAllCategories();
    search('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Icon(Icons.horizontal_rule_rounded),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchBar(
              controller: controllerSearchBar,
              hintText: 'Pesquisar Categorias',
              onChanged: search,
              trailing: [
                controllerSearchBar.value.text.isEmpty
                    ? IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search))
                    : IconButton(
                        onPressed: () {
                          controllerSearchBar.clear();
                          search('');
                        },
                        icon: const Icon(Icons.close))
              ],
            ),
          ),
        ),
      ),
      body: TripleBuilder(
        store: categoriesStore,
        builder: (context, triple) {
          if (categoriesStore.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SafeArea(
              child: TripleBuilder(
                  store: categoriesOptionsStore,
                  builder: (context, triple) {
                    return ListView.builder(
                      itemCount: categoriesOptionsStore.state.length,
                      itemBuilder: (context, index) {
                        final category = categoriesOptionsStore.state[index];
                        return CheckboxListTile(
                          title: Text(category.name),
                          value: selected(category),
                          onChanged: (value) {
                            onTap(value ?? false, category);
                          },
                        );
                      },
                    );
                  }),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        foregroundColor: Theme.of(context).colorScheme.surface,
        onPressed: () {
          Modular.to.pop();
        },
        label: const Text('Ok'),
      ),
    );
  }

  search(String value) {
    setState(() {});
    categoriesOptionsStore.getOptions(value, categoriesStore.state);
  }

  selected(Category category) {
    final response = widget.initialValue.where(
      (element) => element.id == category.id,
    );
    return response.isNotEmpty;
  }

  onTap(bool selected, Category category) {
    if (selected) {
      final newState = widget.initialValue..add(category);
      widget.onSelected(newState);
    } else {
      final newState = widget.initialValue..remove(category);
      widget.onSelected(newState);
    }
    categoriesOptionsStore.update(categoriesOptionsStore.state, force: true);
  }
}
