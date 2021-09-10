// import 'dart:io';
// //import 'dart:js';
// import 'package:csv/csv.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:mess/csvOperations.dart' as csv;
// import 'package:path_provider/path_provider.dart';

// Note(run this): flutter pub add csv path_provider csv

//
//
// main()  {
//   loadCsvFromStorage() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowedExtensions: ['csv'],
//       type: FileType.custom,
//     );
//     String path = result!.files.first.path;
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) {
//           return LoadCsvDataScreen(path: path);
//         },
//       ),
//     );
//   }

// main () {
//   // var data[2][2] = new List.filled(2, String, growable: false);
//   // List<String, String> data;
//
//
// }
var data = [
  ['PES1UG20CS305', 'password305', 'Mess 1'],
  ['PES1UG20CS315', 'password315', 'Mess 2'],
  ['PES1UG20CS007', 'password007', 'Mess 3'],
  ['PES1UG20CS069', 'password069', 'Mess 2'],
  ['PES1UG20CS420', 'password420', 'Mess 1'],
];

String checkCredentials(String? srn) {
  for(int i = 0; i < data.length; i++)  {
    if (data[i][0] == srn)  {
      // if(data[i][1] == password)  {
      //   return true;
      // }
      // else
      //   return false;
      return data[i][1];
    }
  }
  return '';
}

String getMess(String? srn) {
  for(int i = 0; i < data.length; i++)  {
    if (data[i][0] == srn)  {
      return data[i][2];
    }
  }
  return '';
}