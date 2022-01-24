import 'package:d_bam/models/category_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class MyCategoriesFilter extends StatelessWidget {
  const MyCategoriesFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryData>(
      builder: (context, categoryData, child) => Wrap(
        spacing: 8,
        children: [
          for (int i = 0; i < categoryData.categoryCount; i++)
            FilterChip(
              backgroundColor: kBgColour,
              elevation: 8,
              selectedColor: kBtnColour,
              labelStyle: categoryData.categories[i].isSelected
                  ? kTextStyle14White
                  : kTextStyle14,
              selected: categoryData.categories[i].isSelected,
              label: Text(categoryData.categories[i].label),
              onSelected: (selected) {
                categoryData.updateCategory(categoryData.categories[i]);
                // setState(() {
                //   categoryData.categories[i].isSelected = selected;
                // });
              },
            ),
        ],
      ),
    );
  }
}
