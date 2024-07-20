import 'package:flutter/material.dart';
import 'package:testmobile/sreen/detail/detail.dart';

class card extends StatelessWidget {
  
  final String imageUrl;
  final String title;
  final int id;
 const card({Key? key,required this.imageUrl,required this.title, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenwith = MediaQuery.of(context).size.width;
    return Row(
       children: [
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,MaterialPageRoute(builder: (context)=> Details(id: id, imageUr: imageUrl)),
            );
          },
          child:  Container(
            width: screenwith*0.35,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(
                 imageUrl
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child:  Text(title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        ),
       
       ],
       
    );
  }
}