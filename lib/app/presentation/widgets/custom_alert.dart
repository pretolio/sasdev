import 'package:flutter/material.dart';


class CustomAlert {

  static custom({
    required BuildContext context,
    required Widget corpo,
    String? titulo,
    Widget? widgeTitulo,
    String? txtBotaoSucess,
    String? txtBotaoCancel,
    VoidCallback? funcSucess,
    VoidCallback? funcCancel}){

    return showDialog(
        context: context,
        builder: (context){
          return  AlertDialog(
            titlePadding:  EdgeInsets.all(5),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: IconButton(onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.clear, color: Colors.black54,)
                  ),
                ),
                widgeTitulo != null ? widgeTitulo :
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(titulo?.toUpperCase() ?? '', style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                ),
              ],
            ),
            content: corpo,
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
            buttonPadding: EdgeInsets.zero,
            actions: [
              if(txtBotaoCancel != null)
                TextButton(
                    onPressed: (){
                      funcCancel!();
                      Navigator.pop(context);
                    },
                    child: Container(
                      //width: 100, alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(txtBotaoCancel, style: TextStyle(color: Colors.black45),))
                ),
              if(txtBotaoCancel != null) SizedBox(width: 10,),
              if(txtBotaoSucess != null)
                TextButton(
                    onPressed: (){
                      funcSucess!();
                      Navigator.pop(context);
                    },
                    child: Container(
                      //width: 100, alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(txtBotaoSucess, style: TextStyle(color: Colors.blue),))
                ),
              SizedBox(width: 10,),
            ],
          );
        }
    );
  }


}