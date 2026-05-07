import 'package:app_1/home_screen.dart';
import 'package:flutter/material.dart';

class Boarding extends StatefulWidget {
 Boarding({super.key});

  @override
  State<Boarding> createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {
final List<Boardingpage> boardingpages = [
  Boardingpage(
    imagepath: 'assets/images/book.png',
    title: 'Plan your tasks to do, that way youll stay organized and you wont skip any'
  ),
  Boardingpage(
    imagepath: 'assets/images/image_2.png',
    title: 'Make a full schedule for the whole week and stay organized and productive all days'
  ),
  Boardingpage(
    imagepath: 'assets/images/image_3.png',
    title: 'create a team task, invite people and manage your work together'
  ),
  Boardingpage(
    imagepath: 'assets/images/image_4.png',
    title: 'You informations are secure with us'
  )
];

int currentindex = 0;
PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
    backgroundColor: Colors.white
    ,    onPressed: (){
if (currentindex == boardingpages.length - 1){
  Navigator.push(context, 
  MaterialPageRoute(builder: (context) => HomeScreen()),
  
  );   
    }
    else{
      pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
    }
        , shape: CircleBorder(),  
      child: Icon(
        currentindex == boardingpages.length - 1 ? Icons.check : 
        Icons.arrow_forward,color: Colors.black),
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
           Expanded(
             child: PageView.builder(
              controller: pageController,
              itemCount: boardingpages.length, 
             onPageChanged: (index){
              setState(() {
                currentindex = index;
                
              });
             }, 
             itemBuilder: (context, index){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(boardingpages[index].imagepath,
                      height: 300,
                      width: 300,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Expanded(
                      child: Text(
                        boardingpages[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                      ),
                    )
                  ]
                );
              }
              ),
           ),
           
           Padding(
             padding: const EdgeInsets.only(bottom: 100),
             child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(boardingpages.length, (int index){
                      return    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Container(height: 7,width: index == currentindex ? 36 : 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),color: Colors.white 
                  ),
                  ),
  );
                    },
                  ),
                  ),
           ),
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
  
class Boardingpage {
  final String imagepath;
  final String title;

Boardingpage({required this.imagepath,required this.title});
}