import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager_app/util/constant.dart';

showToast(
  String msg,
) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: kPrimaryColor,
    textColor: kTextColor,
    fontSize: 16.0,
  );
}
