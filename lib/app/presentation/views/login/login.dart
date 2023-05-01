

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config.dart';
import '../../../enums/routes.dart';
import '../../../utils/validations.dart';
import '../../controllers/login_controller.dart';
import '../../widgets/custom_snackbar.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController user = TextEditingController(text: 'gabriel@email.com');
  TextEditingController pass = TextEditingController(text: '123456');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            const SizedBox(height: 15,),
            Form(
              key: formKey,
              child: Card(
                color: Colors.grey.shade50,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 15,),
                      const Text('Email', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                      TextFormField(
                        controller: user,
                        decoration: const InputDecoration(
                          fillColor: Colors.white, filled: true,
                          hintText: 'email@email.com',
                          contentPadding: EdgeInsets.symmetric(horizontal: 25),
                          border: OutlineInputBorder(borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                        ),
                        validator: (v){
                          if(v == null || v == ''){
                            return 'Type your e-mail';
                          }else if(!Validations.emailValid(v)){
                            return 'Enter valid email';
                          }
                        },
                      ),
                      const SizedBox(height: 15,),
                      const Text('Password', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                      TextFormField(
                        controller: pass,
                        decoration: const InputDecoration(
                          fillColor: Colors.white, filled: true,
                          hintText: '******',
                          contentPadding: EdgeInsets.symmetric(horizontal: 25),
                          border: OutlineInputBorder(borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                        ),
                        obscureText: true,
                        validator: (v){
                          if(v == null || v == ''){
                            return 'Type your password';
                          }
                        },
                      ),
                      const SizedBox(height: 15,),

                      InkWell(
                        onTap: (){
                          if(formKey.currentState!.validate()){
                            context.read<LoginController>().singin(context, user: user.text, pass: pass.text)
                              .then((value) {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, RouteName.Home.value, (route) => false);
                            }).onError((error, stackTrace) {
                              CustomSnackbar.context(text: error.toString(), context: context);
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Config.priColor,
                            borderRadius: const BorderRadius.all(Radius.circular(8))
                          ),
                          child: const Text('LOGIN',
                            style: TextStyle(fontSize: 18, color: Colors.white,
                                fontWeight: FontWeight.w600),),
                        ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
