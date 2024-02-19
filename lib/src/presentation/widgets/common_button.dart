
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {

  final String name;
  final Function() onPressed;
  final bool isValid;

  CommonButton({
    super.key,
    required this.name,
    required this.onPressed,
    this.isValid = true
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
                color: isValid
                    ? Colors.green
                    : Colors.green.withOpacity(0.4)
            ),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
        backgroundColor: MaterialStateProperty.all(
            isValid
                ? Colors.green
                : Colors.green.withOpacity(0.4)
        ),
      ),
      child: Text(name, style: const TextStyle(color: Colors.white, fontSize: 18)),
      onPressed: onPressed,
    );
  }

}