import 'package:autonoma/app/modules/core/stores/categories_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryNomoPage extends StatefulWidget {
  const CategoryNomoPage({super.key});

  @override
  State<CategoryNomoPage> createState() => _CategoryNomoPageState();
}

class _CategoryNomoPageState extends State<CategoryNomoPage> {
  CategoriesStore categoriesStore = Modular.get<CategoriesStore>();
  @override
  void initState() {
    categoriesStore.getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          categoriesStore.getAllCategories();
        },
        child: ListView(
          children: const [
            Text('asda'),
          ],
        ),
      ),
    );
  }
}
