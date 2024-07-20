import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:testmobile/model/gamenews.dart';
import 'package:testmobile/sreen/sort/cubit/sort_cubit.dart';
import 'package:testmobile/sreen/sort/cubit/sort_state.dart';

import '../../api/api.dart';
import '../../enum/LoadStatus.dart';
import '../home/card.dart';

class Sortnew extends StatelessWidget {
  const Sortnew({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SortCubit(context.read<Api>())..getNewGame(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Sort by New"),
          ),
          body: BlocBuilder<SortCubit, SortState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.gamenews.length,
                  itemBuilder: (context, index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(state.gamenews[index].mainImage!),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(state.gamenews[index].title!,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child:
                                Text(state.gamenews[index].shortDescription!),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: HtmlWidget(state.gamenews[index].articleContent!),
                          ),
                        ]);
                  },
                ),
              );
            },
          ),
        ));
  }
}
//  Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(article.mainImage!),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(article.title!,
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(article.shortDescription!),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8.0),
//               child: Divider(),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text('Article Details',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child:
//                   Text(article.articleContent!, style: TextStyle(fontSize: 16)),
//             ),
//           ],
//         ),
