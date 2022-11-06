import 'package:flutter/material.dart';

class CustomRadioListTile<T> extends StatelessWidget {
  const CustomRadioListTile({ Key? key ,required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    this.title,}) : super(key: key);

  final T value;
  final T groupValue;
  final IconData leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
   final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _customRadioButton,
            const SizedBox(width: 12),
            if (title != null) title,
          ],
        ),
      ),
    );
  }


   Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        // color: isSelected ? Colors.blue : null,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? Colors.lightBlue : Colors.blue[100]!,
          width: 2,
        ),
      ),
      child: /*Text(
        leading,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[600]!,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      )*/Icon(leading,color: isSelected ? Colors.blue : Colors.blue[100]!,),
    );
  }
}