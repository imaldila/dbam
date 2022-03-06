import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/models/counter.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/../constants.dart';
import 'my_label_form.dart';
import 'my_materials_form.dart';
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
  final oldOTHERController = TextEditingController();
  final newOTHERController = TextEditingController();
  final dropcoreController = TextEditingController();
  final socController = TextEditingController();
  final preconn50Controller = TextEditingController();
  final preconn80Controller = TextEditingController();
  final sClampController = TextEditingController();
  final clampHookController = TextEditingController();
  final otpController = TextEditingController();
  final preksoController = TextEditingController();
  final rosetController = TextEditingController();
  final trayCableController = TextEditingController();
  final patchcoreController = TextEditingController();
  final rj45Controller = TextEditingController();
  final cableUTPController = TextEditingController();
  final adapterController = TextEditingController();
  final splitter2Controller = TextEditingController();
  final splitter4Controller = TextEditingController();
  final splitter8Controller = TextEditingController();

  @override
  void dispose() {
    oldONTController.dispose();
    newONTController.dispose();
    oldSTBController.dispose();
    newSTBController.dispose();
    oldOTHERController.dispose();
    newOTHERController.dispose();
    dropcoreController.dispose();
    cableUTPController.dispose();
    socController.dispose();
    preconn50Controller.dispose();
    preconn80Controller.dispose();
    sClampController.dispose();
    clampHookController.dispose();
    otpController.dispose();
    preksoController.dispose();
    rosetController.dispose();
    trayCableController.dispose();
    patchcoreController.dispose();
    rj45Controller.dispose();
    adapterController.dispose();
    splitter2Controller.dispose();
    splitter4Controller.dispose();
    splitter8Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextData textData = context.watch<TextData>();
    final Counter counter = context.watch<Counter>();

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
                  oldTitle: AppLocalizations.of(context)!.oldONT,
                  newTitle: AppLocalizations.of(context)!.newONT,
                  oldChanged: textData.getOldONT,
                  newChanged: textData.getNewONT,
                  oldController: oldONTController,
                  newController: newONTController,
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'STB')
                MyNTEForm(
                  oldTitle: AppLocalizations.of(context)!.oldSTB,
                  newTitle: AppLocalizations.of(context)!.newSTB,
                  oldChanged: textData.getOldSTB,
                  newChanged: textData.getNewSTB,
                  oldController: oldSTBController,
                  newController: newSTBController,
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'OTHER')
                MyNTEForm(
                  oldTitle: AppLocalizations.of(context)!.oldOTHER,
                  newTitle: AppLocalizations.of(context)!.newOTHER,
                  oldChanged: textData.getOldOTHER,
                  newChanged: textData.getNewOTHER,
                  oldController: oldOTHERController,
                  newController: newOTHERController,
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'Dropcore')
                MyLabelForm(
                  label: 'Dropcore',
                  controller: dropcoreController,
                  onChanged: textData.getDropcore,
                  units: 'Meter',
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
                  categoryData.categories[i].label == 'S-Clamp')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getSclamp,
                  controller: sClampController,
                  remove: () {
                    counter.sClamp > 0 ? counter.decSclamp() : 0;
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
                  categoryData.categories[i].label == 'OTP')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getOTP,
                  controller: otpController,
                  remove: () {
                    counter.otp > 0 ? counter.decOTP() : 0;
                    otpController.text = counter.otp.toString();
                  },
                  add: () {
                    counter.incOTP();
                    otpController.text = counter.otp.toString();
                  },
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'Prekso')
               MyLabelForm(
                  label: 'Prekso',
                  controller: preksoController,
                  onChanged: textData.getPrekso,
                  units: 'Meter',
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
                  categoryData.categories[i].label == 'Cable UTP')
                MyLabelForm(
                  label: 'Cable UTP',
                  controller: cableUTPController,
                  onChanged: textData.getCableUTP,
                  units: 'Meter',
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
                  categoryData.categories[i].label == 'Adapter')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getAdapter,
                  controller: adapterController,
                  remove: () {
                    counter.adapter > 0 ? counter.decAdapter() : 0;
                    adapterController.text = counter.adapter.toString();
                  },
                  add: () {
                    counter.incAdapter();
                    adapterController.text = counter.adapter.toString();
                  },
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'Splitter 1:2')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getSplitter2,
                  controller: splitter2Controller,
                  remove: () {
                    counter.splitter2 > 0 ? counter.decSplitter2() : 0;
                    splitter2Controller.text = counter.splitter2.toString();
                  },
                  add: () {
                    counter.incSplitter2();
                    splitter2Controller.text = counter.splitter2.toString();
                  },
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'Splitter 1:4')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getSplitter4,
                  controller: splitter4Controller,
                  remove: () {
                    counter.splitter4 > 0 ? counter.decSplitter4() : 0;
                    splitter4Controller.text = counter.splitter4.toString();
                  },
                  add: () {
                    counter.incSplitter4();
                    splitter4Controller.text = counter.splitter4.toString();
                  },
                )
              else if (categoryData.categories[i].isSelected &&
                  categoryData.categories[i].label == 'Splitter 1:8')
                MyMaterialsForm(
                  title: categoryData.categories[i].label,
                  onChanged: counter.getSplitter8,
                  controller: splitter8Controller,
                  remove: () {
                    counter.splitter8 > 0 ? counter.decSplitter8() : 0;
                    splitter8Controller.text = counter.splitter8.toString();
                  },
                  add: () {
                    counter.incSplitter8();
                    splitter8Controller.text = counter.splitter8.toString();
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
