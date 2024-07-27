import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //String inputval = "";
  String outputval = "";
  String operate="";
  num num1=0;
  num num2=0;
  String result="";

buttonClick(btnvalue){
  if (btnvalue =="AC"){
    // Clear all values
    result="";
    outputval="";
  }else if (btnvalue == "C"){
      // last value is removed     issues
       if (outputval.isNotEmpty){
        outputval = outputval.substring(0, outputval.length - 1);
         if (outputval == "") {
          outputval = "";
         }
       }
  }else if (btnvalue == "+" || btnvalue== "-" || btnvalue == "/" || btnvalue == "X" || btnvalue == "%"){
      num1=num.parse(outputval);
      if (btnvalue=="X"){
         btnvalue = btnvalue.replaceAll('X', '*');
         operate=btnvalue;
      }else {operate=btnvalue;}
      result="";
      outputval=outputval+btnvalue;
  }else if(btnvalue =="mc" || btnvalue == "m+" || btnvalue == "m-" || btnvalue == "mr"){
    // Issues
  }else if(btnvalue == "="){
    num2=num.parse(outputval);
    if(operate == "+"){
      result=(num1+num2).toString();
    }
    if(operate=="-"){
       result=(num1-num2).toString();
    }
     if(operate=="*"){
       result=(num1*num2).toString();
    }
     if(operate=="/"){
       result=(num1/num2).toString();
    }
      if(operate=="%"){
        result=(num1%num2).toString(); // Not working
      }
  }else {
    result=result+btnvalue;
  }

setState(() {
  outputval=result;
  //outputval=double.parse(result).toString();
});

}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
           const SizedBox(height: 60,),
            // Fourmula Text
           const Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Text("Text 1",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400),),
            ),
            // Result Text
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Text(outputval,style: const TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w800),),
            ),
            const SizedBox(height: 20,),
            //Button
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
              Row(
                children: [
                calButton(buttontext:"mc"),
                calButton(buttontext:"m+"),
                calButton(buttontext:"m-"),
                calButton(buttontext:"mr"),
                // calButton(buttontext:"1"),
                // calButton(buttontext:"0", isEquButton:true),
              ],),

              Row(
              children: [
                calButton(buttontext:"AC"),
                calButton(buttontext:"C"),
                calButton(buttontext:"%"),
                calButton(buttontext:"/",isOperaters:true),
                // calButton(buttontext:"2"),
                
              ],),
              Row(children: [
                calButton(buttontext:"7"),
                calButton(buttontext:"8"),
                calButton(buttontext:"9"),
                calButton(buttontext:"X",isOperaters:true),
                // calButton(buttontext:"3"),
                // calButton(buttontext:"."),
              ],),

              Row(children: [
                calButton(buttontext:"4"),
                calButton(buttontext:"5"),
                calButton(buttontext:"6"),
                calButton(buttontext:"-",isOperaters:true),
                // calButton(buttontext:"3"),
                // calButton(buttontext:"."),
              ],),

              Row(children: [
                calButton(buttontext:"1"),
                calButton(buttontext:"2"),
                calButton(buttontext:"3"),
                calButton(buttontext:"+",isOperaters:true),
                // calButton(buttontext:"3"),
                // calButton(buttontext:"."),
              ],),

              Row(children: [
                calButton(buttontext:"0", isEquButton:true),
                // calButton(buttontext:"/"),
                calButton(buttontext:"."),
                calButton(buttontext:"=",isOperaters:true),
                // calButton(buttontext:"+"),
                // calButton(buttontext:"="),
              ],)

            ] )
          ],
        ),
      )
    );
  }



  Padding calButton({required String buttontext, bool isEquButton =false, bool isOperaters =false}) {
    return Padding(
                padding: const EdgeInsets.all(4.0),
                child: InkWell(
                  onTap: (){
                    buttonClick(buttontext);  
                   // setState(() {
                    //  buttonClick(buttontext);
                    //      }
                    //);
                  },
                  child: Container(
                    width: isEquButton == true? 168 :80 ,
                    height: 80, decoration: BoxDecoration(color: isOperaters == true? const Color.fromRGBO(226, 149, 5, 1): const Color.fromARGB(255, 94, 93, 93),borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child: Text(buttontext,textAlign: TextAlign.center, style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
  }

  
}
