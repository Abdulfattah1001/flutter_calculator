import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController answerController= TextEditingController();
  TextEditingController questionController = TextEditingController();
  late double size;
  late double height;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
             color: Colors.black,
              padding: const EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    height: height * 0.15,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: TextField(
                      readOnly: true,
                      showCursor: true,
                      controller: answerController,
                      decoration:
                          const InputDecoration(
                            hintText: 'Answer here...',
                            border: InputBorder.none),
                    ),
                  ),
                  Container(
                    height: height * 0.15,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: TextField(
                      readOnly: true,
                      showCursor: false,
                      controller: questionController,
                      decoration:
                          const InputDecoration(border: InputBorder.none,
                          hintText: '0',
                          ),
                    ),
                  ),
                  Container(
                    height: height * 0.60,
                    decoration: const BoxDecoration(),
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            displayCell(text: 'C', color: Colors.white, bgColor: Colors.blue),
                            displayCell(text: '/', color: Colors.white, bgColor: Colors.blue),
                            displayCell(text: 'X', color: Colors.white, bgColor: Colors.blue),
                            displayCell(text: 'DEL', color: Colors.white, bgColor: Colors.greenAccent),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            displayCell(text: '7',color: Colors.white, bgColor: Colors.blue),
                            displayCell(text: '8',color: Colors.white, bgColor: Colors.blue),
                            displayCell(text: '9',color: Colors.white, bgColor: Colors.blue),
                            displayCell(text: '-',color: Colors.white, bgColor: Colors.orangeAccent),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            displayCell(text: '4',color: Colors.white, bgColor: Colors.blue),
                            displayCell(text: '5',color: Colors.white, bgColor: Colors.blue),
                            displayCell(text: '6',color: Colors.white, bgColor: Colors.blue),
                            displayCell(text: '+',color: Colors.white, bgColor: Colors.pinkAccent),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            displayCell(text: '1',color: Colors.white, bgColor: Colors.blue),
                            displayCell(text: '2',color: Colors.white, bgColor: Colors.blue),
                            displayCell(text: '3',color: Colors.white, bgColor: Colors.blue),
                            displayCell(text: '%',color: Colors.white, bgColor: Colors.redAccent),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            displayCell(text: '%',color: Colors.white, bgColor: Colors.amber),
                            displayCell(text: '0',color: Colors.white, bgColor: Colors.blueGrey),
                            displayCell(text: '.', color: Colors.red, bgColor: Colors.white),
                            displayCell(text: '00', color: Colors.red, bgColor: Colors.purple),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                child:
                                    displayCell(text: '=',color: Colors.white, bgColor: Colors.blue))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      ),
    );
  }

  Widget displayCell({required String text, required Color color, required Color bgColor}) {
    return InkWell(
      onTap: (){setButton(btn: text);},
      child: Container(
      width: (size / 4) - 8,
      height: (height * 0.6) * 0.15,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      padding: const EdgeInsets.all(10),
      child: 
        Text(text, style: TextStyle(
          color: color
        ),),
    ),
    );
  }

  void setButton({required String btn}){
    switch(btn){
      case '0'||'00' || '1' || '2' || '3' || '4' || '5' || '6' || '7' || '8' || '9' :
        setState(() {
          questionController.text = questionController.text + btn;
        });
      case 'DEL':
        int lenght = questionController.text.length;
        questionController.text = questionController.text.substring(0, lenght-1);
        setState(() {
        });
    }
  }
}
