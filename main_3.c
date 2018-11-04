#include<stdio.h>
#include<string.h>
#include <stdlib.h>

#define MAX 20
#define TRUE 1
#define FALSE 0
#define MAXSTRING 20
#define MAXVUELTAS 4
#define DEFAULT 8

//creacion de la estructura terminal
struct terminal {
	char nombre[1];
	char termina[MAX];
	int len;
};

//creacion de la estructura datos, con prefijo typedef
typedef struct datos{
	char *cadena;
	char *pila;
	char *produccion;
} datos;

//funciones utilizadas en el programa
int identificador(char letra);
void conjunto_primero(void);
void get_datos(void);
char *getterminal(char name, char meta);
void get_tabla(void);datos get_rastreo(char* cadena,char* pila);
void rastreo(char *str, char* pila);
void programa(void);

int lon=0;
int nvueltas=0;

struct terminal conjunto[MAX];



//idenficidador de mayusculas y minisculas
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

//conjunto primero 


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

			for(j=0;j<lon;j++)
			{
				//si
				if(conjunto[i].termina[0]==conjunto[j].nombre[0] && identificador(conjunto[j].termina[0])==FALSE)
				{
					printf("Primero de %c %c \n",conjunto[i].nombre[0],conjunto[j].termina[0]);
				}
				else if(conjunto[i].termina[0]==conjunto[j].nombre[0] && identificador(conjunto[j].termina[0])==TRUE)
				{
					for(k=0;k<lon;k++)
					{
						if(conjunto[j].termina[0]==conjunto[k].nombre[0] && identificador(conjunto[k].termina[0])==FALSE)
						{
							printf("Primero de %c %c \n",conjunto[i].nombre[0],conjunto[k].termina[0]);
						}
					}
				}
			}
		}
		//si A es minuscula
		else
		{
			printf("Primero de %c %c \n",conjunto[i].nombre[0],conjunto[i].termina[0]);
		}
	}

	printf("\n");
}


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
			if(conjunto[i].nombre[0]==name_terminal && conjunto[i].termina[0]==meta && identificador(conjunto[i].termina[0])==FALSE)
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

				if(conjunto[valor].len==1)
				{
					value[4]=conjunto[valor].termina[0];
					value[5]=' ';
					value[6]= ')' ;
				}
				else
				{
					
					for(k=0;k<conjunto[valor].len;k++)
					{
						value[4+k]=conjunto[valor].termina[k];
					}

					value[conjunto[valor].len+4]= ')' ;
				}


				

				return value;
			}
			else if(conjunto[i].nombre[0]==name_terminal && identificador(conjunto[i].termina[0])==TRUE)
			{
				//si coincide pero es mayuscula lo almacena en encontrado
				if(contador==0)
				{
					valor=i;
				}

				encontrado=conjunto[i].termina[0];
			}

		}
		//encontrado pasaria a ser la nueva busqueda : S->Ab   ... primero busca S, encontro A, ahora busca como A
		name_terminal=encontrado;
	}
	return "0";
}

void get_tabla(void)
{
	printf("\nTabla de la funcion accion\n");
	printf("\ta\tb\tc\td\te\t#\n");
	printf("S\t%s\t%s\t%s\t%s\t%s\t0\n",getterminal('S','a'),getterminal('S','b'),getterminal('S','c'),getterminal('S','d'),getterminal('S','e'));
	printf("A\t%s\t%s\t%s\t%s\t%s\t0\n",getterminal('A','a'),getterminal('A','b'),getterminal('A','c'),getterminal('A','d'),getterminal('A','e'));
	printf("B\t%s\t%s\t%s\t%s\t%s\t0\n",getterminal('B','a'),getterminal('B','b'),getterminal('B','c'),getterminal('B','d'),getterminal('B','e'));
	printf("C\t%s\t%s\t%s\t%s\t%s\t0\n",getterminal('C','a'),getterminal('C','b'),getterminal('C','c'),getterminal('C','d'),getterminal('C','e'));

	printf("a\t%s\t%s\t%s\t%s\t%s\t0\n",getterminal('a','a'),getterminal('a','b'),getterminal('a','c'),getterminal('a','d'),getterminal('a','e'));
	printf("b\t%s\t%s\t%s\t%s\t%s\t0\n",getterminal('b','a'),getterminal('b','b'),getterminal('b','c'),getterminal('b','d'),getterminal('b','e'));
	printf("c\t%s\t%s\t%s\t%s\t%s\t0\n",getterminal('c','a'),getterminal('c','b'),getterminal('c','c'),getterminal('c','d'),getterminal('c','e'));
	printf("d\t%s\t%s\t%s\t%s\t%s\t0\n",getterminal('d','a'),getterminal('d','b'),getterminal('d','c'),getterminal('d','d'),getterminal('d','e'));
	printf("e\t%s\t%s\t%s\t%s\t%s\t0\n",getterminal('e','a'),getterminal('e','b'),getterminal('e','c'),getterminal('e','d'),getterminal('e','e'));
	printf("#\t0\t0\t0\t0\t0\tACEPTAR\n");
}

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
				if(conjunto[i].nombre[0]==meta && conjunto[i].termina[0]==cadena[0] && identificador(conjunto[i].termina[0])==FALSE)
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

					if(conjunto[valor].len==1)
					{
						da.produccion[4]=conjunto[valor].termina[0];
						da.produccion[5]=' ';
						da.produccion[6]= ')' ;
					}
					else
					{
						
						for(k=0;k<conjunto[valor].len;k++)
						{
							da.produccion[4+k]=conjunto[valor].termina[k];
						}

						da.produccion[conjunto[valor].len+4]= ')' ;
					}

					//cadena

					da.cadena=malloc(MAXSTRING);
					da.cadena=cadena;

					//pila

					da.pila=malloc(MAXSTRING);
					
					for(j=0;j<conjunto[valor].len;j++)
					{
						da.pila[j]=conjunto[valor].termina[j];
					}

					for(j=0;j<strlen(pila);j++)
					{
						da.pila[j+conjunto[valor].len]=pila[j+1];
					}




					return da;
				}
				else if(conjunto[i].nombre[0]==meta && identificador(conjunto[i].termina[0])==TRUE)
				{
					//si coincide pero es mayuscula lo almacena en encontrado
					if(contador==0)
					{
						valor=i;
					}

					encontrado=conjunto[i].termina[0];
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
		
		//cadena
		da.cadena=malloc(MAXSTRING);

		for(j=0;j<strlen(cadena);j++)
		{
			da.cadena[j]=cadena[j+1];
		}
		
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

void programa(void)
{
	char cadena[MAXSTRING];
	char continuar;
	char n;
	char v;

	printf("Ingrese cantidad : ");
	scanf(" %c", &n);
	if(isdigit(n))
	{
		lon=atoi(&n);
	}
	else
	{
		printf("Ha ingresado un numero invalido, se usara por defecto el numero 8\n");
		lon=DEFAULT;
	}

	printf("Ingrese cantidad de vueltas: ");
	scanf(" %c", &v);
	if(isdigit(v))
	{
		nvueltas=atoi(&v);
	}
	else
	{
		printf("Ha ingresado un numero invalido, se usara por defecto el numero 4\n");
		lon=DEFAULT;
	}


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
	printf("%s\t\t\t%s\t%s\n",cadena,"S#","lambda");
	rastreo(cadena, "S#");

	/*printf("\n Presione Y/N para reiniciar o salir? ");
	scanf(" %c",continuar);

	if(continuar=='y' || continuar=='Y')
	{
		programa();
	}*/
}

int main()
{
	programa();
	//para no salir
	getch();
	return 0;
}