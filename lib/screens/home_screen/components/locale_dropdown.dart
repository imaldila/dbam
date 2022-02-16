import 'package:d_bam/constants.dart';
import 'package:d_bam/l10n/l10n.dart';
import 'package:d_bam/providers/local_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LocaleDropdown extends StatelessWidget {
  const LocaleDropdown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
        builder: (context, localeProvider, snapShot) {
      var lang = localeProvider.locale ?? Localizations.localeOf(context);
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            AppLocalizations.of(context)!.selectLanguage,
            style: kTextStyle14,
          ),
          const SizedBox(
            width: kPadding,
          ),
          DropdownButton(
            underline: Text(''),
            borderRadius: BorderRadius.circular(16),
            value: lang,
            items: L10n.all
                .map(
                  (e) => DropdownMenuItem(
                    child: _title(e.languageCode),
                    value: e,
                  ),
                )
                .toList(),
            onChanged: (Locale? val) {
              localeProvider.setLocale(val!);
            },
          ),
        ],
      );
    });
  }

  _title(String val) {
    switch (val) {
      case 'en':
        return Row(
          children: [
            Container(
                height: 20,
                width: 20,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    ('assets/images/flag_en.png'),
                  ),
                )),
            SizedBox(
              width: 8,
            ),
            Text('EN'),
          ],
        );
      case 'id':
        return Row(
          children: [
            Container(
              height: 20,
              width: 20,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/flag_id.png'),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text('ID'),
          ],
        );
      default:
        return Row(
          children: [
            Container(
                height: 20,
                width: 20,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    ('assets/images/flag_en.png'),
                  ),
                )),
            SizedBox(
              width: 8,
            ),
            Text('EN'),
          ],
        );
    }
  }
}
