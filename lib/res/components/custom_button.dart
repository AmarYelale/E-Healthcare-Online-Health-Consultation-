import 'package:e_healthcare_application/consts/consts.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  const CustomButton(
      {super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth - 60,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, shape: const StadiumBorder()),
        onPressed: onTap,
        child: buttonText.text.make(),
      ),
    );
  }
}
