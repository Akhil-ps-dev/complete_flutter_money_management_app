import 'package:flutter/material.dart';
import 'package:flutter_money_magement_app/db/category/transation/category_db.dart';
import 'package:flutter_money_magement_app/db/category/transation/transation_db.dart';
import 'package:flutter_money_magement_app/models/category/category_models.dart';
import 'package:flutter_money_magement_app/models/transation/transation_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    CategoryDB.instance.refreshUi();
    return ValueListenableBuilder(
        valueListenable: TransactionDB.instance.transationListNotifier,
        builder: (BuildContext ctx, List<TransationModel> newList, Widget? _) {
          return ListView.separated(
//VALUE..
            padding: const EdgeInsets.all(10),

            itemBuilder: (context, index) {
              final _value = newList[index];
              return Slidable(
                key: Key(_value.id!),
                startActionPane: ActionPane(motion: ScrollMotion(), children: [
                  SlidableAction(
                    onPressed: (ctx) {
                      TransactionDB.instance.deleteTransation(_value.id!);
                    },
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ]),
                child: Card(
                    elevation: 0,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 50,
                        child: Text(
                          parseDate(
                            _value.date,
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: _value.type == CatrgoryType.income
                            ? Colors.green
                            : Colors.red,
                      ),
                      title: Text(
                        '₹ ${_value.amount}',
                        style: TextStyle(color: Colors.red),
                      ),
                      subtitle: Text(_value.category.name),
                    )),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: newList.length,
          );
        });
  }

  String parseDate(DateTime date) {
    //  final _date =
    return DateFormat.MMMd().format(date);
    // final _splitDate = _date.split('');
    // return
    //'${_splitDate.last}\n${_splitDate.first}';

    // return '${date.day}\n${date.month}';
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_money_magement_app/components/colors.dart';
// import 'package:flutter_money_magement_app/widgets/text_size.dart';

// class TransactionScreen extends StatefulWidget {
//   const TransactionScreen({Key? key}) : super(key: key);

//   @override
//   _TransactionScreenState createState() => _TransactionScreenState();
// }

// class _TransactionScreenState extends State<TransactionScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: AppColor.backGroundColor,
//       body: Container(
//         height: h,
//         child: Stack(
//           children: [
//             _headSection(),
//             _listBills(),
//           ],
//         ),
//       ),

//     );
//   }

//   _headSection() {
//     return Container(
//       height: 310,
//       child: Stack(
//         children: [
//           _mainBackgorund(),
//           _curveImage(),
//           _buttonContainer(),
//         ],
//       ),
//     );
//   }

//   _mainBackgorund() {
//     return Positioned(
//       //   bottom: 10,
//       //  left: 0,
//       child: Container(
//         //  height: 300,
// //width: MediaQuery.of(context).size.width,
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 fit: BoxFit.cover, image: AssetImage("images/background.png"))),
//       ),
//     );
//   }

//   _curveImage() {
//     return Positioned(
//       left: 0,
//       right: -2,
//       bottom: 0,
//       child: Container(
//         height: MediaQuery.of(context).size.height * 0.1,
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 fit: BoxFit.cover, image: AssetImage("images/curve.png"))),
//       ),
//     );
//   }

//   _buttonContainer() {
//     return Positioned(
//         bottom: 5,
//         right: 50,
//         child: GestureDetector(
//           onTap: () {
//             showModalBottomSheet<dynamic>(
//                 isScrollControlled: true,
//                 barrierColor: Colors.transparent,
//                 backgroundColor: Colors.transparent,
//                 context: context,
//                 builder: (BuildContext bc) {
//                   return Container(
//                     height: MediaQuery.of(context).size.height - 240,
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           bottom: 0,
//                           child: Container(
//                             color: Color(0xFFeef1f4).withOpacity(0.7),
//                             width: MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height - 310,
//                           ),
//                         ),
//                         Positioned(
//                           top: 10,
//                           right: 50,
//                           child: Container(
//                             width: 60,
//                             height: 250,
//                             decoration: BoxDecoration(
//                               color: AppColor.mainColor,
//                               borderRadius: BorderRadius.circular(29),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 });
//           },
//           child: Container(
//               height: 60,
//               width: 60,
//               decoration: BoxDecoration(
//                   image: DecorationImage(image: AssetImage("images/lines.png")),
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 15,
//                       offset: Offset(0, 1),
//                       color: Color(0xFF11324d).withOpacity(0.2),
//                     ),
//                   ])),
//         ));
//   }

//   _listBills() {
//     return Positioned(
//       top: 331,
//       right: 0,
//       left: 0,
//       bottom: 0,
//       child: MediaQuery.removePadding(
//         removeTop: true,
//         context: context,
//         child: ListView.builder(
//           itemCount: 3,
//           itemBuilder: (_, index) {
//             return Container(
//               margin: const EdgeInsets.only(top: 6, right: 10),
//               height: 130,
//               width: MediaQuery.of(context).size.width - 20,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Color(0xFFd8dbe0),
//                       offset: Offset(1, 1),
//                       blurRadius: 20.0,
//                       spreadRadius: 10),
//                 ],
//               ),
//               child: Container(
//                 margin: const EdgeInsets.only(top: 10, left: 18),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               height: 60,
//                               width: 60,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   border: Border.all(
//                                     width: 3,
//                                     color: Colors.grey,
//                                   ),
//                                   image: const DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image: AssetImage("images/brand1.png"))),
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Power',
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       color: AppColor.mainColor,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(
//                                   'ID: 232342',
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       color: AppColor.idColor,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedText(
//                           text: "Pay on 20th",
//                           color: AppColor.green,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: 80,
//                               height: 30,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(30),
//                                   color: AppColor.selectBackground),
//                               child: Center(
//                                 child: Text(
//                                   'select',
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       color: AppColor.selectColor),
//                                 ),
//                               ),
//                             ),
//                             Expanded(child: Container()),
//                             Text(
//                               '\$12.34',
//                               style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w800,
//                                   color: AppColor.selectColor),
//                             ),
//                             Text(
//                               'Due in 3 days',
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w700,
//                                   color: AppColor.idColor),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Container(
//                           height: 35,
//                           width: 5,
//                           decoration: BoxDecoration(
//                               color: AppColor.halfOval,
//                               borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(30),
//                                 bottomLeft: Radius.circular(30),
//                               )),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   // _payButton() {
//   //   return Positioned(
//   //       bottom: 20,
//   //       child: LargeButtons(
//   //         text: "Pay all bills",
//   //         textColor: Colors.white,
//   //       ));
//   // }
// }
