import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:untitledcalculator/button.dart';
import 'package:untitledcalculator/data/buttons.dart';
import 'package:untitledcalculator/data/components.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  var value='';
  var answer='';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey.shade200,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Mehmoodulhassan'),
              accountEmail: Text(
                'mehmood123@gmail.com',
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/kid.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text('logout'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            )
          ],
        ),
      ),
      appBar: AppBar(backgroundColor: Colors.purple.shade300,
        title: Center(child: Text('calculator App',style: TextStyle(fontSize: 27),)),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                        child: Row(
                      children: [
                        Icon(
                          Icons.feedback_outlined,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text('Feeds')
                      ],
                    )),
                    PopupMenuItem(
                        child: Row(
                      children: [
                        Icon(
                          Icons.history,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text('History')
                      ],
                    )),
                    PopupMenuItem(
                        child: Row(
                      children: [
                        Icon(
                          Icons.clear_all_rounded,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        InkWell(onTap:
                        (){value='';}


                            ,child: Text('Clear screen'))
                      ],
                    ))
                  ])
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [Column(
            children: [
              Container(
                height: 100,width: 350,
                decoration: BoxDecoration(color: lBlue.withOpacity(0.6),borderRadius: 
                BorderRadius.circular(15),border: Border.all(
                  color: Colors.lightGreenAccent,width: 3
                ),boxShadow: [BoxShadow(blurRadius:10,blurStyle: BlurStyle.outer
                ,color: Colors.red )],

                ),
                child: Column(
                  children: [
                    Text(value.toString(),style: TextStyle(
                      fontSize: 27,fontWeight: FontWeight.bold,
                    ),
                    ),
                Text(answer.toString(),style: TextStyle(
                  fontSize: 27,fontWeight: FontWeight.bold,
                ),
                ),])
              )
            ],
          ),SizedBox(height: 30,),
            Column(
              children: [
                Row(
                  children: [
                    buttons(title: 'AC',colors: Colors.green,onpress:(){
                      value='';
                      answer='';
                      setState(() {

                      });
                    } ,),
                    buttons(title: 'DEL',colors: Colors.red,onpress:(){
                      value=value.substring(0,value.length-1);
                      answer='';
                      setState(() {

                      });
                    }),
                    buttons(title: '%',onpress:(){
hassan();
                    }),
                    buttons(title: '/',onpress:(){
                      value+='/';
                      setState(() {

                      });
                    }),
                  ],
                ),
                Row(
                  children: [
                    buttons(title: '7',onpress:(){
                      value+='7';
                      setState(() {

                      });
                    }
                    ),
                    buttons(title: '8',onpress:(){
                      value+='8';
                      setState(() {

                      });
                    }),
                    buttons(title: '9',onpress:(){
                      value+='9';
                      setState(() {

                      });
                    }),
                    buttons(title: '+',onpress:(){
                      value+='+';
                      setState(() {

                      });
                    }),
                  ],
                ),
                Row(
                  children: [
                    buttons(title: '4',onpress:(){
                      value+='4';
                      setState(() {

                      });
                    }),
                    buttons(title: '5',onpress:(){value+='5';
                    setState(() {

                    });}),
                    buttons(title: '6',onpress:(){value+='6';
                    setState(() {

                    });}),
                    buttons(title: '-',onpress:(){value+='-';
                    setState(() {

                    });}),
                  ],
                ),
                Row(
                  children: [
                    buttons(title: '1',onpress:(){value+='1';
                    setState(() {

                    });}),
                    buttons(title: '2',onpress:(){value+='2';
                    setState(() {

                    });}),
                    buttons(title: '3',onpress:(){value+='3';
                    setState(() {

                    });}),
                    buttons(title: '*',onpress:(){value+='*';
                    setState(() {

                    });}),
                  ],
                ),
                Row(
                  children: [
                    buttons(title: '0',onpress:(){
                      value+='0';
                      setState(() {

                      });
                    }),
                    buttons(title: '.',onpress:(){value+='.';
                    setState((){
                    });}),
                    buttons(title: ',',onpress:(){value+='';
                    setState(() {});}),
                    buttons(title: '=',onpress:(){
                      equalpress();
                    setState(() {});}),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
  void equalpress(){
    Parser p=Parser();
    Expression exp=p.parse(value);
    ContextModel cont=ContextModel();
    double evl=exp.evaluate(EvaluationType.REAL, cont);
    answer=evl.toString();
  }
  Future<void> hassan()async{
   await Future.delayed(Duration(seconds: 3));
    print('hello');

  }
}
