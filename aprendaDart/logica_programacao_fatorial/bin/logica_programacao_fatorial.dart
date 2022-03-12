import 'dart:io';

void main(List<String> arguments) {
 int a,b;

print("Digite um numero para encontrar o fatotial");

 a = int.parse(stdin.readLineSync()!);

 for(b = 1 ; a > 1; a--){
   b = b * a;   
 }
print(b);


}
