


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../data/models/house_rules_model.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/custom_snackbar.dart';


class AlertAddItem extends StatefulWidget {
  AlertAddItem();

  @override
  State<AlertAddItem> createState() => _AlertAddItemState();
}

class _AlertAddItemState extends State<AlertAddItem> {
  final TextEditingController name = TextEditingController();
  bool enabled = true;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Text('Name:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
        ),
        TextFormField(
          controller: name,
          autocorrect: true,
          decoration: const InputDecoration(
            fillColor: Colors.white, filled: true,
            hintText: 'name',
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            border: OutlineInputBorder(borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
          validator: (v){
            if(v == null || v == ''){
              return 'This field is required';
            }
          },
        ),
        const SizedBox(height: 5,),
        Row(
          children: [
            const Text('Activate: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            Switch(
              value: enabled,
              activeColor: Colors.red,
              onChanged: (bool value) {
                setState(() {
                  enabled = value;
                });
              },
            ),
          ],
        ),

        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) => Colors.red,
                  ),
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Cancel',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                )
            ),

            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) => Colors.blue,
                  ),
                ),
                onPressed: () async {
                  if(name.text != ''){
                    await context.read<HomeController>().addHouseRules(name.text, enabled);
                    Navigator.pop(context);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Confirm',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                )
            ),
          ],
        ),
      ],
    );
  }
}
