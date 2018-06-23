Integrantes: Santiago Figueroa McIntyre
 			 María Pía Sánchez Gutiérrez
 			 
MODO DE USO
Para poder usar el lenguaje SANTIAGOMAPI usted debe indicar el inicio y el fin del programa con los comandos "<<<" y ">>>", respectivamente.
Luego, para poder asignarle un valor a una variable, se debe escribir:
	 -------------------------------------------------------------------------------
	1|<<<
	2|Sabemos_que nombreVariable es valorAsignado
	3|>>>
	 -------------------------------------------------------------------------------
"nombreVariable" sería el nombre que uno le quiere asignar a la variable, y valorAsignado,  el valor que se le quiere dar a dicha variable.
Las variales solo pueden ser de tipo numerica.
Para imprimir en consola, ya se una variable o un string, se debe escribir el comando "mostrar" y luego poner el nombre de la variable o el string entre comillas. Ejemplo:
Codigo:
	 -------------------------------------------------------------------------------
	1|<<<
	2|Sabemos_que nombreVariable es 1
	3|mostrar "hola"
	4|mostrar nombreVariable
	5|>>>
	 -------------------------------------------------------------------------------
Consola:
	 -------------------------------------------------------------------------------
	 |Bienvenido. A continuacion vera los resultados que usted escribio en el codigo
	 |"hola"
	 |1.00
	 -------------------------------------------------------------------------------

En este lenguaje se pueden sumar dos variables con el comando "sumar", o se le puede sumar uno a la variable con el comando "mas_uno", el cual sería el equivalente al "++" del lenguaje C. Además, se puede multiplicar y restar con el comando "multiplicar" y "restar", respectivamente.
También, la condicional "IF" se puede usar. El comando para ello sería "Si_pasa_que", con el cual se puede condicionar una equivalencia, con el comando "es_igual_a", o condicionar si una variable o número es mayor o menor a otro, con los comandos "es_mayor_a" y "es_menor_a", respectivamente. Luego de la condicion, se debe poner el comando "luego" y una sentancia, la cual uno quiere que se cumpla si la condicion es verdadera. Por ejemplo:
Código:
	 -------------------------------------------------------------------------------
	1|<<<
	2|Si_pasa_que 2 es_mayor_a 1 mostrar "Dos es mayor a uno"
	3|Si_pasa_que 2 es_igual_a 2 mostrar "Dos equivale a dos"
	4|Si_pasa_que 2 es_menor_a 1 mostrar "Dos es menor a uno"
	5|>>>
	 -------------------------------------------------------------------------------
Consola:
	 -------------------------------------------------------------------------------
	 |Bienvenido. A continuacion vera los resultados que usted escribio en el codigo
	 |"Dos es mayor a uno"
	 |"Dos es equivale a dos"
	 |"Uno es menor a dos"
	 |(Falso)
	 -------------------------------------------------------------------------------
Como podemos ver, si la condicion es falsa, entonces imprime "(Falso)".

El ciclo "FOR" (con algunas limitaciones) no se queda atrás en este lenguaje, y para usarlo, se debe ocupar el comando "Para_cada_numero_menor_a". Este ciclo imprime o suma la cantidad de veces que uno quiera. Por ejemplo:
Código:
	 -------------------------------------------------------------------------------
	1|<<<
	2|Sabemos_que x es 1
	3|Para_cada_numero_menor_a <-3-> mostrar "Hola mundo"
	4|Para_cada_numero_menor_a <-3-> x mas_uno
	5|mostrar x
	6|>>>
	 -------------------------------------------------------------------------------
Consola:
	 -------------------------------------------------------------------------------
	 |Bienvenido. A continuacion vera los resultados que usted escribio en el codigo
	 |"Hola mundo"
	 |"Hola mundo"
	 |"Hola mundo"
	 |4.00
	 -------------------------------------------------------------------------------

Este lenguaje está pensado para programar de una manera más facil y en español, para sumar valores a las variables.
OBS: solo se puede poner una linea a la condicional "IF" y al ciclo "FOR".

Para poder ejecutar su código, usted deberá en la terminal escribir "Make" y luego "./program < nombredelcodigo.ms". Para ejecutar otro código, usted deberá escribir en la terminal "Make clear" y luego luego "./program < nombredelcodigo2.ms".

