import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rebh_el_a5era/shared/constants/strings.dart';
import '../constants/my_colors.dart';
Widget dividerSeparator() => Divider(
  thickness: 0.3,
  color: MyColors.dark,
);

Widget azkarContainer({context,image,route,isDataExist=true}) {
  return   Padding(
    padding:EdgeInsets.symmetric(
      horizontal: //.1*width screen
      0.05*MediaQuery.of(context).size.width,
    ),
    child: InkWell(
      onTap: (){
        if(isDataExist){
          Navigator.pushNamed(context, route);
        }
        else{
          showToast2(msg: 'coming soon', state: ToastStates.ERROR);
        }
      },
      child: Container(
        height: 0.1*MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * .9,
        decoration: BoxDecoration(
          //circular edges with radius 10
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
enum ToastStates { SUCCESS, ERROR, WARNING }

Color toastColor(ToastStates state) {
  switch (state) {
    case ToastStates.SUCCESS:
      return MyColors.rightPlay;
    case ToastStates.ERROR:
      return MyColors.centerPause;
    case ToastStates.WARNING:
      return Colors.yellow;
  }
}
//show toast using flutter toast
void showToast2({
  required String msg,
  required ToastStates state,
  double fontSize = 16,
  int seconds = 4,
}) {
  BotToast.showText(
      text: msg,
      duration: Duration(seconds: seconds),
      contentColor: toastColor(state),
      clickClose: true,
    //  align: Alignment(0, -0.9)
  );
}

Widget divider() => Divider(
  color: Colors.grey[300],
  height: 20,
  thickness: 0.5,
  indent: 0,
  endIndent: 0,
);
Widget buildIconWithNumber({
  required bool condition,
  number,
  icon,
  iconColor,
  double size = 30,
  double radius = 12,
  double fontSize = 13,
  VoidCallback? onPressed,
  alignment = const Alignment(1.6, -0.8),
}) =>
    Column(
      children: [
        Stack(
          alignment: alignment,
          children: [
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: iconColor,
                size: size,
              ),
            ),
            if (condition)
              CircleAvatar(
                radius: radius,
                backgroundColor: MyColors.secondary,
                child: Text(
                  number.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ],
    );

Text iconText(text) => Text(
  text,
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
  ),
);

Widget backButton(context) => Row(children: [
  IconButton(
    icon: Icon(
      Icons.arrow_back,
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  ),
  Text(
    "Back",
    style: TextStyle(
      color: MyColors.secondary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
]);
Widget defaultFormField2({
  required context,
  TextEditingController? controller,
  dynamic hintText,
  dynamic labelText,
  IconData? prefix,
  int maxLines = 1,
  String? initialValue,
  TextInputType? keyboardType,
  Function(String)? onSubmit,
  onChange,
  onTap,
  required String? Function(String?) validate,
  bool isPassword = false,
  bool enabled = true,
  IconData? suffix,
  suffixPressed,
  MaterialColor? cursorColor,
}) =>
    Container(
      child: TextFormField(
        cursorColor: cursorColor,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
        textAlign: TextAlign.start,
        onFieldSubmitted: onSubmit,
        enabled: enabled,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        textCapitalization: TextCapitalization.words,
        textAlignVertical: TextAlignVertical.center,
        style: Theme.of(context).textTheme.bodyText1,
        initialValue: initialValue,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          hintText: hintText,
          labelText: labelText,
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.grey.shade300)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.grey.shade300)),
          prefixIcon: Icon(
            prefix,
            color: Colors.blueAccent,
          ),
          prefixStyle: TextStyle(color: Colors.blueAccent),
          suffixStyle: TextStyle(color: Colors.blueAccent),
          suffixIcon: suffix != null
              ? IconButton(
              onPressed: suffixPressed,
              icon: Icon(suffix, color: Colors.blueAccent))
              : null,
        ),
      ),
    );
Widget defaultButton({
  required VoidCallback onTap,
  required String text,
  double? width = 400,
}) =>
    Container(
      height: 50,
      width: width,
      child: MaterialButton(
        color: Colors.blueAccent,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: onTap,
        child: Text(
          '$text',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );