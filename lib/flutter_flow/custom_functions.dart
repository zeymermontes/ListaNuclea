import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String nombreApellido(
  String nombre,
  String apellido,
) {
  // create a string from  nombre and apellido with a space in the middle
  if (nombre != null && apellido != null) {
    return "${nombre.trim()} ${apellido.trim()}";
  } else if (nombre != null) {
    return nombre;
  } else if (apellido != null) {
    return apellido;
  } else if (nombre == null && apellido == null) {
    return '';
  }
  return '';
}

String soloApellido(String nombreCompleto) {
  // split nombreCompleto by space and return the last part
  return nombreCompleto.split(' ').last;
}

String soloNombre(String nombreCompleto) {
  // split nombreCompleto from a space and return the first part
  return nombreCompleto.split(" ")[0];
}
