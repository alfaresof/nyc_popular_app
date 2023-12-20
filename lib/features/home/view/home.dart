import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nyc_popular_app/features/home/domain/controller.dart';
import 'package:nyc_popular_app/features/home/domain/state.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    final controller = ref.read(homeProvider.notifier);
    controller.getNyc(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(homeProvider.notifier);
    final state = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('NY Times Most Popular'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              controller.setPeriod(value);
              controller.getNyc(context);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text('1'),
              ),
              const PopupMenuItem(
                value: 7,
                child: Text('7'),
              ),
              const PopupMenuItem(
                value: 30,
                child: Text('30'),
              )
            ],
          )
        ],
      ),
      body: state.status == HomeStatus.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              itemCount: state.resultModel.results!.length,
              itemBuilder: (context, index) {
                final model = state.resultModel.results![index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const CircleAvatar(),
                    title: Text(
                      model.title ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Column(
                      children: [
                        Text(
                          model.byline ?? '',
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.date_range),
                                Text(DateFormat.yMMMd().format(
                                    model.publishedDate ?? DateTime.now())),
                              ],
                            ),
                            Text(model.type ?? '')
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
