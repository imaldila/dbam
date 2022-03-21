import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants.dart';
import '../../../models/evident.dart';

class EvidentImages extends StatelessWidget {
  const EvidentImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Evident>(
      builder: (context, providerEvident, child) {
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: kPadding / 2,
            crossAxisSpacing: kPadding / 2,
          ),
          itemCount: providerEvident.evidentCount + 1,
          itemBuilder: (context, index) {
            return index == providerEvident.evidentCount
                ? InkWell(
                    onTap: () => providerEvident.chooseImages(),
                    child: DottedBorder(
                      dashPattern: [10, 10],
                      borderType: BorderType.RRect,
                      radius: Radius.circular(kPadding * 2),
                      padding: EdgeInsets.all(kPadding * 2),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Icon(Icons.add),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: (() {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(AppLocalizations.of(context)!.alertTitle),
                          content:
                              Text(AppLocalizations.of(context)!.alertContent),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                providerEvident.clearImage(index);
                                Navigator.pop(context, 'OK');
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kPadding * 2),
                        color: Colors.white,
                        image: DecorationImage(
                            image: FileImage(providerEvident.evidents[index]),
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
