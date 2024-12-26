import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/painting.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int bal = 10;
  int wager = 0;
  final myController = TextEditingController();

  bool checkBal(int method, int wager, int bal){
    if (method*wager <= bal){
      return true;
    }
    else{
      return false;
    }
  }

  List<int> genNums(){
    List<int> numlist = [];
    var randint = Random();
    for (int i =0; i< 4; i++){
      numlist.add(randint.nextInt(6)+1);
    }
    return numlist;
  }

  bool winCheck(List<int> numbers, int method){
    print("checking params");
   for (int i=1;i<7;i++) {
     int count = 0;
     for (int k = 0; k < 4; k++) {
       if (numbers[k]==i){
         count +=1;
         if (count == method) {
           return true;
         }
         }
       else{
         continue;
       }
       }
     }
   return false;
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Wagerer"),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 25,
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(
              width: 300,
              child: TextField(
                controller: myController,
                decoration: new InputDecoration(labelText: "Enter your wager: "),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              ),
            ),

            SizedBox(
              height: 200,
              child: Text("Current balance is: $bal Coin(s)"),
            ),

            ElevatedButton.icon(onPressed: () {           //2 ALIKE
              setState(() {
                wager = int.parse(myController.text);
                myController.clear();
                List<int> nums = genNums();
                if (checkBal(2, wager, bal)) {
                  Fluttertoast.showToast(
                      msg: 'Wagered ${2 * wager} coins', fontSize: 18);

                  if (winCheck(nums, 2)) {
                    bal += 2 * wager;
                    Fluttertoast.showToast(
                        msg: 'Congrats! You won ${2 * wager} coins', fontSize: 18);
                    Fluttertoast.showToast(
                        msg: 'Your numbers were: $nums', fontSize: 18);
                  }
                  else {
                    Fluttertoast.showToast(
                        msg: 'LOL You lost ${2 * wager} coins Hard Luck',
                        fontSize: 18);
                    Fluttertoast.showToast(
                        msg: 'Your numbers were: $nums', fontSize: 18);
                    bal -= 2 * wager;
                  }
                }
                  else{
                  Fluttertoast.showToast(
                      msg: 'Insufficient Balance', fontSize: 18);
                }
                wager = 0;
              });
            },
                icon: Icon(Icons.four_k_plus),
                label: Text('2 Alike')),

            ElevatedButton.icon(onPressed: () {                   //3 ALIKE
              setState(() {
                wager = int.parse(myController.text);
                myController.clear();
                List<int> nums = genNums();
                if (checkBal(3, wager, bal)) {
                  Fluttertoast.showToast(
                      msg: 'Wagered ${3 * wager} coins', fontSize: 18);

                  if (winCheck(nums, 3)) {
                    bal += 3 * wager;
                    Fluttertoast.showToast(
                        msg: 'Congrats! You won ${3 * wager} coins', fontSize: 18);
                    Fluttertoast.showToast(
                        msg: 'Your numbers were: $nums', fontSize: 18);
                  }
                  else {
                    Fluttertoast.showToast(
                        msg: 'LOL You lost ${3 * wager} coins Hard Luck',
                        fontSize: 18);
                    Fluttertoast.showToast(
                        msg: 'Your numbers were: $nums', fontSize: 18);
                    bal -= 3 * wager;
                  }
                }
                else{
                  Fluttertoast.showToast(
                      msg: 'Insufficient Balance', fontSize: 18);
                }
                wager = 0;
              });
            },
                icon: Icon(Icons.three_k_plus),
                label: Text('3 Alike')),

            ElevatedButton.icon(onPressed: () {                  //4 ALIKE
                  setState(() {
                    wager = int.parse(myController.text);
                    myController.clear();
                    List<int> nums = genNums();
                    if (checkBal(4, wager, bal)) {
                      Fluttertoast.showToast(
                          msg: 'Wagered ${4 * wager} coins', fontSize: 18);

                      if (winCheck(nums, 4)) {
                        bal += 4 * wager;
                        Fluttertoast.showToast(
                            msg: 'Congrats! You won ${4 * wager} coins', fontSize: 18);
                        Fluttertoast.showToast(
                            msg: 'Your numbers were: $nums', fontSize: 18);
                      }
                      else {
                        Fluttertoast.showToast(
                            msg: 'LOL You lost ${4 * wager} coins Hard Luck',
                            fontSize: 18);
                        Fluttertoast.showToast(
                            msg: 'Your numbers were: $nums', fontSize: 18);
                        bal -= 4 * wager;
                      }
                    }
                    else{
                      Fluttertoast.showToast(
                          msg: 'Insufficient Balance', fontSize: 18);
                    }
                    wager = 0;
                  });
                },
                    icon: Icon(Icons.four_k_plus),
                    label: Text('4 Alike'))

          ],
        ),
      )
    );
  }
}

