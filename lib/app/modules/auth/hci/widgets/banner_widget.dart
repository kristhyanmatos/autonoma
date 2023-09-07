import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../stores/widgets/banner_store.dart';

class BannerWidget extends StatefulWidget {
  final String value;
  final void Function(String) onChanged;
  const BannerWidget({super.key, required this.value, required this.onChanged});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  BannerStore store = Modular.get<BannerStore>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        'Camera',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      leading: const Icon(Icons.camera_alt),
                      onTap: () async {
                        await store.selectImageCamera(widget.onChanged);
                        Modular.to.pop();
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Galeria',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      leading: const Icon(Icons.photo),
                      onTap: () async {
                        await store.selectImageGalery(widget.onChanged);
                        Modular.to.pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 220,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.outline,
              offset: const Offset(0, 0),
              blurRadius: 3.0,
              spreadRadius: 0.05,
            ),
          ],
        ),
        child: TripleBuilder(
          store: store,
          builder: (context, triple) {
            return ChildWidget(value: store.state);
          },
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  final String value;
  const ChildWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    if (value.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.file(
          File(value),
          fit: BoxFit.fitWidth,
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.camera_alt,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(width: 12),
          const Text('Ou'),
          const SizedBox(width: 12),
          Icon(
            Icons.image,
            color: Theme.of(context).colorScheme.outline,
          ),
        ],
      );
    }
  }
}
