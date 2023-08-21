import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryDetailScreen extends ConsumerWidget {
  const CategoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Category Name Comes Here'),
          GridView.count(
            crossAxisCount: 5,
            children: [],
          )
        ],
      ),
    );
  }
}
