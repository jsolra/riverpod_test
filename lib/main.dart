import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

enum NumberType { first, second, third, fourth, fifth }

class CountNotifier extends StateNotifier<int> {
  CountNotifier() : super(0);

  void increment([int value = 1]) => state += value;
  void decrement([int value = 1]) => state -= value;
}

final CountStateNotifierProvider =
    StateNotifierProvider<CountNotifier, int>((ref) {
  return CountNotifier();
});

class Home extends ConsumerWidget {
  Home({super.key});

  final NumberProvider = StateProvider<NumberType>((ref) {
    return NumberType.first;
  });

  Widget widgetButton(String title, Function() ontap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 44,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.green,
              )),
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterRead = ref.read(CountStateNotifierProvider.notifier);
    print('build');
    return Scaffold(
      appBar: AppBar(
        actions: [
          // DropdownButton<ProductSortType>(
          //   value: ref.watch(productSortTypeProvider),
          //   onChanged: (value) =>
          //       ref.read(productSortTypeProvider.notifier).state = value!,
          //   items: const [

          //     DropdownMenuItem(
          //       value: ProductSortType.name,
          //       child: Icon(
          //         Icons.sort_by_alpha,
          //         color: Colors.black,
          //       ),
          //     ),
          //     DropdownMenuItem(
          //       value: ProductSortType.price,
          //       child: Icon(
          //         Icons.sort,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final count = ref.watch(CountStateNotifierProvider);
              return Text(
                '$count',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              );
            },
          ),
          widgetButton('add', () {
            counterRead.increment();
          }),
          widgetButton('sub', () {
            counterRead.decrement();
          }),
          widgetButton('log', () {
            log('current state value: ${counterRead.state}');
          }),

          Consumer(
            builder: (context, ref, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<NumberType>(
                      value: ref.watch(NumberProvider),
                      items: [
                        for (int i = 0; i < NumberType.values.length; i++)
                          DropdownMenuItem(
                            value: NumberType.values[i],
                            child: Text(
                              NumberType.values[i].name,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        if (value != null)
                          ref.read(NumberProvider.notifier).state = value;
                      }),
                  Text(ref.read(NumberProvider.notifier).state.name)
                ],
              );
            },
          )
          // Expanded(
          //   child: Consumer(
          //     builder: (context, ref, child) {
          //       final products = ref.watch(productsProvider);

          //       return ListView.builder(
          //         itemCount: products.length,
          //         itemBuilder: (context, index) {
          //           final product = products[index];
          //           return ListTile(
          //             title: Text(product.name),
          //             subtitle: Text('${product.price} \$'),
          //           );
          //         },
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
