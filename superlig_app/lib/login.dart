import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superlig_app/provider/app_satate.dart';

import 'homepage.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({Key? key}) : super(key: key);

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController usernameCtr = TextEditingController();
  TextEditingController mailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  bool isPasswordVisible = false;
  bool isFromLogin = true;

  ///TODO
  /// telefon numarası validasyonu
  /// köşeli form field
  /// arkaplan rengi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forms Page"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                isFromLogin = !isFromLogin;
                mailCtr.text = usernameCtr.text = passwordCtr.text = "";
              });
            },
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: Text(isFromLogin ? "Sign Up" : "Login"),
          ),
          const SizedBox(width: 16),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TextButton(
          onPressed: () {
            final isvalid = formKey.currentState!.validate();
            if (isvalid) {
              var appState = Provider.of<AppState>(context, listen: false);
              dynamic formResponse;
              if (isFromLogin) {
                formResponse = appState.login(
                    mailCtr.text.trim(), passwordCtr.text.trim());
              } else {
                formResponse = appState.signup(mailCtr.text.trim(),
                    usernameCtr.text.trim(), passwordCtr.text.trim());
              }

              if (formResponse is String) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(formResponse)));
                return;
              }
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const Homepage(),
                ),
                (_) => false,
              );
            }
          },
          child: Text(!isFromLogin ? "Sign Up" : "Login")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: mailCtr,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    var mailRegex = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if (value != null && mailRegex.hasMatch(value)) {
                      return null;
                    }

                    return "Geçerli bir mail adresi giriniz.";
                  },
                  decoration: const InputDecoration(
                    //prefixIcon: Icon(CupertinoIcons.mail),
                    hintText: "E-Mail Address",
                    labelText: "E-Mail",
                  ),
                ),
                TextFormField(
                  controller: usernameCtr,
                  validator: (value) {
                    if (value != null && value.length >= 3) {
                      return null;
                    }
                    return "Bu alan boş bırakılamaz.";
                  },
                  decoration: const InputDecoration(
                    //suffixIcon: Icon(CupertinoIcons.info_circle),
                    hintText: "İsim-Soyisim",
                    labelText: "İsim-Soyisim",
                  ),
                ),
                TextFormField(
                  controller: passwordCtr,
                  obscureText: !isPasswordVisible,
                  validator: (value) {
                    if (value != null && value.length >= 7) {
                      return null;
                    }

                    if (value != null && value.length < 7 && value.isNotEmpty) {
                      return "En az 7 karakter olmalıdır.";
                    }

                    return "Bu alan boş bırakılamaz.";
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: isPasswordVisible
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined)),
                    hintText: "Şifre",
                    labelText: "Şifre",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
