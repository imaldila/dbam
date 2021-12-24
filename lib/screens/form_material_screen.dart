import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class FormMaterial extends StatefulWidget {
  FormMaterial({Key? key}) : super(key: key);

  @override
  State<FormMaterial> createState() => _FormMaterialState();
}

class _FormMaterialState extends State<FormMaterial> {
  bool isSelected = false;
  final List<String> _filters = <String>[];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<CategoryData>(
      builder: (context, categoryData, child) => Scaffold(
        backgroundColor: kBgColour,
        appBar: buildAppBar(context),
        //This is not finish !!!
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: kHorPadding,
                ),
                itemCount: categoryData.categoryCount,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: FittedBox(
                        fit: BoxFit.none,
                        child: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(16),
                          shadowColor: Colors.white,
                          child: Container(
                            decoration: kStyleBoxDecoration,
                            padding: EdgeInsets.all(kPadding),
                            height: size.height / 14.5,
                            child: Text(categoryData.categories[index].label,
                                style: kTextStyle16Bold),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // FilterChip(
                //     selected:
                //         _filters.contains(categoryData.categories[1].label),
                //     label: Text(categoryData.categories[1].label),
                //     onSelected: (bool selected) {
                //       setState(() {
                //         isSelected = !isSelected;
                //         // if (selected) {
                //         //   _filters.add(categoryData.categories[1].label);
                //         // } else {
                //         //   _filters.removeWhere((String name) {
                //         //     return name == categoryData.categories[1].label;
                //         //   });
                //         // }
                //         print(selected);
                //       });
                //     }),
              ),
            ),
            Divider(),
            Visibility(
              visible: categoryData.categories[1].isSelected,
              child: Text('asdas'),
            ),
            Visibility(
                visible: categoryData.categories[2].isSelected,
                child: Text('asd12321as')),
            SizedBox(
              height: kPadding,
            ),
            BottonRounded(
              title: 'Next',
              onPressed: () {
                print(categoryData.categories[1].label);
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 64,
      backgroundColor: kBgColour,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icons/ic_left.svg',
            color: kIcColour,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        'Material Form',
        style: kTextStyle20Bold,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorPadding),
          child: CircleAvatar(
            foregroundColor: Colors.red,
            backgroundColor: kBgColour,
            child: Image.asset(
              'assets/images/logo1.png',
              fit: BoxFit.contain,
            ),
            radius: 24,
          ),
        ),
      ],
      shadowColor: kBgColour,
    );
  }
}

class ActorFilterEntry {
  const ActorFilterEntry(this.name, this.initials);
  final String name;
  final String initials;
}

class CastFilter extends StatefulWidget {
  const CastFilter({Key? key}) : super(key: key);

  @override
  State createState() => CastFilterState();
}

class CastFilterState extends State<CastFilter> {
  final List<ActorFilterEntry> _cast = <ActorFilterEntry>[
    const ActorFilterEntry('Aaron Burr', 'AB'),
    const ActorFilterEntry('Alexander Hamilton', 'AH'),
    const ActorFilterEntry('Eliza Hamilton', 'EH'),
    const ActorFilterEntry('James Madison', 'JM'),
    const ActorFilterEntry('Aasd Madison', 'JM'),
    const ActorFilterEntry('Jamgasdases Madison', 'JM'),
  ];
  final List<String> _filters = <String>[];

  Iterable<Widget> get actorWidgets sync* {
    for (final ActorFilterEntry actor in _cast) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          avatar: CircleAvatar(child: Text(actor.initials)),
          label: Text(actor.name),
          selected: _filters.contains(actor.name),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(actor.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == actor.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Wrap(
          children: actorWidgets.toList(),
        ),
        Text('Look for: ${_filters.join(', ')}'),
      ],
    );
  }
}
