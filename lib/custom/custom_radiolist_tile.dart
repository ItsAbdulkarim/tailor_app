import 'package:flutter/material.dart';

class CustomRadioListTile extends StatelessWidget {
  final String value;
  final String title;
  final String? groupValue;
  final void Function(String?) onChanged;

  const CustomRadioListTile({
    Key? key,
    required this.value,
    required this.title,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      title: Text(title),
      fillColor: MaterialStateProperty.all(Colors.brown),
      contentPadding: EdgeInsets.zero,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      dense: true,
      tileColor: Colors.brown.shade200,
      groupValue: groupValue,
      onChanged: onChanged
    );
  }
}
