import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final void Function(String?) onChanged;


  const CustomDropdown({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFF1F1F1),
      ),
      child: DropdownButton(
        isExpanded: true,
        borderRadius: BorderRadius.circular(10),
        elevation: 30,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
          size: 40,
        ),
        value: value,
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Center(child: Text(e))))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
