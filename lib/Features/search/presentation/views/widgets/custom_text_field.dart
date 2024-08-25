import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
    this.onSubmitted,
    required this.label,
    this.textEditingController,
    this.onPressedIcon,
  });
  final void Function(String)? onSubmitted;
  final String label;
  final TextEditingController? textEditingController;
  final void Function()? onPressedIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide()),
        label: Text(label),
        suffixIcon: IconButton(
          onPressed: onPressedIcon,
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 18,
          ),
          color: Colors.white.withOpacity(.8),
        ),
      ),
    );
  }
}
