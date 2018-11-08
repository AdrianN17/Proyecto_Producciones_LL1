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

Hecho para fines academicos.

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
* busqueda_primero
* conjunto_primero
* get_datos
* getterminal
* get_tabla(void)
* get_rastreo
* rastreo
* programa
* restart--sin usar todavia

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
		scanf("%s",conjunto[i].cadena);

		//coger tamaño
		conjunto[i].len=strlen(conjunto[i].cadena);
		printf("\n");	
	}

	//impresion de gramatica
	for(i=0;i<lon;i++)
	{
		printf(" %c -> %s \n",conjunto[i].nombre[0],conjunto[i].cadena);
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
			if(conjunto[i].nombre[0]==busqueda && identificador(conjunto[i].cadena[0])==FALSE)
			{
				printf("Primero de %c %c \n",letra,conjunto[i].cadena[0]);
				return 0;
			}
			else if(conjunto[i].nombre[0]==busqueda && identificador(conjunto[i].cadena[0])==TRUE)
			{
				encontrado=conjunto[i].cadena[0];
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
		if(identificador(conjunto[i].cadena[0])==TRUE)
		{
			busqueda_primero(conjunto[i].nombre[0]);
		}
		//si A es minuscula
		else
		{
			printf("Primero de %c %c \n",conjunto[i].nombre[0],conjunto[i].cadena[0]);
		}
	}

	printf("\n");
}
```
Explicacion: Engloba varios conjuntos primero en un ciclo for de i, si cumple las condicionales:
Si A es mayuscula entonces va a la funcion busqueda_primero con el parametro nombre, sino imprine el valor por consola

```c
void get_tabla(void)
{
	int i;
	int j;
	char nt;
	char t;


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

Explicacion: Genera una tabla mediante iteradores, llamando multiples veces a la funcion getterminal y dando como parametros el caracter de la fila y columna

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

Explicacion: Se recibe por parametro name y meta,se inicializan las variables, tal como busqueda primero, utiliza una variable encontrado y una name_terminal que sera editable a traves del tiempo (inicialmente name_terminal=name), un integer valor y un validador que esta en false

Si se cumplen las siguientes condicional:

Si name es minuscula y es igual a meta ( a y a==a) entonces retorna E_C

	Ahora entra a un for, en el cual este valida si pertenece al array gramatica, si no existe en los no terminales entonces validador es TRUE y se sale del programa retornando 0

	Ejemplo: ingreso S->a A->b pero yo busco getterminal(E,a) pero e no existe en mi gramatica, en este caso retorno 0

Si el programa continua hasta este momento ingresa a un iterador de numero de vueltas (nvueltas)

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

Explicacion: Se recibe por parametros una cadena y una pila, se inicializa las variables, la meta es el primer caracter de la pila
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

Explicacion: Es una funcion recursiva que se llama varias veces, si el primer caracter de str es # el programa finaliza, si por el contrario es 0 significa que hay un error, sino cumple ningunas imprime el valor de da, que recoge de la funcion get_rastreo, dando como parametro str y pila, los imprime por consola y vuelve a llamarse a si mismo, pero con los parametros de da.cadena y da.pila
