import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SizeSelector extends StatefulWidget {
  final List<String> sizes;
  final void Function(String)? onSelected;
  final String? initialSelected;

  const SizeSelector({
    super.key,
    required this.sizes,
    this.onSelected,
    this.initialSelected,
  });

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.initialSelected ?? widget.sizes.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.sizes.map((size) {
        final bool isSelected = size == selectedSize;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = size;
            });
            if (widget.onSelected != null) {
              widget.onSelected!(size);
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.grey.shade300,
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              size,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}