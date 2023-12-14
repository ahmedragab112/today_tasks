import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String type;
  final Function function;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.type,
    required this.function,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        child: isLoading == true
            ? const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                type,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
      ),
    );
  }
}
