import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextFormBuilder extends HookWidget {
  final String initialValue;
  final bool enabled;
  final String hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final bool obscureText;
  final FocusNode? focusNode, nextFocusNode;
  final VoidCallback? submitAction;
  final FormFieldValidator<String> validateFunction;
  final void Function(String)? onChange;
  final void Function(String) onSaved;
  final IconData prefix;
  final IconData? suffix;

  const TextFormBuilder(
      {required this.prefix,
      this.suffix,
      required this.initialValue,
      required this.enabled,
      required this.hintText,
      this.textInputType,
      this.controller,
      required this.textInputAction,
      this.nextFocusNode,
      this.focusNode,
      this.submitAction,
      this.obscureText = false,
      required this.validateFunction,
      required this.onSaved,
      this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final error = useState<String?>(null);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Theme(
            data: ThemeData(
              primaryColor: Theme.of(context).accentColor,
              accentColor: Theme.of(context).accentColor,
            ),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              initialValue: initialValue,
              enabled: enabled,
              onChanged: (val) {
                error.value = validateFunction(val);
                onSaved(val);
              },
              style: const TextStyle(
                fontSize: 15,
              ),
              key: key,
              controller: controller,
              obscureText: obscureText,
              keyboardType: textInputType,
              validator: validateFunction,
              onSaved: (val) {
                error.value = validateFunction(val);
                onSaved(val!);
              },
              textInputAction: textInputAction,
              focusNode: focusNode,
              onFieldSubmitted: (term) {
                if (nextFocusNode != null) {
                  focusNode!.unfocus();
                  FocusScope.of(context).requestFocus(nextFocusNode);
                } else {
                  submitAction!();
                }
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    prefix,
                    size: 15,
                  ),
                  suffixIcon: Icon(
                    suffix,
                    size: 15,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: border(context),
                  enabledBorder: border(context),
                  focusedBorder: focusBorder(context),
                  errorStyle: const TextStyle(height: 0, fontSize: 0)),
            ),
          ),
          const SizedBox(height: 5),
          Visibility(
            visible: error.value != null,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                error.value.toString(),
                style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder border(BuildContext context) {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
      borderSide: BorderSide(
        color: Colors.white,
        width: 0,
      ),
    );
  }

  OutlineInputBorder focusBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
      borderSide: BorderSide(
        color: Theme.of(context).accentColor,
        width: 1,
      ),
    );
  }
}
