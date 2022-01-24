import 'package:d_bam/constants.dart';
import 'package:d_bam/models/category_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyMaterialsForm extends StatelessWidget {
  MyMaterialsForm({
    Key? key,
    this.title,
    this.onChanged,
    this.controller,
    this.counting,
    this.counterText,
    this.remove,
    this.add,
  }) : super(key: key);

  final String? title;
  final String? counting;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? counterText;
  final Function()? remove;
  final Function()? add;

  @override
  Widget build(BuildContext context) {
    // final counter = context.read<CategoryData>();
    return Padding(
      padding: const EdgeInsets.only(left: kPadding),
      child: Row(
        children: [
          Text(
            title ?? '',
            style: kTextStyle16Bold,
          ),
          Spacer(),
          TextButton(
            onPressed: remove,
            child: Icon(
              Icons.remove,
              color: kIcColour,
            ),
          ),
          SizedBox(
            width: 15,
            child: AbsorbPointer(
              child: TextFormField(
                decoration: InputDecoration(border: InputBorder.none),
                controller: controller,
                onChanged: onChanged,
                style: kTextStyle14,
              ),
            ),
          ),
          TextButton(
            onPressed: add,
            child: Icon(
              Icons.add,
              color: kIcColour,
            ),
          ),
          Text('/ Pcs')
        ],
      ),
    );
  }
}

//  counter.counter != 0
//                   ? TextButton(
//                       onPressed: remove,
//                         // (counter.counter > 0 ? counter.decrement() : 0);
//                         // // controller!.text =
//                         // //     context.read<CategoryData>().counter.toString();
//                         // print(context.read<CategoryData>().counter);
                      
//                       child: Icon(
//                         Icons.remove,
//                         color: kIcColour,
//                       ),
//                     )
//                   : Container(),

// 

//  return Consumer<CategoryData>(
//       builder: (context, categoryData, child) => Padding(
//         padding: const EdgeInsets.only(left: kPadding),
//         child: Row(
//           children: [
//             Text(
//               title!,
//               style: kTextStyle16Bold,
//             ),
//             Spacer(),
//             TextButton(
//               onPressed: () => categoryData.updateDecrement,
//               child: Icon(
//                 Icons.remove,
//                 color: kIcColour,
//               ),
//             ),
//             // for (int i = 0; i < categoryData.categoryCount; i++)
//             Container(
//               width: 50,
//               child: Stack(
//                 children: [
//                   Material(
//                     elevation: 8,
//                     borderRadius: BorderRadius.circular(16),
//                     shadowColor: Colors.white,
//                     child: Container(
//                       // height: size.height / 15.5,
//                       decoration: kStyleBoxDecoration,
//                     ),
//                   ),
//                   AbsorbPointer(
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter some text';
//                         }
//                         return null;
//                       },
//                       controller: controller,
//                       onChanged: onChanged,
//                       textCapitalization: TextCapitalization.characters,
//                       textInputAction: TextInputAction.done,
//                       decoration: InputDecoration(
//                         counterText: counterText,
//                         enabledBorder: kStyleBorder,
//                         border: kStyleBorder,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             TextButton(
//               onPressed: () => categoryData.updateIncrement,
//               child: Icon(
//                 Icons.add,
//                 color: kIcColour,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );