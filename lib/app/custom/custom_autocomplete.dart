import 'package:flutter/material.dart';
import 'custom_single_child_scroll_view.dart';
import '../theme/colors.dart';
import 'custom_text_form_field.dart';

class CustomAutoComplete<T extends Object> extends StatelessWidget {
  const CustomAutoComplete({
    super.key,
    required this.hintText,
    required this.optionsBuilder,
    this.displayStringForOption = RawAutocomplete.defaultStringForOption,
    this.onSelected,
    this.initialValue,
    this.onTap,
    this.textEditingController,
    this.focusNode,
    this.validator,
    this.readOnly = false,
    this.prefixIcon,
    this.onChanged,
  });

  final String hintText;
  final AutocompleteOptionsBuilder<T> optionsBuilder;
  final AutocompleteOptionToString<T> displayStringForOption;
  final AutocompleteOnSelected<T>? onSelected;
  final String? initialValue;
  final Function()? onTap;
  final Function(String)? onChanged;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final bool readOnly;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return RawAutocomplete<T>(
          textEditingController: textEditingController,
          focusNode: focusNode,
          initialValue: initialValue != null
              ? TextEditingValue(text: initialValue!)
              : null,
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return CustomTextFormField(
              onChanged: onChanged,
              hintText: hintText,
              controller: textEditingController,
              focusNode: focusNode,
              readOnly: readOnly,
              onTap: onTap,
              prefixIcon: prefixIcon,
              suffixIcon: const Icon(
                size: 24,
                Icons.arrow_drop_down_sharp,
                color: Colorz.main,
              ),
            );
          },
          optionsBuilder: optionsBuilder,
          displayStringForOption: displayStringForOption,
          optionsViewBuilder: (context, onSelected, options) {
            return _CustomAutocompleteOptions<T>(
              constraints: constraints,
              displayStringForOption: displayStringForOption,
              onSelected: onSelected,
              options: options,
            );
          },
          onSelected: (option) {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
            if (onSelected != null) {
              onSelected!(option);
            }
          },
        );
      },
    );
  }
}

class _CustomAutocompleteOptions<T extends Object> extends StatelessWidget {
  const _CustomAutocompleteOptions({
    super.key,
    required this.constraints,
    required this.displayStringForOption,
    required this.onSelected,
    required this.options,
  });

  final BoxConstraints constraints;
  final AutocompleteOptionToString<T> displayStringForOption;
  final AutocompleteOnSelected<T> onSelected;
  final Iterable<T> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, -5.0, 0.0),
      child: Material(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colorz.main,
            width: 0.2,
          ),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).viewInsets.bottom,
          ),
          width: constraints.biggest.width,
          child: CustomSingleChildScrollView(
            child: ListView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
              ),
              itemCount: options.length,
              itemBuilder: (BuildContext context, int index) {
                final T option = options.elementAt(index);
                return InkWell(
                  onTap: () {
                    onSelected(option);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 15.0,
                    ),
                    child: Text(
                      displayStringForOption(option),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colorz.main,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
