import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/widgets/my_materials_form.dart';
import 'package:d_bam/widgets/my_text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'my_adrdess_form.dart';
import 'my_nte_form.dart';

class MyCategoriesForm extends StatefulWidget {
  MyCategoriesForm({
    Key? key,
  }) : super(key: key);

  @override
  State<MyCategoriesForm> createState() => _MyCategoriesFormState();
}

class _MyCategoriesFormState extends State<MyCategoriesForm> {
  final oldONTController = TextEditingController();
  final newONTController = TextEditingController();

  @override
  void dispose() {
    oldONTController.dispose();
    newONTController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextData myProvider = context.read<TextData>();
    return Consumer<CategoryData>(
      builder: (context, categoryData, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < categoryData.categoryCount; i++)
            if (categoryData.categories[i].isSelected &&
                categoryData.categories[i].label == 'ONT')
              MyNTEForm(
                oldTitle: 'Old ONT',
                newTitle: 'New ONT',
                oldChanged: myProvider.getOldONT,
                newChanged: myProvider.getNewONT,
                oldController: oldONTController,
                newController: newONTController,
              )
            else if (categoryData.categories[i].isSelected &&
                categoryData.categories[i].label == 'STB')
              MyNTEForm(
                oldTitle: 'Old STB',
                newTitle: 'New STB',
              )
            else if (categoryData.categories[i].isSelected &&
                categoryData.categories[i].label == 'SD WAN')
              MyNTEForm(
                oldTitle: 'Old SDWan',
                newTitle: 'New SDWan',
              )
            else if (categoryData.categories[i].isSelected &&
                categoryData.categories[i].label == 'Dropcore')
              MyTextForm()
            else if (categoryData.categories[i].isSelected)
              MyMaterialsForm(
                title: categoryData.categories[i].label,
              )
            else
              Container(),
          SizedBox(
            height: kPadding,
          ),
        ],
      ),
    );
  }
}
