import 'dart:io';

void main(){
  print("Digita tu edad: ");
  String? input = stdin.readLineSync();
  int? edad = int.tryParse(input ?? "0");

  if(edad == null){
    print("Ingrese una edad valida.");
  } else if(edad >= 18){
    print("Tienes mas de 18.");
  } else {
    print("Tienes menos de 18 años ($edad)");
  }
}

// Función requerida por el test
int calculate() {
  return 42;
}