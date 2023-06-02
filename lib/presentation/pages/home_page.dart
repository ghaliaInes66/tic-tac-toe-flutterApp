import 'package:flutter/material.dart';
import 'package:flutter_application_2/modals/player.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
 State<HomePage> createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{
   String player1Name ='INES';
   String player2Name ='AYA';
   int player1Score=0;
   int player2Score=0;
   bool isO=true;
   bool startGame=false;
   int filledBoxes=0;
   List<String> displayElement = ['', '', '', '', '', '', '', '', ''];

@override
   Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        width: double.infinity,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            //name&score
            player(player1Name,player2Name,player1Score,player2Score),
      
             //game
            Container(
              height:450,
              
               child:Expanded(
             
            // Creating the Board for Tic tac toe
            flex: 4,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                          border: Border.all(color: Colors.white,width: 2),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(color:displayElement[index].isEmpty? Colors.grey.withOpacity(0.5):displayElement[index]=='X'? const Color.fromARGB(255, 22, 146, 247).withOpacity(0.5):Colors.orange.withOpacity(0.5),
                            spreadRadius:5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                            )
                          ]
                      ),
                        child:Center(
                           child: Text(
                          displayElement[index],
                          style: TextStyle( fontSize: 35,fontWeight: FontWeight.bold),
                        ),
                        ),
                    ),
                  );
                }),
          ),

            ),

            //btn
            Container(
              height: 132,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 182, 73))),
                  onPressed: () {
                       setState(() {
                           startGame=true;
                          });
                      },
                  child: Text('Start',
                  style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                  ),
                  IconButton(
                    icon: const Icon(Icons.repeat,color: Colors.white,size: 40,),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 182, 73))),
                  onPressed: () { 
                    setState(() {
                      _resetGameDialog();
                    });
                    },
                  
                  ),

              ],)

            ),
          ],
        )
      
       ,)
    );
}
void _tapped(int index) {
    setState(() {
      if (startGame&& isO && displayElement[index] == '') {
        displayElement[index] = 'O';
        filledBoxes++;
      } else if (startGame&& !isO && displayElement[index] == '') {
        displayElement[index] = 'X';
        filledBoxes++;
      }
 
      isO = !isO;
      _checkWinner(index);
    });
  }

void _checkWinner(int index){
  setState(() {
    if((displayElement[0]==displayElement[1] &&displayElement[0]== displayElement[2]&&displayElement[0]!='')||(displayElement[3]==displayElement[4] &&displayElement[3]== displayElement[5]&&displayElement[3]!='')||(displayElement[6]==displayElement[7] &&displayElement[6]== displayElement[8]&&displayElement[6]!='')||(displayElement[0]==displayElement[3] &&displayElement[0]== displayElement[6]&&displayElement[0]!='')||(displayElement[1]==displayElement[4] &&displayElement[1]== displayElement[7]&&displayElement[1]!='')||(displayElement[2]==displayElement[5] &&displayElement[2]== displayElement[8]&&displayElement[2]!='')||(displayElement[0]==displayElement[4] &&displayElement[0]== displayElement[8]&&displayElement[0]!='')||(displayElement[2]==displayElement[4] &&displayElement[2]== displayElement[6]&&displayElement[2]!='')){
     if(displayElement[index]=='X') {player1Score++;  _GameEndedDialog(player1Name);}
     else { player2Score++;  _GameEndedDialog(player2Name);}
     _reset();
    }else if(filledBoxes==9){
      _DrawDialog();
      _reset();
    }
  });
}

void _reset(){
  setState(() {
    displayElement = ['', '', '', '', '', '', '', '', ''];
    isO=true;
    filledBoxes=0;
  });
}


void _GameEndedDialog(String winner) {

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" " + winner + " \" is the Winner!"),
            actions: [
              ElevatedButton(
                child: Text("Play Again", style: TextStyle(color: Colors.white,fontSize: 20),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 182, 73))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
}
void _resetGameDialog() {

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("reset the game"),
            actions: [
              ElevatedButton(
                child: Text("cancel", style: TextStyle(color: Colors.white,fontSize: 20),),
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 182, 73))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: Text("yes", style: TextStyle(color: Colors.white,fontSize: 20),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 182, 73))),
                onPressed: () {
                  _reset();
                     player1Score=0;
                      player2Score=0;
                    startGame=false;
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
}

_DrawDialog(){
  showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 182, 73))),
                child: Text("Play Again", style: TextStyle(color: Colors.white,fontSize: 20),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
}

}

