import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool esNumero(String s) {
  if (s.isEmpty) return false;

  final n = num.tryParse(s);

  return (n == null) ? false : true;
}

bool dpiValido(String s) {
  if (s.isEmpty) return false;

  if (s.length < 13 || s.length > 13) return false;

  final n = num.tryParse(s);
  return (n == null) ? false : true;
}

bool correoValido(String s) {
  RegExp regExp = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  if (regExp.hasMatch(s)) {
    return true;
  } else {
    return false;
  }
}

bool isPasswordValid(String password, [int minLength = 6]) {
  // if (password == null || password.isEmpty) {
  // return false;
  // }
  bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
  bool hasDigits = password.contains(new RegExp(r'[0-9]'));
  bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
  bool hasSpecialCharacters =
      password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = password.length > minLength;
  return hasDigits &
      hasUppercase &
      hasLowercase &
      hasSpecialCharacters &
      hasMinLength;
}

bool validateEmail(String value) {
  // Pattern pattern =
  // r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return (!regex.hasMatch(value)) ? false : true;
}

bool validateCreditCard(String value) {
  RegExp regex = new RegExp(
      r'^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$');
  return (!regex.hasMatch(value)) ? false : true;
}

bool telefonoValido(String s) {
  if (s.isEmpty) return false;

  if (s.length < 8 || s.length > 8) return false;

  final n = num.tryParse(s);
  return (n == null) ? false : true;
}

void mostrarAlerta(
    BuildContext context,
    String titulo,
    double tituloTam,
    Color tituloColor,
    FontWeight tituloWeight,
    String mensaje,
    double mensajeTam,
    Color mensajeColor,
    FontWeight mensajeWeight,
    String imagen,
    String width,
    String height,
    String botonMensaje) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: Text(titulo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: tituloTam,
                  color: tituloColor,
                  fontWeight: tituloWeight)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  mensaje,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: mensajeTam,
                      color: mensajeColor,
                      fontWeight: mensajeWeight),
                ),
                /*Image.asset(
                  imagen,
                  width: double.parse(width),
                  height: double.parse(height),
                )*/
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(botonMensaje))
          ],
        );
      });
}

void mostrarAlertaRuta(
    BuildContext context,
    String titulo,
    String mensaje,
    String imagen,
    String width,
    String height,
    String botonMensaje,
    String ruta) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo, textAlign: TextAlign.center),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(mensaje, textAlign: TextAlign.center),
                Image.asset(
                  imagen,
                  width: double.parse(width),
                  height: double.parse(height),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () => {
                      Navigator.pushReplacementNamed(context, ruta),
                    },
                child: Text(botonMensaje))
          ],
        );
      });
}

class ProgressDialog {
  final BuildContext context;
  ProgressDialog(this.context);

  void show() {
    showCupertinoModalPopup(
      context: this.context,
      builder: (_) => Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withOpacity(0.7),
        child: CupertinoActivityIndicator(
          radius: 15,
        ),
      ),
    );
  }

  void dismiss() {
    Navigator.pop(context);
  }
}
