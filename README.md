# Proyecto_Producciones_LL1

Programa hecho en lenguaje C, puede ingresar un maximo de 20 producciones LL1, devuelve la funcion primero de cada produccion, tabla de funcion accion y ademas el rastreo de una cadena (debe terminar con #)

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

### Instrucciones

Compilar el programa con GCC, compilador c

Dentro del programa le pedira 4 parametros en el fichero TXT parametros

* Cantidad de no terminales a utilizar en el programa, si se coloca un numero mayor a 20 este asignara por defecto 8
* Cantidad de vueltas a utilizar en el programa, si se coloca un numero mayor a 8 este se asigrana por defecto 4

Es necesario colocar la cantidad de vueltas exactas, sino el programa no funcionara de manera optima

Por ejemplo:

**S->As  A->b**

**Aca existen 2 vueltas, S a A, y A a b. Si S derivara a una cadena, entonces S->a seria de una vuelta**

Si coloco 3 vueltas, este hara una vuelta adicional y el resultado puede ser incorrecto, por lo tanto es recomendable colocar el maximo de vueltas que se requiere, en este caso solo 2

* Lista de no terminales para la tabla, un maximo de 20 no terminales, debe colocarse para construir la tabla

Ejemplo: SABC

* Lista de terminales para la tabla, un maximo de 20 no terminales, debe colocarse para construir la tabla

Ejemplo: abcde#

* Cadena a rastrear, un maximo de 20 caracteres, debe colocarse con # al final de manera obligatoria

Luego, se necesita colocar la cantidad de gramaticas en el TXT gramatica, con un maximo definido en el txt parametros:

**Ejemplos : **

```
txt parametros

8 -- numero de gramaticas
2 -- numero de vueltas
SABC -- cadena de no terminales
abcde -- cadena de terminales
```
Recordar que acepta un maximo de 20 caracteres, las cadenas.

```
txt gramatica

S->aS
S->BC
B->bS
B->dA
A->a
A->b
C->c
C->e
```

Son las gramaticas a utilizar, esta ligado al numero de gramaticas, es necesario darle un salto de linea y la flecha **->**.



## Lista de funciones, estructuras y variables utilizadas

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
* lectura_datos
* lectura_gramatica
* busqueda_primero
* conjunto_primero
* getterminal
* get_tabla
* get_rastreo
* rastreo
* programa

## Explicacion del codigo :

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
    char cadena[MAXSTRING];
    int len;
  };

  typedef struct datos{
    char *cadena;
    char *pila;
    char *produccion;
  } datos;
  
```

* Gramatica es un tipo de dato, compuesto por un nombre (S) , una cadena (a) y una longitud de termina(1)
* datos es un tipo de datos, compuesto por una cadena, pila y produccion de tipo puntero.

Cadena : La cadena a hacer seguimiento, debe tener # al final
	
Por ejemplo abdace#

Pila : Es la descomposicion de un terminal, hasta acercarse a la cadena

Produccion : Son las producciones utilizadas en la pila


### Funciones
```c
int identificador(char letra);
void lectura_datos(void);
void lectura_gramatica(void);
void busqueda_primero(void);
char conjunto_primero(char name, char meta);
char *getterminal(char name, char meta);
void get_tabla(void);
datos get_rastreo(char* cadena,char* pila);
void rastreo(char *str, char* pila);
void programa(void);
```
* identificador recibe un parametro caracter y valida si es mayuscula o minuscula
* lectura_datos se encarga de leer los datos del fichero txt parametros
* lectura_gramatica se encarga de leer los datos del fichero txt gramatica
* busqueda_primero es una función que se encarga de buscar el conjunto primero de cada no terminal, si lo encuentra lo imprime por consola, busco (S) y que vaya a (a)
* conjunto_primero recibe un parametro y valida si hay un terminal.
* getterminal recibe como parametro un nombre (S) y una meta a donde yo quiero llegar (a)
* get_tabla engloba varios getterminal, armando una tabla con los terminales y no terminales pedidos por consola
* get_rastreo recibe como parametros una cadena y una pila, devuelve una estructura llamada datos
* rastreo recibe por parametro un string y una pila
* programa es la funcion principal, que esta dentro del main

### Codigo fuente explicacion
```c
  int main()
{
	programa();
	getch();
	return 0;
}
```
**Explicacion:** La funcion inicial por defecto, esta va a programa, y al terminar dicha funcion va a un getch (para pausar el programa), si este es presionado se sale del programa
##
```c
  void programa(void)
{
	char cadena[MAXSTRING];
	noterminales=malloc(MAXSTRING);
	terminales=malloc(MAXSTRING);
	char *inicial;
	inicial=malloc(MAXSTRING);

	lectura_datos();
	lectura_gramatica();

	printf("Datos y gramatica leidos \n");

	//conjunto primero
	busqueda_primero();
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

**Explicacion:** La funcion inicializa las variables y realiza una lectura de los ficheros, ademas de que luego pide al usuario ingresar una cadena para realizar un rastreo respectivo.
Luego va a las demas funciones para realizar el seguimiento respectivo

##
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
**Explicacion:** Se encarga de analizar si un caracter es mayuscula o minuscula

##
```c
void busqueda_primero(void)
{
	int i;
	int j;

	printf("\nConjunto primero\n");

	for(i=0;i<ntlen;i++)
	{
		printf("%c\t", noterminales[i]);
		for(j=0;j<tlen;j++)
		{
			printf("%c", conjunto_primero(noterminales[i],terminales[j]));
		}
		printf("\n");
	}
}
```

**Explicacion:** La función inicializa las variables, realiza un for por todos los no terminales, dentro de este realiza otro ciclo repetitivo para los terminales, y por cada uno envía los datos a la función, conjunto_primero, con los parámetros no terminales y terminales

##

```c
char conjunto_primero(char name, char meta)
{
	char *value=malloc(MAXSTRING);

	int i;
	int j;
	int k;
	int contador;
	char encontrado;
	char name_terminal=name;

	int valor;


	//recorre las veces de MAXVUELTAS, 
	for(contador=0;contador<nvueltas;contador++)
	{
		//recorre el arreglo struct 
		for(i=0;i<lon;i++)
		{
			if(conjunto[i].nombre[0]==name_terminal && conjunto[i].cadena[0]==meta && identificador(conjunto[i].cadena[0])==FALSE)
			{
				return meta;
			}
			else if(conjunto[i].nombre[0]==name_terminal && identificador(conjunto[i].cadena[0])==TRUE)
			{
				//si coincide pero es mayuscula lo almacena en encontrado
				if(contador==0)
				{
					valor=i;
				}

				encontrado=conjunto[i].cadena[0];
			}

		}
		//encontrado pasaria a ser la nueva busqueda : S->Ab   ... primero busca S, encontro A, ahora busca como A
		name_terminal=encontrado;
	}
	return '\0';
	
}
```
**Explicacion:**  Recibe un parametro name y otro meta, uno es lo que tengo y el otro a donde quiero llegar.
Realiza un recorrido en el arreglo struct, las veces de vueltas que definimos en el txt parametros (contador); luego, se realiza la siguientes condicionales

Ejemplo:

Si S==S y a==a y a es minuscula, entonces devuelve el valor
Si S==S y A es mayúscula entonces guarda el i, y almacena el A, reemplazándolo en name, A pasa a ser la nueva búsqueda.

##

```c
void get_tabla(void)
{
	int i;
	int j;



	printf("\nTabla de la funcion accion\n");

	//cabecera
	for(j=0;j<tlen;j++)
	{
		printf("\t%c",terminales[j]);	
	}
	printf("\t#\n");

	//cuerpo
		// para los noterminales
	for(i=0;i<ntlen;i++)//filas -
	{
		for(j=0;j<tlen+1;j++)
		{
			if(j==0)
			{
				printf("%c", noterminales[i]);
			}
			else
			{
				printf("\t%s", getterminal(noterminales[i],terminales[j-1]));
			}
		}

		printf("\t0\n");
	}

		//para los termonales
	for(i=0;i<tlen;i++)//filas -
	{
		for(j=0;j<tlen+1;j++)
		{
			if(j==0)
			{
				printf("%c", terminales[i]);
			}
			else
			{
				printf("\t%s", getterminal(terminales[i],terminales[j-1]));
			}
		}

		printf("\t0\n");
	}
	//#
	for(j=0;j<tlen+1;j++)
	{
		if(j==0)
		{
			printf("#");	
		}
		else
		{
			printf("\t0");
		}
	}
	printf("\tACEPTAR\n");
}
```

**Explicacion:** Genera una tabla mediante iteradores, llamando multiples veces a la funcion getterminal y dando como parametros el caracter de la fila y columna

##

```c
char *getterminal(char name, char meta)
{
	char *value=malloc(MAXSTRING);

	int i;
	int j;
	int k;
	int contador;
	char encontrado;
	char name_terminal=name;

	int valor;

	int validador=FALSE;

	//si ambos son iguales y minusculas
	if(identificador(name)==FALSE && name==meta)
	{
		return "E_C";
	}


	//validar si pertenece en la gramatica
	for(i=0;i<lon;i++)
	{
		if(conjunto[i].nombre[0]==name)
		{
			validador=TRUE;
		}
	}

	if(validador==FALSE)
	{
		return "0";
	}


	//recorre las veces de MAXVUELTAS, 
	for(contador=0;contador<nvueltas;contador++)
	{
		//recorre el arreglo struct 
		for(i=0;i<lon;i++)
		{
			if(conjunto[i].nombre[0]==name_terminal && conjunto[i].cadena[0]==meta && identificador(conjunto[i].cadena[0])==FALSE)
			{
				//revuelve el valor
				if(contador==0)
				{
					valor=i;
				}

				value[0]= '(' ; 
				value[1]=  conjunto[valor].nombre[0];
				value[2]= '-';
				value[3]= '>';


					
				for(k=0;k<conjunto[valor].len;k++)
				{
					value[4+k]=conjunto[valor].cadena[k];
				}

				value[conjunto[valor].len+4]= ')' ;
				value[conjunto[valor].len+4+1]='\0';
				
				return value;
			}
			else if(conjunto[i].nombre[0]==name_terminal && identificador(conjunto[i].cadena[0])==TRUE)
			{
				//si coincide pero es mayuscula lo almacena en encontrado
				if(contador==0)
				{
					valor=i;
				}

				encontrado=conjunto[i].cadena[0];
			}

		}
		//encontrado pasaria a ser la nueva busqueda : S->Ab   ... primero busca S, encontro A, ahora busca como A
		name_terminal=encontrado;
	}
	return "0";
}
```

**Explicacion:** Se recibe por parametro name y meta,se inicializan las variables, tal como busqueda primero, utiliza una variable encontrado y una name_terminal que sera editable a traves del tiempo (inicialmente name_terminal=name), un integer valor y un validador que esta en false

Si se cumplen las siguientes condicional:

Si name es minuscula y es igual a meta ( a y a==a) entonces retorna E_C

	Ahora entra a un for, en el cual este valida si pertenece al array gramatica, si no existe en los no terminales entonces validador es TRUE y se sale del programa retornando 0

	Ejemplo: ingreso S->a A->b pero yo busco getterminal(E,a) pero e no existe en mi gramatica, en este caso retorno 0

Si el programa continua hasta este momento ingresa a un bucle de numero de vueltas (nvueltas)

	Luego en otro de i 

	Y entra a la siguiente condicional:

	Si S==S y a==a y a es minuscula entonces devuelve los valores, si contador es 0 entonces se almacena(esto es para lo que viene a continuacion), ya que queremos que por ejemplo:
	
	Pero si S==S y A es mayuscula, se almacena i en valor, si el contador es 0
		S->As
		A->b
		Queremos que devuelva S->As, esta funcion solo valida si tiene un no terminal, esto es lo correcto
		S->b es incorrecto por eso se almacena i en valor, para no perderlo en el bucle, si fuese el caso que A deriva a otro no terminal B
	
Y si fuese el caso que no devuelve ningun valor hasta el momento, se devuelve 0
```c
datos get_rastreo(char* cadena,char* pila)
{
	char meta=pila[0];
	datos da;
	int i;
	int j;
	int k;
	int x;

	int contador;
	int valor=0;
	char encontrado;


	if(identificador(meta)==TRUE)
	{

		for(contador=0;contador<nvueltas;contador++)
		{
			for(i=0;i<lon;i++)
			{
				// si S == S y a== a y a es minuscula
				if(conjunto[i].nombre[0]==meta && conjunto[i].cadena[0]==cadena[0] && identificador(conjunto[i].cadena[0])==FALSE)
				{
					if(contador==0)
					{
						valor=i;
					}

					//produccion
					da.produccion=malloc(MAXSTRING);
					da.produccion[0]= '(' ; 
					da.produccion[1]=  conjunto[valor].nombre[0];
					da.produccion[2]= '-';
					da.produccion[3]= '>';


					for(k=0;k<conjunto[valor].len;k++)
					{
						da.produccion[4+k]=conjunto[valor].cadena[k];
					}

					da.produccion[conjunto[valor].len+4]= ')' ;
					da.produccion[conjunto[valor].len+4+1]='\0';
					

					//cadena

					da.cadena=malloc(MAXSTRING);
					da.cadena=cadena;

					//pila

					da.pila=malloc(MAXSTRING);
					
					for(j=0;j<conjunto[valor].len;j++)
					{
						da.pila[j]=conjunto[valor].cadena[j];
					}

					for(j=0;j<strlen(pila);j++)
					{
						da.pila[j+conjunto[valor].len]=pila[j+1];
					}

					da.pila[strlen(cadena)+conjunto[valor].len-1]='\0';




					return da;
				}
				else if(conjunto[i].nombre[0]==meta && identificador(conjunto[i].cadena[0])==TRUE)
				{
					//si coincide pero es mayuscula lo almacena en encontrado
					if(contador==0)
					{
						valor=i;
					}

					encontrado=conjunto[i].cadena[0];
				}
			}

			meta=encontrado;
		}
	}
	else if(identificador(meta)==FALSE)
	{
		//si la pila es minuscula, quita la primera letra de la cadena y pila
		//completo
		da.produccion=malloc(MAXSTRING);
		da.produccion="E_C";
		//pila
		da.pila=malloc(MAXSTRING);
		
		for(j=0;j<strlen(pila);j++)
		{
			da.pila[j]=pila[j+1];
		}

		da.pila[strlen(pila)]='\0';
		
		//cadena
		da.cadena=malloc(MAXSTRING);

		for(j=0;j<strlen(cadena);j++)
		{
			da.cadena[j]=cadena[j+1];
		}

		da.pila[strlen(cadena)]='\0';
		
		return da;
	}

	da.produccion=malloc(MAXSTRING);
	da.pila=malloc(MAXSTRING);
	da.cadena=malloc(MAXSTRING);

	da.produccion="0";
	da.pila="0";
	da.cadena="0";

	return da;
}
```

**Explicacion:** Se recibe por parametros una cadena y una pila, se inicializa las variables, la meta es el primer caracter de la pila
se inicializa valor y encontrado, si se cumple las siguientes condiciones
La funcion devuelve una estructura datos de nombre da

Si la meta es mayuscula, es A entones ingresa al bucle

	Hace un for por nvueltas y otro por i
	Si cumple la condicion, S == S y a== a y a es minuscula entonces devuelve el valor, la segunda condicional (contador==0) es solo para devolver el valor correctamente
	
		retorna da
	Pero por el contrario si S == S y A es mayuscula, A se almacena en encontrado, se guarda en valor el i y encontrado se le asigna el valor del primer caracter de termina (A pasaria a ser la busqueda en vez de S, cuando termine el bucle i)

Si por el contrario es minuscula se elimina la primera letra de la cadena y pila y retorno una estructura da

Si no se retorno hasta el momento, se devuelve da, con caracteres 0


```c
void rastreo(char *str, char* pila)
{
	if(str[0]=='#')
	{
		printf("#\t\t\t#\tE_C -> ACEPTAR\n");
	}
	else if(str[0]=='0')
	{
		printf("ERROR\t\t\tERROR\tERROR\n");
	}
	else
	{
		datos da= get_rastreo(str,pila);
		printf("%s\t\t\t%s\t%s\n",da.cadena,da.pila,da.produccion);
		rastreo(da.cadena,da.pila);
	}	
}
```

**Explicacion:** Es una funcion recursiva que se llama varias veces, si el primer caracter de str es # el programa finaliza, si por el contrario es 0 significa que hay un error, sino cumple ningunas imprime el valor de da, que recoge de la funcion get_rastreo, dando como parametro str y pila, los imprime por consola y vuelve a llamarse a si mismo, pero con los parametros de da.cadena y da.pila
