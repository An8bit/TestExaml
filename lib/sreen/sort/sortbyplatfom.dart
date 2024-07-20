import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmobile/sreen/sort/cubit/sort_cubit.dart';
import 'package:testmobile/sreen/sort/cubit/sort_state.dart';

import '../../api/api.dart';
import '../../enum/LoadStatus.dart';
import '../home/card.dart';

class SortbyPlatfom extends StatelessWidget {
  final String title;
  const SortbyPlatfom({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SortCubit(context.read<Api>())..getGamePlatform(),
      child: Scaffold(
      appBar: AppBar(
        title:  Text(title),
      ),
      body: RefreshIndicator(
        child: Center(
          child: Card(
            child: BlocBuilder<SortCubit, SortState>(
              builder: (context, state) {
                if (LoadStatus.Loading == state.loadStatus) {
                  return const Center(child: CircularProgressIndicator());
                } else if (LoadStatus.Done == state.loadStatus) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.gameplatform.length,
                      itemBuilder: (context, index) {
                        return card(
                          imageUrl: state.gameplatform[index].thumbnail!,
                          title: state.gameplatform[index].title!,
                          id: state.gameplatform[index].id!,
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
          
        },
      )
    ),
    );
  }
}
