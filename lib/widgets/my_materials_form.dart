import 'package:d_bam/constants.dart';
import 'package:d_bam/models/category.dart';
import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/models/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyMaterialsForm extends StatelessWidget {
  MyMaterialsForm(
      {Key? key,
      this.title,
      this.onChanged,
      this.controller,
      this.counting,
      this.counterText})
      : super(key: key);

  final String? title;
  final String? counting;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final String? counterText;

  @override
  Widget build(BuildContext context) {
    final counter = context.read<Counter>();
    return Padding(
      padding: const EdgeInsets.only(left: kPadding),
      child: Row(
        children: [
          Text(
            title!,
            style: kTextStyle16Bold,
          ),
          Spacer(),
          counter.count != 0
              ? TextButton(
                  onPressed: () =>
                      (counter.count > 0 ? counter.decrement() : 0),
                  child: Icon(
                    Icons.remove,
                    color: kIcColour,
                  ),
                )
              : Container(),
          Text(
            // counting ?? '',

            '${context.watch<Counter>().count}',
            style: kTextStyle14,
          ),
          TextButton(
            onPressed: () {
              counter.increment();
              // context.read<CategoryData>().addInc;
            },
            child: Icon(
              Icons.add,
              color: kIcColour,
            ),
          ),
        ],
      ),
    );
  }
}

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