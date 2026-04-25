import 'package:flutter/material.dart';
import 'package:kotoka_app/core/theme/tokens.dart';

// =============================================================================
// KotokaTextField — branded text input.
// brand-100 background, brand-600 focus border, body text style.
// No hardcoded colors or sizes — all values from tokens.dart.
// =============================================================================

class KotokaTextField extends StatefulWidget {
  const KotokaTextField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.autofocus = false,
    this.enabled = true,
  });

  final TextEditingController? controller;

  /// i18n hint text — pass AppLocalizations.of(context)!.someKey as a param.
  final String? hintText;

  final IconData? prefixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  /// When non-null the field renders in error state.
  final String? errorText;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool autofocus;
  final bool enabled;

  @override
  State<KotokaTextField> createState() => _KotokaTextFieldState();
}

class _KotokaTextFieldState extends State<KotokaTextField> {
  late final FocusNode _focusNode;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()
      ..addListener(() {
        setState(() => _hasFocus = _focusNode.hasFocus);
      });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;

    final borderColor = hasError
        ? KColors.error400
        : _hasFocus
            ? KColors.brand600
            : Colors.transparent;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: KMotion.fast,
          decoration: BoxDecoration(
            color: widget.enabled ? KColors.brand100 : KColors.neutral100,
            borderRadius: KRadius.md,
            border: Border.all(
              color: borderColor,
              width: _hasFocus || hasError ? 1.5 : 1.0,
            ),
          ),
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            obscureText: widget.obscureText,
            autofocus: widget.autofocus,
            enabled: widget.enabled,
            style: KTypography.getStyle(KTextStyle.body, locale)
                .copyWith(color: KColors.neutral900),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: KTypography.getStyle(KTextStyle.body, locale)
                  .copyWith(color: KColors.neutral500),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: _hasFocus ? KColors.brand600 : KColors.neutral500,
                      size: KSpacing.sp20,
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(
                vertical: KSpacing.sp12,
                horizontal: KSpacing.sp16,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: KSpacing.sp4),
          Text(
            widget.errorText!,
            style: KTypography.getStyle(KTextStyle.caption, locale)
                .copyWith(color: KColors.error400),
          ),
        ],
      ],
    );
  }
}
