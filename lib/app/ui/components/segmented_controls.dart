import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_x_starter_kit/app/data/models/menu_option_model.dart';

class SegmentedSelector extends StatelessWidget {
  SegmentedSelector({
    required this.menuOptions,
    required this.selectedOption,
    required this.onValueChanged,
  });

  final List<MenuOptionsModel> menuOptions;
  final ThemeMode selectedOption;
  final void Function(ThemeMode?) onValueChanged;

  @override
  Widget build(BuildContext context) {
    //if (Platform.isIOS) {}

    return CupertinoSlidingSegmentedControl<ThemeMode>(
      //thumbColor: Theme.of(context).primaryColor,
      groupValue: selectedOption,
      children: {
        for (var option in menuOptions)
          option.key: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(option.icon),
              const SizedBox(width: 6),
              Text(option.value),
            ],
          )
      },
      onValueChanged: onValueChanged,
    );
  }
}
