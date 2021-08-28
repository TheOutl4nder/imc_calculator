import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  
  bool isMale = false;
  var alturaController = TextEditingController();
  var pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular IMC'),
        backgroundColor: Colors.green,
      ),
      body: Container(margin: EdgeInsets.all(10),child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Ingrese sus datos para calcular el IMC')
            ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center ,children: [
              IconButton(onPressed: (){
                setState(()=>{
                  isMale = false
                });
                print(isMale);
              }, icon: Icon(Icons.female, color: isMale? Colors.black: Colors.blue,)),
              IconButton(onPressed: (){
                setState(()=>{
                  isMale = true
                });
                print(isMale);
              }, icon: Icon(Icons.male, color: isMale? Colors.blue: Colors.black,))
            ],),
            ListView(shrinkWrap: true, children: [
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: TextField(
                    controller: alturaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.square_foot, size: 30,),
                      labelText: "Ingresar altura (metros)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: TextField(
                    controller: pesoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.monitor_weight, size: 30,),
                      labelText: "Ingresar peso",
                      border: OutlineInputBorder(),
                      fillColor: Colors.green
                    ),
                  ),
                ),
              ),
            ],
            ),
            Align(
            child: MaterialButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Actualizando datos del clima")));
            }, child: 
            Text('Calcular', style: TextStyle(color: Colors.black)),)
          , alignment: Alignment.center,)
      ],)
      ));
  }
}