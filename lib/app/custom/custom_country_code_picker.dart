import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomCountryCodePicker extends StatelessWidget {
  const CustomCountryCodePicker({
    super.key,
    this.initialSelection,
    this.onChanged,
  });

  final String? initialSelection;
  final ValueChanged<CountryCode>? onChanged;
  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.of(context).platformBrightness;
    final Size displaySize = MediaQuery.of(context).size;
    return CountryCodePicker(
      padding: EdgeInsetsDirectional.zero,
      showFlag: false,
      barrierColor: Colors.black87,
      dialogSize: Size(displaySize.width * 0.8, displaySize.height * 0.7),
      boxDecoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Colorz.textWhite,
        ),
        borderRadius: BorderRadius.circular(8.0),
        gradient: const LinearGradient(
          colors: [
            Colorz.textWhite,
            Colorz.textWhite,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: theme == Brightness.light
                ? Colorz.textSecondary
                : Colorz.textWhite,
            fontWeight: FontWeight.normal,
          ),
      dialogTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colorz.textSecondary,
          ),
      searchStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.normal,
            color: Colorz.textSecondary,
          ),
      searchDecoration: const InputDecoration(
        prefixIconColor: Colorz.main,
      ),
      closeIcon: const Icon(
        Icons.close,
        color: Colorz.main,
      ),
      initialSelection: initialSelection,
      onChanged: onChanged,
    );
  }
}
