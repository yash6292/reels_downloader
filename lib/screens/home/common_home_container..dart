import 'package:flutter/material.dart';

class CommonHomeContainer extends StatelessWidget {
  final String? img;
  final String? text;
  final Function()? onTap;
  const CommonHomeContainer({Key? key, this.img, this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              img ?? '',
              height: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 15),
            Text(
              text ?? "",
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            )
          ],
        ),
      ),
    );
  }
}
