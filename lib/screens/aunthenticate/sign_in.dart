import 'package:afrikelist/services/auth.dart';
import 'package:afrikelist/shared/constants.dart';
import 'package:afrikelist/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Container (
          decoration: BoxDecoration(
            image : DecorationImage(
                image: AssetImage("images/logistic_background.jpg"),
              fit: BoxFit.cover,
            ),
          ),

         child : Scaffold(

            backgroundColor: Colors.transparent,
            body: Container(
              child : ListView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 70),
                      Image.asset('images/logo.png'),
                      SizedBox(height: 50),

                      ErrorBox(
                          error: error,
                      ),

                      SizedBox(height: 10),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(29) ,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(
                                Icons.person,
                                color: Colors.white
                            ),
                            hintText: "Email",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.white),
                          validator: (val) => val.isEmpty ? 'enter email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(29) ,
                        ),
                        child: TextFormField(
                        decoration:
                            InputDecoration(
                              icon: Icon(Icons.lock,
                              color: Colors.white),
                              suffixIcon: Icon(
                                Icons.visibility,
                                color: Colors.white,
                              ),
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                        validator: (val) =>
                            val.length < 6 ? 'enter password 6+' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        obscureText: true,
                      ),
                      ),

                      SizedBox(height: 20,),

                      RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Give valid credential';
                                loading = false;
                                });
                              }
                          }
                        },
                        padding: EdgeInsets.symmetric(
                            vertical :16.0,
                            horizontal:90.0
                        ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            color: Colors.blue[400],
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                    ],
                  ),
                ),
              ],
            ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                image : DecorationImage(
                  image: AssetImage("images/logistic_background.jpg"),
                  fit: BoxFit.cover,
              ),
                // boxShadow: ,
              ),
              height: MediaQuery.of(context).size.height ,
              width: MediaQuery.of(context).size.width ,
              margin: EdgeInsets.all(20.0),

            )
          )
    //]
    );
  }
}

class ErrorBox extends StatefulWidget {
  const ErrorBox({
    Key key,
    @required this.error,
  }) : super(key: key);

  final String error;

  @override
  _ErrorBoxState createState() => _ErrorBoxState();
}

class _ErrorBoxState extends State<ErrorBox> {

  Color c = Colors.white;

  Color setColor(String s){
    if (s != "")
      return c = Colors.red[200];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: setColor(widget.error),
        borderRadius: BorderRadius.circular(10),
        ),
      child: Text(
        widget.error,
        style: TextStyle(
          color: Colors.red[900],
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/*class TextFieldContainer extends StatelessWidget{
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'EMAIL',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
    throw UnimplementedError();
  }

}*/
