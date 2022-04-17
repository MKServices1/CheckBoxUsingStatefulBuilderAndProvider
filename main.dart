import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<CheckProvider>(create: (context)=>CheckProvider()),

    ],child: const MaterialApp(home: Abc(),
    ),);
  }
}
class Abc extends StatefulWidget {
  const Abc({Key? key}) : super(key: key);

  @override
  State<Abc> createState() => _AbcState();
}

class _AbcState extends State<Abc> {
  @override
  Widget build(BuildContext context) {
    bool _isCheck=false;
    return Scaffold(
      key: UniqueKey(),
      body: Center(
          child: Consumer<CheckProvider>(
              builder: (context,checkProvider,child)=>Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


              const Text('USING STATEFUL BUILDER',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),

              ///STATEFUL BUILDER HAS LIMITATIONS, WE CAN't USED CHANGED VALUE OUTSIDE THE WIDGET
              StatefulBuilder(builder: (BuildContext context, StateSetter setState){
                return

                  CheckboxListTile(
                    value: _isCheck,
                    onChanged:(value){setState(() {
                      _isCheck=value!;
                      print('VALUE: ');
                      print(value);
                      print('IS CHECK: ');
                      print(_isCheck);
                    });},
                  title:Text('Pine Apple '),);
              }),

                  const Text('USING PROVIDER ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                  ...checkProvider.filter.map((isChecked) => CheckboxClass(Checkbox: isChecked, onChanged: (val){
                    checkProvider.selectFilter(isChecked, val);
                    print(isChecked);
                    print(val);
                  })).toList(),
                  
                  
                  const Text("SINGLE CHECKBOX ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                CheckboxListTile(title: const Text('REGULAR DRINK'),value: context.watch<CheckProvider>().select, onChanged: (val){
                  checkProvider.toggle(val!);
                  print(val);
                }),

            ],
          )),

      ),

    );
  }
}



