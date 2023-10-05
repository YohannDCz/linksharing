import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles.dart';

class TextFieldForm extends StatefulWidget {
  final String iconLink;
  final bool isError;
  final String hintText;
  final String errorText;

  const TextFieldForm({
    super.key,
    required this.iconLink,
    required this.isError,
    required this.hintText,
    required this.errorText,
  });

  @override
  State<TextFieldForm> createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  final TextEditingController _controller = TextEditingController();
  bool _isFilled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _isFilled = _controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: _isFilled,
          fillColor: Colors.white,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SvgPicture.asset(widget.iconLink),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.isError ? red : graphiteLight,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.isError ? red : lavander,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintText: widget.hintText,
          hintStyle: bodyM.merge(
            // ignore: prefer_const_constructors
            _isFilled
                ? const TextStyle(color: graphite)
                : widget.isError
                    ? const TextStyle(color: red)
                    : const TextStyle(color: graphiteLight),
          ),
          suffixIcon: widget.isError
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 12.0,
                  ),
                  child: Text(widget.errorText, style: bodyS.merge(const TextStyle(color: red))),
                )
              : null,
        ),
      ),
    );
  }
}
