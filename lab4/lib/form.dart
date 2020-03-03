import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  MyCustomForm({Key key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
	    // Build a Form widget using the _formKey created above.
	    return Scaffold(
	      appBar: AppBar(
	        title: Text('Form Validation'),
	      ),
	      body: Form(
	        key: _formKey,
	        child: Column(
	          crossAxisAlignment: CrossAxisAlignment.start,
	          children: <Widget>[
	            BuildEmailField(),
	            TextFormField(
	              decoration: InputDecoration(
	                  icon: Icon(Icons.lock),
	                  labelText: 'Password',
	                  hintText: 'Please input your password'),
	              obscureText: true,
	              keyboardType: TextInputType.text,
	              onSaved: (value) => print(value),

	              validator: (value) {
	                if (value.isEmpty) {
	                  return 'Please enter some text';
	                }
                  else if (value.length <= 8){
                    return 'Password must be more than 8 character';
                  }
	                return null;
	              },
	            ),
	            buildRaisedButton(),
	          ],
	        ),
	      ),
	    );
	  }	
	  RaisedButton buildRaisedButton() {
	    return RaisedButton(
	      onPressed: () {
	        // Validate returns true if the form is valid, or false
	        // otherwise.
	        if (_formKey.currentState.validate()) {
	          // If the form is valid, display a Snackbar.
	          //final snackBar = SnackBar(content: Text('Profile saved'));
	          Scaffold.of(this._formKey.currentContext)
	              .showSnackBar(SnackBar(content: Text('Login pass')));
	        }
	      },
	      child: Text('Submit'),
	    );
	  }
	}
	
	class BuildEmailField extends StatelessWidget {
	  const BuildEmailField({
	    Key key,
	  }) : super(key: key);
	
	  @override
	  Widget build(BuildContext context) {
	    return TextFormField(
	      decoration: InputDecoration(
	          icon: Icon(Icons.email), labelText: 'E-mail', hintText: 'x@x.com'),
	      keyboardType: TextInputType.emailAddress,
	      onSaved: (value) => print(value),
	      validator: (value) {
	        if (value.isEmpty) {
	          return 'Please fill in E-mail field';
	        }
	        return null;
	      },
	    );
	  }

}

	
 