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
  num IMC_val = 0;

  _calcIMC(){
    num height = double.parse(alturaController.text);
    num weight = double.parse(pesoController.text);
    IMC_val = (weight / (height*height));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular IMC'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: ()=>{
            alturaController.text = "",
            pesoController.text = "",
            setState(()=>{})
          }, icon: Icon(Icons.delete_forever))
        ],
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
              _calcIMC();
              setState(() {});
              showDialog(context: context, builder: (context)=>AlertDialog(
                title: Text("Tu IMC: ${IMC_val.toStringAsFixed(2)}"),
                content: Column( mainAxisSize: MainAxisSize.min,children: [
                  Row(children: [
                    Text(isMale? "Tabla del IMC para hombres":"Tabla del IMC para mujeres")
                  ],),
                  Container(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                    Column(children: [
                      Row(children: [Text("Edad")],),
                      Row(children: [Text("16-17")],),
                      Row(children: [Text("18-18")],),
                      Row(children: [Text("19-24")],),
                      Row(children: [Text("25-34")],),
                      Row(children: [Text("35-44")],),
                      Row(children: [Text("45-54")],),
                      Row(children: [Text("55-64")],),
                      Row(children: [Text("65-90")],)

                    ],),
                    Container(width: 10,),
                    Column(children:[
                      Row(children: [Text("IMC ideal")],),
                      Row(children: [Text("19-24")],),
                      Row(children: [Text("19-24")],),
                      Row(children: [Text("19-24")],),
                      Row(children: [Text("20-25")],),
                      Row(children: [Text("21-26")],),
                      Row(children: [Text("22-27")],),
                      Row(children: [Text("23-28")],),
                      Row(children: [Text("25-30")],)

                    ],)
                  ],)
                ],
                ),
                actions: <Widget>[
                  MaterialButton(onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('Aceptar'),)
                ],
              ));
            }, child: 
            Text('Calcular', style: TextStyle(color: Colors.black)),)
          , alignment: Alignment.center,)
      ],)
      ));
  }
}