import 'package:flutter/material.dart';
import 'package:task_management_app/utilities/constants/constants.dart';
import 'package:task_management_app/utilities/default_colors.dart';
import 'package:task_management_app/utilities/styles/spacers.dart';
import 'package:task_management_app/utilities/styles/styles.dart';
import 'package:task_management_app/utilities/widget_constants.dart';

const Duration _animationDuration = Duration(milliseconds: 200);

class AppExpansionTile extends StatefulWidget {
  const AppExpansionTile({
    required this.onExpansionChanged,
    this.title,
    this.hintText,
    this.helperText,
    this.subtitle,
    this.titleStyle,
    this.hintTextStyle,
    this.helperTextStyle,
    this.displayedTextTextStyle,
    this.icon,
    this.isExpanded,
    this.contentPadding,
    this.padding,
    this.displayedText,
    this.children = const <Widget>[],
    this.childrenAlignment = CrossAxisAlignment.center,
    Key? key,
  }) : super(key: key);

  final ValueChanged<bool>? onExpansionChanged;
  final String? title;
  final String? hintText;
  final String? helperText;
  final String? displayedText;
  final TextStyle? titleStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? helperTextStyle;
  final TextStyle? displayedTextTextStyle;
  final Widget? icon;
  final Widget? subtitle;
  final bool? isExpanded;
  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  final List<Widget> children;
  final CrossAxisAlignment childrenAlignment;

  @override
  State<AppExpansionTile> createState() => AppExpansionTileState();
}

class AppExpansionTileState extends State<AppExpansionTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _easeInAnimation;
  late Animation<double> _iconTurns;
  late bool _isExpanded;

  @override
  void initState() {
    _controller = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );

    _easeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _iconTurns = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(_easeInAnimation);

    _isExpanded = widget.isExpanded ?? false;

    if (_isExpanded) _controller.value = 1.0;

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AppExpansionTile oldWidget) {
    if (oldWidget.isExpanded != widget.isExpanded &&
        (_controller.status != AnimationStatus.forward || _controller.status != AnimationStatus.reverse)) {
      _isExpanded = widget.isExpanded ?? false;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }

    if (widget.isExpanded == true) {
      _isExpanded = widget.isExpanded ?? false;
      _controller.forward();
    }

    super.didUpdateWidget(oldWidget);
  }

  void expand() => _setExpanded(true);

  void collapse() => _setExpanded(false);

  void toggle() => _setExpanded(!_isExpanded);

  void _setExpanded(bool isExpanded) {
    if (_isExpanded != isExpanded) {
      setState(() {
        _isExpanded = isExpanded;
        if (_isExpanded) {
          _controller.forward();
        } else {
          _controller.reverse().then<void>((value) => setState(() {})); // Rebuild without widget.children.
        }
        PageStorage.of(context).writeState(context, _isExpanded);
      });

      if (widget.onExpansionChanged != null) widget.onExpansionChanged?.call(_isExpanded);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title ?? emptyString,
            style: widget.titleStyle ?? TextStyles.label3,
          ),
          const VerticalSpace(6.0),
          AnimatedBuilder(
            animation: _controller.view,
            builder: (context, child) {
              return Container(
                padding: widget.contentPadding ??
                    EdgeInsets.only(
                      left: defaultHalfPadding,
                      right: defaultHalfPadding,
                      top: 14.0,
                      bottom: _isExpanded ? defaultQuarterPadding : 14.0,
                    ),
                decoration: defaultFieldDecoration,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: toggle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (widget.helperText != null)
                                  Text(
                                    widget.helperText!,
                                    style: widget.helperTextStyle ?? TextStyles.label4,
                                  ),
                                Text(
                                  widget.displayedText ?? widget.hintText ?? emptyString,
                                  style: widget.displayedTextTextStyle ??
                                      widget.hintTextStyle ??
                                      TextStyles.body1.copyWith(color: mediumGrey),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                          RotationTransition(
                            turns: _iconTurns,
                            child: widget.icon ?? const Icon(Icons.arrow_downward),
                          )
                        ],
                      ),
                    ),
                    if (widget.subtitle != null && _isExpanded) widget.subtitle!,
                    ClipRRect(
                      child: Align(
                        heightFactor: _easeInAnimation.value,
                        child: child,
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Column(
              crossAxisAlignment: widget.childrenAlignment,
              children: widget.children,
            ),
          ),
        ],
      ),
    );
  }
}
