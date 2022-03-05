

void  main() {
// estudando Maps
// var comentarios = {
//   'java': 'Comentario java',
//   'dart':'Comentario dart',
//   'C#': 'Comentario C#'
// };
// comentarios.

// Map<String, String> comentario = Map<String, String>();
// comentario['Java'] = 'Comentarios Java';
// comentario['Dart'] = 'Comentarios Dart';
// comentario['C#'] = 'Comentarios C#';

// // comentario.values.forEach((element) { 
// //   print(element);
// // });

// comentario.forEach((key, value) { 
//   print("$key => $value");
// });

Map<String, List<String>> livros = Map<String, List<String>>();

  livros ["Java"] = ["livro Java 1","livro Java 2","livro Java 3"];
  livros ["Dart"] = ["livro Dart 1","livro Dart 2","livro Dart 3"];
  livros ["JavaScript"] = ["livro JavaScript 1","livro JavaScript 2","livro JavaScript 3"];

  print(livros);
  livros.forEach((key, value) { 
    print(
      """
      $key
          ${value}
  """
    );
  });

  
  }