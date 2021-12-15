import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

enum DecoTypes { underline, border, none }

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.text,
    this.hintText = '',
    this.maxLength,
    required this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    this.onDetectionTyped,
    this.suffix,
    this.suffixIcon,
    this.decoType = DecoTypes.border,
    this.autofocus = false,
    this.focusNode,
    this.borderColor,
    this.errorText,
  }) : super(key: key);

  final String label;
  final String text;
  final Function(String) onChanged;
  final String hintText;
  final int? maxLength;
  final int minLines;
  final int maxLines;
  final Function(String)? onDetectionTyped;
  final Widget? suffix;
  final Widget? suffixIcon;
  final DecoTypes? decoType;
  final bool autofocus;
  final FocusNode? focusNode;
  final Color? borderColor;
  final String? errorText;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _textEditingController =
      TextEditingController(text: '');
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    _textEditingController.text = widget.text;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.label.isNotEmpty)
              Text(widget.label, style: Theme.of(context).textTheme.bodyText1),
            if (widget.maxLength != null)
              Text(
                '${widget.text.length}/${widget.maxLength}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Theme.of(context).hintColor),
              )
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _textEditingController,
          focusNode: focusNode,
          autofocus: widget.autofocus,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          inputFormatters: [LengthLimitingTextInputFormatter(widget.maxLength)],
          onChanged: widget.onChanged,
          minLines: widget.minLines,
          decoration: InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.symmetric(
              vertical: widget.decoType == DecoTypes.border ? 12 : 4,
              horizontal: widget.decoType == DecoTypes.border ? 16 : 2,
            ),
            hintText: widget.hintText,
            focusedBorder: widget.decoType == DecoTypes.none
                ? InputBorder.none
                : widget.decoType == DecoTypes.border
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: widget.borderColor ??
                              Theme.of(context).focusColor,
                        ),
                      )
                    : UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.borderColor ??
                              Theme.of(context).focusColor,
                        ),
                      ),
            errorText: widget.errorText,
            enabledBorder: widget.decoType == DecoTypes.none
                ? InputBorder.none
                : widget.decoType == DecoTypes.border
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color:
                              widget.borderColor ?? Theme.of(context).hintColor,
                        ),
                      )
                    : UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              widget.borderColor ?? Theme.of(context).hintColor,
                        ),
                      ),
            suffix: widget.suffix,
            suffixIcon: widget.suffixIcon ??
                (widget.text.isNotEmpty && focusNode.hasFocus
                    ? InkWell(
                        highlightColor: Colors.red,
                        onTap: () {
                          _textEditingController.text = '';
                          widget.onChanged('');
                          focusNode.requestFocus();
                        },
                        child: Icon(
                          Icons.clear,
                          color: Theme.of(context).hintColor,
                        ),
                      )
                    : null),
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 32,
              maxWidth: 32,
            ),
          ),
        ),
      ],
    );
  }
}
