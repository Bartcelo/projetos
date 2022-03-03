// ignore: prefer_const_declarations
final createTable = ''' 
CREATE TABLE contact(
  id INT PRIMARY KEY
  ,nome VARCHAR(200) 
  ,telefone CHAR(16) NOT NULL
  ,informa CHAR(500) 
  ,data INT 
)
''';

// ignore: prefer_const_declarations
final insert= ''' 
INSERT INTO contact(nome,telefone,informa,data)
VALUES('Marcelo','11953390695','Gostou da conversa','190222')''';

// ignore: prefer_const_declarations
final insert2= ''' 
INSERT INTO contact(nome, telefone, informa,data)
VALUES("Marli","11953390698","Falou sobre a morte da filha","200222")''';

// ignore: prefer_const_declarations
final insert3= ''' 
INSERT INTO contact(nome, telefone, informa,data)
VALUES("Raiane","11981046516","Linda do marido","210222")''';