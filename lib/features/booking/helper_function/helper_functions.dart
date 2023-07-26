// import 'package:intl/intl.dart';
//
// import '../domain/entities/session.dart';
//
//  filtterByDate(List<Session> session) {
//   Map<String, List<Session>> map =  putDataToMap();
//   for(Session s in session){
//     if(map.containsKey(s.date)){
//       map[s.date]?.add(s);
//     }else {
//       map[s.date!] = [];
//       map[s.date]?.add(s);
//     }
//   }
//   return map;
// }
//
// putDataToMap(){
//   Map<String, List<Session>> map = {} ;
//   var startOfCurrentWeek = DateTime.now();
//   for (int index = 0; index < 6; index++) {
//     DateTime addDate = startOfCurrentWeek.add(Duration(days: (index)));
//     index + 1;
//     var s = DateFormat('yyyy-MM-dd').format(addDate);
//     map[s] = [];
//   }
//   return map;
// }