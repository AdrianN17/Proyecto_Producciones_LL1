# Proyecto_Producciones_LL1

Programa hecho en lenguaje C, puede ingresar un maximo de 20 producciones LL1, devuelve la funcion primero de cada produccion, tabla de funcion accion y ademas el rastreo de una cadena (debe terminar con #)

Solo acepta un maximo de 3 busquedas (vueltas), se puede editar en el **#define MAXVUELTAS**

Ejemplo: 

1. S->aS
2. S->BC
3. B->bS
4. B->dA
5. A->a
6. A->b
7. C->c
8. C->e

Cadena a seguir : abdace#

Hecho para fines academicos.

## Explicacion del programa:

### Variables globales utilizadas
* MAX 
* TRUE 
* FALSE 
* MAXSTRING 
* MAXVUELTAS 
* DEFAULT 

* lon
* nvueltas
* noterminales
* terminales
* ntlen
* tle

### Estructuras utilizadas
* gramatica
* datos

### Funciones utilizadas

* identificador
* busqueda_primero
* conjunto_primero
* get_datos
* getterminal
* get_tabla(void)
* get_rastreo
* rastreo
* programa
* restart--sin usar todavia

## Explicacion del codigo

### Variables globales

```c
  #define MAX 20
  #define TRUE 1
  #define FALSE 0
  #define MAXSTRING 20
  #define MAXVUELTAS 8
  #define DEFAULT 8

  int lon=0;
  int nvueltas=0;
  char *noterminales;
  char *terminales;
  int ntlen=0;
  int tlen=0;
  struct gramatica conjunto[MAX];
```

* MAX es el numero maximo de un array
* MAXSTRING es el numero maximo de un string
* MAXVUELTAS es el numero maximo de vueltas
* TRUE y FALSE son booleanos creados para mayor facilidad
* DEFAULT es un valor por defecto

* lon es la longitud del array de gramatica definida por el usuario
* nvueltas es la cantidad de vueltas en el programa definida por el usuario
* terminales y noterminales son una lista definida por el usuario  de mayusculas y minusculas que se utiliza en la tabla
* ntlen y tlen es la longitud de las anteriores
* conjunto es el array de longitud MAX donde se almacena los no terminales y cadenas

### Estructuras 
```c
  struct gramatica {
    char nombre[1];
    char termina[MAXSTRING];
    int len;
  };

  typedef struct datos{
    char *cadena;
    char *pila;
    char *produccion;
  } datos;
  
```

* Gramatica es un tipo de dato, compuesto por un nombre (S) , un termina o cadena (a) y una longitud de termina(1)
* datos es un tipo de datos, compuesto por una cadena, pila y produccion de tipo puntero.

### Funciones
```c
  int identificador(char letra);
  int busqueda_primero(char letra);
  void conjunto_primero(void);
  void get_datos(void);
  char *getterminal(char name, char meta);
  void get_tabla(void);
  datos get_rastreo(char* cadena,char* pila);
  datos get_rastreo(char* cadena,char* pila);
  void rastreo(char *str, char* pila);
  void programa(void);
  void restart(void);
```
* identificador recibe un parametro caracter y valida si es mayuscula o minuscula
* busqueda_primero recibe un parametro caracter y valida si tiene un terminal
* conjunto_primero no recibe un parametro, engloba a varias busqueda_primero
* get_datos recoge los datos por consola
* getterminal recibe como parametro un nombre (S) y una meta a donde yo quiero llegar (a)
* get_tabla engloba varios getterminal, armando una tabla con los terminales y no terminales pedidos por consola
* get_rastreo recibe como parametros una cadena y una pila, devuelve una estructura llamada datos
* rastreo recibe por parametro un string y una pila
* programa es la funcion principal, que esta dentro del main
* restar es la funcion para volver a reiniciar el programa

### Codigo fuente explicacion
```c

```
