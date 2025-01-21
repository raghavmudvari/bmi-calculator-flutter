import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink, // Set AppBar color to pink
          foregroundColor: Colors.white, // Set text/icon color to white
        ),
      ),
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();
  var result='';
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('bmi calculator'),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w800
                ),),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in kg'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in feet'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in inch'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(onPressed: (){
                  var wt= wtController.text.toString();
                  var ft=ftController.text.toString();
                  var inch=inController.text.toString();

                  if(wt!=''&& ft!="" && inch!=""){
                    //bmi calculation
                    var iwt=int.parse(wt);
                    var ift=int.parse(ft);
                    var iinch=int.parse(inch);

                    var tInch= ift*12+iinch;
                    var cm=tInch*2.54;
                    var m=cm/100;
                    var bmi=iwt/(m*m);

                   setState(() {
                     result='your total BMI is ${bmi.toStringAsFixed(2)} ';
                   });

                  }
                  else{
                    setState(() {
                      result='fill all the required datas';
                    });

                  }
                }, child: Text('Calculate ')),
                SizedBox(height: 12,),
                Text(result,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
        ),
      )
      );
  }
}
