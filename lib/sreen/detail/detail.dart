import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      create: (context) => DetailCubit(context.read<Api>())..getProduct(id),
      child: MainDetail(imageUrl: imageUr),
    );
  }
}

class MainDetail extends StatelessWidget {
  final String imageUrl;
  const MainDetail({super.key, required this.imageUrl});

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
                      if (state.product.images != null) 
                        Image.network(imageUrl),
                      Text(state.product.title ?? 'No title available', style: Theme.of(context).textTheme.headline5),
                      Text('Price: \$${state.product.price ?? 'N/A'}', style: Theme.of(context).textTheme.headline6),
                      const SizedBox(height: 10),
                      Text('Description:', style: Theme.of(context).textTheme.headline6),
                      Text(state.product.description ?? 'No description available'),
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
