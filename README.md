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
```
