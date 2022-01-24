import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/models/counter.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/widgets/my_dropcore_form.dart';
import 'package:d_bam/widgets/my_materials_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
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
  final oldSTBController = TextEditingController();
  final newSTBController = TextEditingController();
  final oldSDWANController = TextEditingController();
  final newSDWANController = TextEditingController();
  final dropcoreController = TextEditingController();
  final preconn50Controller = TextEditingController();
  final preconn80Controller = TextEditingController();

  // @override
  // void initState() {
  //   preconn50Controller.text = '${context.read<Counter>().preconn50}';
  //   preconn80Controller.text = '${context.read<Counter>().preconn80}';
  //   rj45Controller.text = '${context.read<Counter>().rj45}';
  //   sClampController.text = '${context.read<Counter>().sClamp}';
  //   clampHookController.text = '${context.read<Counter>().clampHook}';
  //   rosetController.text = '${context.read<Counter>().roset}';
  //   trayCableController.text = '${context.read<Counter>().trayCable}';
  //   patchcoreController.text = '${context.read<Counter>().patchCore}';
  //   cableUTPController.text = '${context.read<Counter>().cableUTP}';

  //   super.initState();
  // }

  //TODO: Dispose all controller !..
  @override
  void dispose() {
    oldONTController.dispose();
    newONTController.dispose();
    oldSTBController.dispose();
    newSTBController.dispose();
    oldSDWANController.dispose();
    newSDWANController.dispose();
    dropcoreController.dispose();
    // preconn50Controller.dispose();
    // preconn80Controller.dispose();
    // rj45Controller.dispose();
    // sClampController.dispose();
    // clampHookController.dispose();
    // rosetController.dispose();
    // socController.dispose();
    // trayCableController.dispose();
    // patchcoreController.dispose();
    // cableUTPController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextData textData = context.read<TextData>();
    final Counter counter = context.read<Counter>();

    return Consumer<CategoryData>(
      builder: (context, categoryData, child) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < categoryData.categoryCount; i++)
              if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'ONT')
                MyNTEForm(
                  oldTitle: 'Old ONT',
                  newTitle: 'New ONT',
                  oldChanged: textData.getOldONT,
                  newChanged: textData.getNewONT,
                  oldController: oldONTController,
                  newController: newONTController,
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'STB')
                MyNTEForm(
                  oldTitle: 'Old STB',
                  newTitle: 'New STB',
                  oldChanged: textData.getOldSTB,
                  newChanged: textData.getNewSTB,
                  oldController: oldSTBController,
                  newController: newSTBController,
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'SD WAN')
                MyNTEForm(
                  oldTitle: 'Old SDWan',
                  newTitle: 'New SDWan',
                  oldChanged: textData.getOldSDWAN,
                  newChanged: textData.getNewSDWAN,
                  oldController: oldSDWANController,
                  newController: newSDWANController,
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'Dropcore')
                MyDropcoreForm(
                  controller: dropcoreController,
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'Preconn 50M')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getPreconn50,
                  controller: preconn50Controller,
                  remove: () {
                    counter.preconn50 > 0 ? counter.decPreconn50() : 0;
                    preconn50Controller.text = counter.preconn50.toString();
                  },
                  add: () {
                    counter.incPreconn50();
                    preconn50Controller.text = counter.preconn50.toString();
                  },
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'Preconn 80M')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getPreconn80,
                  controller: preconn80Controller,
                  remove: () {
                    counter.preconn80 > 0 ? counter.decPreconn80() : 0;
                    preconn80Controller.text = counter.preconn80.toString();
                  },
                  add: () {
                    counter.incPreconn80();
                    preconn80Controller.text = counter.preconn80.toString();
                  },
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'RJ 45')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getRJ45,
                  controller: rj45Controller,
                  remove: () {
                    counter.rj45 > 0 ? counter.decRJ45() : 0;
                    rj45Controller.text = counter.rj45.toString();
                  },
                  add: () {
                    counter.incRJ45();
                    rj45Controller.text = counter.rj45.toString();
                  },
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'S-Clamp')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getSclamp,
                  controller: sClampController,
                  remove: () {
                    counter.sClamp > 0 ? counter.decSclamp5() : 0;
                    sClampController.text = counter.sClamp.toString();
                  },
                  add: () {
                    counter.incSclamp();
                    sClampController.text = counter.sClamp.toString();
                  },
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'Clamp Hook')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getClampHook,
                  controller: clampHookController,
                  remove: () {
                    counter.clampHook > 0 ? counter.decClampHook() : 0;
                    clampHookController.text = counter.clampHook.toString();
                  },
                  add: () {
                    counter.incClampHook();
                    clampHookController.text = counter.clampHook.toString();
                  },
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'Roset')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getRoset,
                  controller: rosetController,
                  remove: () {
                    counter.roset > 0 ? counter.decRoset() : 0;
                    rosetController.text = counter.roset.toString();
                  },
                  add: () {
                    counter.incRoset();
                    rosetController.text = counter.roset.toString();
                  },
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'SOC')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getSOC,
                  controller: socController,
                  remove: () {
                    counter.soc > 0 ? counter.decSOC() : 0;
                    socController.text = counter.soc.toString();
                  },
                  add: () {
                    counter.incSOC();
                    socController.text = counter.soc.toString();
                  },
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'Tray Cable')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getTrayCable,
                  controller: trayCableController,
                  remove: () {
                    counter.trayCable > 0 ? counter.decTrayCable() : 0;
                    trayCableController.text = counter.trayCable.toString();
                  },
                  add: () {
                    counter.incTrayCable();
                    trayCableController.text = counter.trayCable.toString();
                  },
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'Patchcore')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getPatchcore,
                  controller: patchcoreController,
                  remove: () {
                    counter.patchCore > 0 ? counter.decPatchcore() : 0;
                    patchcoreController.text = counter.patchCore.toString();
                  },
                  add: () {
                    counter.incPatchcore();
                    patchcoreController.text = counter.patchCore.toString();
                  },
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'Cable UTP')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getCableUTP,
                  controller: cableUTPController,
                  remove: () {
                    counter.cableUTP > 0 ? counter.decCableUTP() : 0;
                    cableUTPController.text = counter.cableUTP.toString();
                  },
                  add: () {
                    counter.incCableUTP();
                    cableUTPController.text = counter.cableUTP.toString();
                  },
                )
              else
                Container(),
            SizedBox(
              height: kPadding,
            ),
          ],
        ),
      ),
    );
  }
}
