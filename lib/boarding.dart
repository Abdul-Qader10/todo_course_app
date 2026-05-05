import 'package:flutter/material.dart';

class Boarding extends StatelessWidget {
  const Boarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){}
      ,backgroundColor: Colors.white
      ,child: Icon(Icons.arrow_forward,color: Colors.black),
      shape: CircleBorder(),
      ),
      body: Container(decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topEnd,
          end: AlignmentDirectional.bottomStart,
          colors: [
          Color(0xff1253AA),
          Color(0xff05243E)
        ])
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Image.asset('assets/images/book.png')),
            Expanded(
              child: Column(children: [
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Text("Plan your tasks to do, that way you’ll stay organized and you won’t skip any",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),),
              ),
              SizedBox(height: 123),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (int index){
                  return dotwidget();
                },
              ),
              ),
              ],),
            )
           
          ],
        ),
      ),
    );
  }
Widget dotwidget(){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Container(height: 7,width: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),color: Colors.white 
                  ),
                  ),
  );
}
}