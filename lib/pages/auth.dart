import 'package:fapp_flutter_course/widgets/player/player.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPage();
  }
}

class _AuthPage extends State<AuthPage> {
  String _loginValue;
  String _passwordValue;
  bool _acceptTerms = false;

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Container(
        decoration: BoxDecoration(image: _buildBackgroundImage()),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildLoginTextField(),
                _sizedBox(),
                _buildPasswordTextField(),
                _sizedBox(),
                _termsSwitch(),
                _buildLoginButton(),
                // videoPlayer()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sizedBox([double width = 0.0, double height = 10.0]) {
    print('$width, $height');
    return SizedBox(
      width: width,
      height: height,
    );
  }

  Widget _termsSwitch() {
    return SwitchListTile(
      title: Text('Accept terms'),
      value: _acceptTerms,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
    );
  }

  Widget _buildLoginButton() {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: Text('Login'),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/product');
      },
    );
  }

  Widget _buildLoginTextField() {
    return TextField(
        decoration: InputDecoration(
            labelText: "Login",
            filled: true,
            fillColor: Colors.white.withAlpha(200)),
        onChanged: (String value) {
          setState(() {
            _loginValue = value;
          });
        });
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password',
          filled: true,
          fillColor: Colors.white.withAlpha(200)),
      obscureText: true,
      onChanged: (String value) {
        setState(() {
          _passwordValue = value;
        });
      },
    );
  }

  Widget videoPlayer() {
    return VideoPlayerWidget();
  }
}
