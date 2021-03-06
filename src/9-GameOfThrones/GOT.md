Juego de Tronos

En el continente de Poniente todos los días demasiadas personas dedican tiempo a generar complots para derrocar reyes, ganar tierras, o por mero entretenimiento. Y aunque cuentan con ejércitos, intrigas y dragones, les está faltando un sistema informático que los ayude a planificar sus conspiraciones.  

A - Personajes


En primer lugar nos interesa modelar a los personajes;  nuestros analistasinformantes nos cuentan que de cada uno de ellos sabemos varias cosas:
* La casa (familia) a la que pertenece. De esta conocemos su patrimonio (una cantidad de dinero) y el nombre de la ciudad de la cual proviene y sus miembros.
* Sus cónyuges (sí, muchos).

Las casas imponen restricciones respecto de con quien puede casarse un miembro de ésta: Por ejemplo:
* La casa Lannister prohíbe la poligamia: un personaje Lannister debe tener una sola pareja
* La casa Stark prohíbe el casamiento entre miembros de la misma casa
* La casa de la Guardia de la Noche prohíbe todo tipo de casamiento

Se pide:
1. Saber si una casa admite que un personaje de ésta se case con otro. 
2. Saber si dos personajes se pueden casar, lo que implica que cada uno le pregunte a su casa si admite el casamiento
3. Casar a dos personajes, y hacer que el casamiento falle, si no se puede realizar. 
4. Saber si una casa es rica, es decir, tiene más de 1.000 de monedas de oro
5. Saber el patrimonio de un personaje, equivalente al patrimonio de su casa dividido por su cantidad de miembros 


B - Acompañantes

Los personajes, naturalmente, también pueden morir. Por eso de cada personaje sabemos si está vivo o no. Dado que ningún personaje quiere morir joven, muchas veces estos son acompañados en sus viajes por animales, como lobos o dragones, u otros personajes.


Se pide: 
1. Saber si un personaje está solo, es decir, si no tiene acompañantes
2. Saber los aliados de un personaje, esto es, sus acompañantes, sus cónyuges y los miembros de su casa


3. Saber si  un personaje es peligroso: un personaje es peligroso cuando está vivo y 
    a. Entre todos sus aliados suman 10.000 de monedas de oro, o bien
    b. Todos sus cónyuges son de casa rica
    c. Tiene al menos una alianza con alguien peligroso. 

Considerar que los dragones siempre son peligrosos, y los lobos sólo si son huargos. Ningún animal tiene dinero.


C - Conspiraciones

Finalmente, tenemos que modelar las conspiraciones. Una conspiración siempre se organiza en contra de un personaje, y tiene por objetivo volverlo menos peligroso. Además, en ésta participan uno o más complotados, cada uno de los cuales realizará alguna acción por la causa, que varía según su personalidad: 

* Sutiles: Tratan de casar a la persona objetivo con un algún integrante vivo y soltero de la casa más pobre. Si la persona no se puede casar (según lo visto anteriormente), o no hay nadie con quien casar al personaje, la acción debe fallar.
* Asesinos: matan al personaje
* Asesinos precavidos: son asesinos que sólo hacen su acción si el personaje objetivo está solo. De lo contrario no hacen nada.
* Disipados: se encargan de que el personaje derroche un cierto porcentaje de la fortuna de su casa. Ese porcentaje es igual para todos los disipados. 
* Miedosos: sólo apoyan moralmente la conspiración pero no realizan ninguna acción concreta

	
Se pide: 
1. Hacer un constructor que permita crear una conspiración, dado un personaje objetivo y una colección de complotados. Tener en cuenta que una conspiración sólo se puede crear cuando el personaje objetivo es peligroso
2. Saber cuantos traidores hay en una conspiración, es decir, cuántos de los complotados son aliados del personaje objetivo
3. Ejecutar la conspiración: hacer que cada complotado ejecute su acción conspirativa contra el objetivo
4. Saber si el objetivo de la conspiración fue cumplido: si la conspiración se ejecutó y el personaje objetivo ya no es peligroso. 
