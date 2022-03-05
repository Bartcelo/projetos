

void  main() {
 // estudando listas
List <int> lista = [1,2,3];
List <int> lista2 = [7,8,9,10,11,12];

print(lista);
print("ok1");
print(lista.remove(2));
print("ok2");
lista.add(5);
print(lista);
print("ok3");
lista.clear();
print(lista);
print("ok4");
lista.addAll(lista2);
print("ok5");
var elemento = lista.elementAt(1);
print(elemento);

print("ok6");
print(lista);
print("ok7");
var nova = null;
var listatotal = ["Estidando lista",...lista.reversed, ...lista2, "com dart", ...?nova];
print(listatotal);
print("ok8");

   
 
  }