import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

convertTimeStampMethod(Timestamp dateTime) {
  DateTime date = DateTime.parse(dateTime.toDate().toString());
  // add DateFormat What you want. Look at the below comment example
  //String formatedDate = DateFormat('dd-MMM-yyy').format(date);
  String formatedDate = DateFormat.yMMMMd().format(date);
  return formatedDate;
}
