
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../config.dart';
import '../../../enums/routes.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/custom_alert.dart';
import 'alert_add_item.dart';
import 'alert_list_item.dart';



class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    //_pagingController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return Consumer<HomeController>(
      builder: (context, home, __) {
        return Scaffold(
          key: HomeController.scaffoldKey,
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/logo2.png', width: 30,),
                Text('Sasdev Test'),
                SizedBox()
              ],
            ),

            actions: [
              IconButton(onPressed: (){

                Navigator.pushNamedAndRemoveUntil(
                    context, RouteName.Login.value, (route) => false);

              }, icon: Icon(Icons.logout_sharp, size: 25,))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: home.listEntity.map((e) {
                      return Card(
                        surfaceTintColor:  e.active == 1 ? Colors.white : Colors.grey,
                        elevation: 2,
                        child: InkWell(
                          onTap: (){
                            CustomAlert.custom(context: context,
                                titulo: 'House Rules Detail',
                                corpo: AlertListItem(e)
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: ListTile(
                              title: Text('${e.name}'),
                              trailing: Icon(Icons.circle, size: 15,
                                color: e.active == 1 ?
                                Config.priColor : Colors.grey.shade200,),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),


                Container(
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<int>.generate(home.numPages, (index) => index + 1)
                        .map((page) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            home.currentPage = page;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                color: page == home.currentPage ?
                                  Config.priColor : Colors.grey,),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                            alignment: Alignment.center,
                            child: Text('$page', style: TextStyle(
                              color: page == home.currentPage ? Config.priColor : null,
                            ),),
                          ),
                        ))).toList(),
                  ),
                ),
              ],
            ),
          ),


          floatingActionButton: FloatingActionButton(
            onPressed: () {
              CustomAlert.custom(
                  context: context,
                  titulo: 'Add House Rules',
                  corpo: AlertAddItem()
              );
            },
            backgroundColor: Config.priColor,
            shape: CircleBorder(),
            child: Icon(Icons.add, color: Colors.white,),
          ),
        );
      }
    );

  }

}
