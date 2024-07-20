import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:testmobile/enum/LoadStatus.dart';

import '../../api/api.dart';
import 'cubit/detail_cubit.dart';
import 'cubit/detail_state.dart';

class Details extends StatelessWidget {
  final int id;
  final String imageUr;
  const Details({super.key, required this.id, required this.imageUr});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailCubit>(
      create: (context) => DetailCubit(context.read<Api>())..getDetailGame(id),
      child: MainDetail(imageUrl: imageUr, id: id,),
    );
  }
}

class MainDetail extends StatelessWidget {
  final String imageUrl;
  final int id;
  const MainDetail({super.key, required this.imageUrl, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        
      ),
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          switch (state.loadStatus) {
            case LoadStatus.Loading:
              return const Center(child: CircularProgressIndicator());
            case LoadStatus.Error:
              return const Center(child: Text("Error loading product details."));
            case LoadStatus.Done:
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.game.gameUrl != null)
                        Image.network(state.game.thumbnail!, width: double.infinity, height: 200, fit: BoxFit.cover),
                      Text(state.game.title ?? 'No title available', style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: 8),
                      Text('Description:', style: Theme.of(context).textTheme.headlineMedium),
                      HtmlWidget( state.game.description ?? 'No description available'),
                      Text(state.game.shortDescription ?? 'No description available'),
                      const SizedBox(height: 8),
                      Text('Platform:', style: Theme.of(context).textTheme.headlineMedium),
                      Text(state.game.platform ?? 'No platform available'),
                      const SizedBox(height: 8),
                      Text('Developer:', style: Theme.of(context).textTheme.headlineMedium),
                      Text(state.game.developer ?? 'No developer available'),
                      const SizedBox(height: 8),
                      Text('Publisher:', style: Theme.of(context).textTheme.headlineMedium),
                      Text(state.game.publisher ?? 'No publisher available'),
                      const SizedBox(height: 8),
                      Text('Genre:', style: Theme.of(context).textTheme.headlineMedium),
                      Text(state.game.genre ?? 'No genre available'),
                      const SizedBox(height: 8),
                      Text('Release Date:', style: Theme.of(context).textTheme.headlineMedium),
                      Text(state.game.releaseDate ?? 'No release date available'),
                      Text("Shot Screens", style: Theme.of(context).textTheme.headlineMedium),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.game.screenshots!.length,
                          itemBuilder: (context, index) {
                            return Image.network(state.game.screenshots![index].image!);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            default:
              return const Center(child: Text("Unknown state"));
          }
        },
      ),
    );
  }
}

