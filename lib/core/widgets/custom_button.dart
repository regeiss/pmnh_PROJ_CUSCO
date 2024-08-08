import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomButton extends StatelessWidget {
  /// [title] argument is required
  const CustomButton({
    super.key,
    this.title,
    this.onPressed,
    this.titleStyle,
    this.backgroundColor = Colors.green,
    this.shape,
    this.width = 140,
    this.height = 50,
    this.loading = false,
    this.isDisabled = true,
    this.icon,
    this.elevation = 0,
    this.gap = 17,
    this.splashColor,
  });

  final String? title;
  final Widget? icon;
  final double gap;
  final double elevation;
  final VoidCallback? onPressed;
  final TextStyle? titleStyle;
  final Color backgroundColor;
  final ShapeBorder? shape;
  final double width;
  final double height;
  final bool loading;
  final bool isDisabled;
  final Color? splashColor;

  ShapeBorder get _shape => shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(11));
  BoxConstraints get _constraints => BoxConstraints.tightFor(width: width, height: height);
  Color get _splashColor => splashColor != null ? splashColor! : Colors.black.withOpacity(0.3);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      clipBehavior: Clip.antiAlias,
      color: isDisabled ? Colors.red.withOpacity(.6) : backgroundColor,
      shape: _shape,
      elevation: elevation,
      shadowColor: Colors.red,
      child: InkWell(
        splashColor: _splashColor,
        onTap: isDisabled || loading
            ? null
            : () async {
                FocusScope.of(context).unfocus();
                await HapticFeedback.heavyImpact();
                onPressed?.call();
              },
        child: ConstrainedBox(
          constraints: _constraints,
          child: Ink(
              decoration: ShapeDecoration(
                shape: _shape,
                color:
                    isDisabled ? Colors.red.withOpacity(.6) : backgroundColor,
              ),
              child: loading
                  ? const Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                    )
                  : (title != null)
                      ? Center(
                          child: Text(
                            title!,
                            style: titleStyle ??
                                const TextStyle(
                                    color: Colors.white, fontSize: 18),
                          ),
                        )
                      : Container()),
        ),
      ),
    );
  }
}
