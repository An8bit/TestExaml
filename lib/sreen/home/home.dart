import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmobile/sreen/home/card.dart';

import '../../cubit/main_cubit.dart';
import '../../cubit/main_state.dart';
import '../../enum/LoadStatus.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
                        imageUrl: "https://i.imgur.com/${state.products[index].images![0].split('/').last}",
                        title: state.products[index].title!,
                        id: state.products[index].id!);
                  },
                ),
              );
            } else {
              return const Center(child: Text("Error"));
            }
          },
        ),
      ),
    );
  }
}
