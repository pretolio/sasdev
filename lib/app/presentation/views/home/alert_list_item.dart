


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../data/models/house_rules_model.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/custom_snackbar.dart';


class AlertListItem extends StatefulWidget {
  AlertListItem(this.item);
  final Entity item;

  @override
  State<AlertListItem> createState() => _AlertListItemState();
}

class _AlertListItemState extends State<AlertListItem> {
  final TextEditingController name = TextEditingController();
  bool enabled = true;
  bool isDeleted = false;

  @override
  void initState() {
    name.text = widget.item.name ?? '';
    enabled = widget.item.active == 1 ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isDeleted ? AlertDelete() : AlertDetail();

  }

  Widget AlertDelete(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Text('Do you really want to delete the House Rules?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
        ),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) => Colors.blue,
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    isDeleted = false;
                  });
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
                        (Set<MaterialState> states) => Colors.red,
                  ),
                ),
                onPressed: () async {
                  await context.read<HomeController>().deleteHouseRules(widget.item.id!);
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Delete',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                )
            ),
          ],
        ),
      ],
    );
  }

  Widget AlertDetail(){
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
            const Text('Activate: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
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
                        (Set<MaterialState> states) => Colors.blue,
                  ),
                ),
                onPressed: () async {
                  if(name.text != widget.item.name || (enabled ? 1 : 0) != widget.item.active ){
                    await context.read<HomeController>().updateHouseRules(widget.item.id!, name.text, enabled);
                  }
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Update',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                )
            ),

            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) => Colors.red,
                  ),
                ),
                onPressed: (){
                  setState(() {
                    isDeleted = true;
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Delete',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                )
            ),
          ],
        ),
      ],
    );
  }
}
