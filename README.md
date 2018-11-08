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
* DEFAULT2

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
  #define DEFAULT2 4

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
* DEFAULT y DEFAULT2 son valores por defecto

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
  int main()
{
	programa();
	getch();
	return 0;
}
```
Explicacion: La funcion inicial por defecto, esta va a programa, y al terminar dicha funcion va a un getch (para pausar el programa), si este es presionado se sale del programa

```c
  void programa(void)
{
	char cadena[MAXSTRING];
	char continuar;
	char n;
	char v;
	noterminales=malloc(MAXSTRING);
	terminales=malloc(MAXSTRING);
	char *inicial;
	inicial=malloc(MAXSTRING);


	printf("Ingrese cantidad : ");
	scanf(" %d", &lon);

	if(lon>MAX)
	{
		printf("Ha ingresado un numero invalido, se usara por defecto el numero 8\n");
		lon=DEFAULT;
	}

	printf("Ingrese cantidad de vueltas: ");
	scanf(" %d", &nvueltas);
	if(nvueltas>MAXVUELTAS)
	{
		printf("Ha ingresado un numero invalido, se usara por defecto el numero 4\n");
		nvueltas=DEFAULT2;
	}
	printf("Ingrese la lista de no terminales para la tabla : ");
	scanf("%s",noterminales);
	ntlen=strlen(noterminales);


	printf("Ingrese la lista de terminales para la tabla : ");
	scanf("%s",terminales);
	tlen=strlen(terminales);


	printf("\n");
	//recoger datos
	get_datos();
	//conjunto primero
	conjunto_primero();
	//tabla
	get_tabla();
	//cadena
	printf("\nIngrese cadena a rastrear : ");
	scanf("%s", cadena);
	printf("\n");

	printf("%s\t%s\t%s\n", "La cadena a reconocer", "La pila" ,"producciones usada" );
	printf("%s\t\t\t%c#\t%s\n",cadena,noterminales[0],"lambda");
	inicial[0]=noterminales[0];
	inicial[1]='#';
	inicial[2]='\0';

	rastreo(cadena, inicial);
}
```

Explicacion: La funcion inicializa las variables y pide la cantidad para lon, nvueltas, ademas de la cantidad de terminales y caracteres para usar en la creacion de la tabla
Luego va a las demas funciones para realizar el seguimiento respectivo

```c
void get_datos(void)
{
	int i; 

	for(i=0;i<lon;i++)
	{
		//coger nombre
		printf("Ingrese no terminal %i : ",i+1);
		scanf(" %c", &conjunto[i].nombre);
		conjunto[i].nombre[0]=toupper(conjunto[i].nombre[0]);

		//coger cadena
		printf("Ingrese cadena %i : ",i+1);
		scanf("%s",conjunto[i].termina);

		//coger tamaño
		conjunto[i].len=strlen(conjunto[i].termina);
		printf("\n");	
	}

	//impresion de gramatica
	for(i=0;i<lon;i++)
	{
		printf(" %c -> %s \n",conjunto[i].nombre[0],conjunto[i].termina);
	}
	printf("\n");
}

```

Explicacion: La funcion hace un iterador para llenar los datos en el array gramatica, con lon veces, para posteriormente imprimirlo por consola

```c
int identificador(char letra)
{
	if(letra >='A' && letra<='Z')
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}
```
Explicacion: Se encarga de analizar si un caracter es mayuscula o minuscula

```c
int busqueda_primero(char letra)
{
	int contador;
	int i;
	char busqueda=letra;
	char encontrado;

	for(contador=0;contador<nvueltas;contador++)
	{
		for(i=0;i<lon;i++)
		{
			if(conjunto[i].nombre[0]==busqueda && identificador(conjunto[i].termina[0])==FALSE)
			{
				printf("Primero de %c %c \n",letra,conjunto[i].termina[0]);
				return 0;
			}
			else if(conjunto[i].nombre[0]==busqueda && identificador(conjunto[i].termina[0])==TRUE)
			{
				encontrado=conjunto[i].termina[0];
			}


		}

		busqueda=encontrado;
	}

}

```

Explicacion: La funcion inicializa las variables, busqueda es el caracter actualmente buscado por el programa, encontrado es un posible candidato que debe esperar hasta el final del bucle de i, si cumple las codicionales:

Si el nombre (S) == busqueda(S) y a es minuscula entonces imprime por consola
Si el nombre (S) == busqueda(S) y A es mayuscula entonces almacena el A en encontrado, A pasaria a ser la busqueda, en vez de S

Lo hace la cantidad de n vueltas

```c
void conjunto_primero(void)
{
	int i;
	int j;
	int k;
	printf("Conjunto primero de cada no terminal\n");

	for(i=0;i<lon;i++)
	{
		//si S->Ab , A es mayuscula
		if(identificador(conjunto[i].termina[0])==TRUE)
		{
			busqueda_primero(conjunto[i].nombre[0]);
		}
		//si A es minuscula
		else
		{
			printf("Primero de %c %c \n",conjunto[i].nombre[0],conjunto[i].termina[0]);
		}
	}

	printf("\n");
}
```
Explicacion: Engloba varios conjuntos primero, si cumple las condicionales:
Si A es mayuscula entonces va a la funcion busqueda_primero con el parametro nombre, sino imprine el valor por consola

