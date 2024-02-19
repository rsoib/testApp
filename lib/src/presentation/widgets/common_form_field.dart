import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String name;
  final Function? onChange;
  final String? errorText;
  final TextInputType keyboardType;
  final String? initialValue;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final TextEditingController textEditingController;

  const CustomFormField({
    super.key,
    required this.name,
    this.keyboardType = TextInputType.text,
    this.onChange,
    this.errorText,
    this.initialValue,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    required this.textEditingController
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
            textCapitalization: TextCapitalization.words,
            controller: textEditingController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: keyboardType,
            initialValue: initialValue,
            maxLength: maxLength,
            decoration: InputDecoration(
              hintText: name,
              errorText: errorText,
              suffixIcon: const Icon(Icons.location_searching, color: Colors.green,),
              hintStyle: const TextStyle(color: Color.fromRGBO(208, 208, 208, 1)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(234, 235, 236, 1),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(234, 235, 236, 1),
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),
            ),
            //onChanged: (name) => onChange(name)
        )
      ],
    );
  }

}