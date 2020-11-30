import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_cobros/app/components/inputs/number_input/numeric_decimal_formatter.dart';
import 'package:proyecto_cobros/app/components/inputs/number_input/numeric_formatter.dart';

import '../../../app_controller.dart';

class NumberInput extends StatefulWidget {
  final double numberValue;
  final String label;
  final String errorText;
  final ValueChanged<double> onChanged;
  final String hintText;
  final Widget icon;
  final int minLines;
  final int maxLines;
  final int maxLength;
  final bool enabled;
  final bool autoFocus;
  final FocusNode focusNode;
  final EdgeInsetsGeometry contentPadding;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final Function onSubmited;
  final int precision;

  const NumberInput({
    Key key,
    this.numberValue,
    @required this.label,
    this.errorText,
    this.onChanged,
    this.hintText,
    this.icon,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.enabled,
    this.autoFocus = false,
    this.focusNode,
    this.contentPadding,
    this.textInputAction,
    this.inputFormatters,
    this.onSubmited,
    this.precision = 0,
  }) : super(key: key);

  @override
  _NumberInputState createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  bool focado = false;
  String value = "0";

  TextEditingController controller;

  @override
  void initState() {
    focado = widget.autoFocus;
    controller = TextEditingController();
    alteraFormatacao();
    super.initState();
  }

  void alteraFormatacao() {
    NumberFormat f;

    if (widget.precision == 0) {
      f = new NumberFormat("#,###", 'es_PY');
    } else {
      f = new NumberFormat("#,##0.00", 'es_PY');
    }

    if (widget.numberValue == null) {
      value = "";
    } else {
      value = f.format(widget.numberValue);
    }

    if (value != '') {
      controller.value = controller.value.copyWith(
        text: value,
        selection:
            TextSelection(baseOffset: value.length, extentOffset: value.length),
        composing: TextRange.empty,
      );
    }
  }

  @override
  void didUpdateWidget(NumberInput oldWidget) {
    if (widget.precision != oldWidget.precision) {
      alteraFormatacao();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print(value);

    TextInputFormatter formatter;
    if (widget.precision == 0) {
      formatter = NumericFormatter();
    } else {
      formatter = NumericDecimalFormatter(
          decimalDigits: widget.precision, locale: "es_PY");
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            focado = hasFocus;
          });
        },
        child: TextFormField(
          controller: controller,
          inputFormatters: [formatter],
          onChanged: (value) {
            double val = 0.0;
            if (value.isEmpty) {
              widget.onChanged(0.0);
              return;
            }

            if (widget.precision == 0) {
              val = double.parse(value.replaceAll(".", ""));
            } else {
              String s = value.replaceAll(".", "");
              value = s.replaceAll(",", ".");
              val = double.parse(value);
            }

            widget.onChanged(val);
          },
          maxLength: widget.maxLength,
          minLines: widget.minLines, //Normal textInputField will be displayed
          maxLines: widget.maxLines, //
          enabled: widget.enabled, //
          autofocus: widget.autoFocus,
          focusNode: widget.focusNode,
          keyboardType: TextInputType.numberWithOptions(signed: false),
          textAlign: TextAlign.end,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onSubmited,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              errorText: (this.widget.errorText == null
                  ? null
                  : this.widget.errorText),
              contentPadding: widget.contentPadding ??
                  EdgeInsets.only(left: 20.0, right: 10),
              border: new OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
              hintText: widget.hintText,
              filled: true,
              labelText: widget.label,
              suffixIcon: widget.icon,
              fillColor: Colors.white,
              hoverColor: Colors.grey),
        ),
      ),
    );
  }
}
