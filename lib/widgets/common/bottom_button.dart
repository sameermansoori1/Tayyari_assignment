import 'package:flutter/material.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    this.title = '   ',
    required this.onTap,
    this.enabled = true,
    this.child,
    this.color,
    this.textColor,
    this.hasBorder = false,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final bool enabled;
  final Widget? child;
  final Color? color;
  final Color? textColor;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 40,
        width: 150,
        child: InkWell(
          borderRadius: BorderRadius.circular(kButtonCornerRadius),
          onTap: enabled == false ? null : onTap,
          child: Ink(
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child ??
                  Center(
                    child: Text(
                      title,
                      style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor??kOnSurfaceTextColor),
                    ),
                  ),
            ),
            decoration: BoxDecoration(
              border: hasBorder ? Border.all(color: Colors.black) : null,
                borderRadius: BorderRadius.circular(20),
                color:color?? Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
