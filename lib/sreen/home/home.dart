import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmobile/sreen/home/card.dart';
import 'package:testmobile/sreen/sort/sortbyplatfom.dart';
import 'package:testmobile/sreen/sort/sortnew.dart';

import '../../cubit/main_cubit.dart';
import '../../cubit/main_state.dart';
import '../../enum/LoadStatus.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Game List'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SortbyPlatfom(title: 'Sort by Platform')),
                );
              },
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                           Sortnew()),
                  );
                },
                icon: const Icon(Icons.new_label)),
            IconButton(
                onPressed: () {
                  context.read<MainCubit>().getListGame();
                },
                icon: const Icon(Icons.sort)),
          ],
        ),
        body: RefreshIndicator(
          child: Center(
            child: Card(
              child: BlocBuilder<MainCubit, MainState>(
                builder: (context, state) {
                  if (LoadStatus.Loading == state.loadStatus) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (LoadStatus.Done == state.loadStatus) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return card(
                            imageUrl: state.products[index].thumbnail!,
                            title: state.products[index].title!,
                            id: state.products[index].id!,
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: Text("Error"));
                  }
                },
              ),
            ),
          ),
          onRefresh: () async {
            context.read<MainCubit>().getListGame();
          },
        ));
  }
}
