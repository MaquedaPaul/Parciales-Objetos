Dragon Ball Z - El Torneo

El destino de la tierra corre peligro frente a diferentes villanos. Sin embargo, un grupo de guerreros se encarga de defender a la humanidad de todo aquel que planee hacerle daño. 

Como la onda de los videojuegos pegó mucho, nos pidieron que modelemos un juego simple de combates entre personajes de Dragon Ball Z. El dominio es el siguiente:

Los guerreros tienen un potencial ofensivo, con el cual atacan, un nivel de experiencia y un nivel de energía, que llega a cero cuando mueren. 

Cuando un guerrero ataca al otro, lo hace con todo su potencial ofensivo. Tras el ataque, la energía del guerrero atacado disminuye en un valor igual al 10% del potencial ofensivo del atacante.  Es decir: Si Goku tiene un potencial ofensivo de 100 puntos y ataca a Vegeta, que tiene un nivel de energía de 5000, tras el ataque, el nivel de energía de vegeta será de 4990. Además, al ser atacado, un guerrero aumenta su experiencia en un punto.

Cuando un guerrero come una semilla del ermitaño su nivel de energía es restaurado al original.


1) Se pide modelar con un sistema el dominio dado.


Como parece que el juego tiene éxito, (y para tener algo del juego que se pueda desbloquear por plata) se decide introducir la noción de traje.

Cada Guerrero siempre posee un traje, que puede ser elegido antes de cada batalla. El daño sufrido por un guerrero al ser atacado dependerá del traje que lleve puesto.

Hay 2 tipos de trajes: 


* Comunes: disminuyen el daño recibido en un porcentaje que depende de cada traje.

* De entrenamiento: no disminuyen el daño recibido, pero aumentan la experiencia del guerrero al doble de lo normal mientras lo tiene puesto, este porcentaje puede cambiar con el tiempo, pero es el mismo para todos los trajes de entrenamiento.


Por ejemplo, en el caso anterior, si Vegeta llevaba puesto un traje cuyo porcentaje de protección era de 3%, su energía habría quedado en 4993.



2) Se pide realizar los cambios necesarios para soportar los nuevos requerimientos. 


Sin embargo la gente parece no estar comprando suficientes trajes, por lo que se nos pide que los trajes dejen de ser eternos y se introduce el concepto de desgaste. Todos los trajes nuevos tienen un nivel de desgaste, que comienza en cero.
Cada vez que un traje es usado (es decir cada vez que atacan a un guerrero que lo posee), este nivel aumenta en 5 unidades. Al llegar a las 100 unidades, el traje está gastado y no puede usarse más, por lo cual no protege al guerrero. 

3) Realizar los cambios necesarios para que un traje se gaste y poder decir si un traje está gastado o no. 


Finalmente se descubre que el problema es que un traje entero podía llegar a ser muy caro, por lo que se decide introducir un nuevo tipo de trajes:

* Modularizados: estos trajes están conformados por un conjunto de piezas. Cada pieza tiene un porcentaje de resistencia y un valor de desgaste, y se la considera "gastada" cuando tiene un desgaste igual o mayor a 20 unidades. 

Al recibir un ataque, el daño disminuye en una cantidad de unidades igual a la sumatoria de las resistencias de cada pieza que no esté gastada. Un traje Modularizado está gastado si todas sus piezas están gastadas. 

Los trajes modularizados aumentan la experiencia en base al porcentaje de piezas que tenga que no estén gastadas, ejemplos:
* Tengo 10 piezas, y tengo 0 gastadas, entonces la experiencia es aumentada al 100% [1 punto aumenta].
* Tengo 10 piezas, y tengo 5 gastadas, entonces la experiencia es aumentada en un 50% [0.5 punto aumenta].
* Tengo 10 piezas, y tengo 2 gastadas, entonces la experiencia es aumentada en un 80% [0.8 punto aumenta].

Por ejemplo, si Vegeta lleva un traje Modularizado con dos piezas cuyas resistencias son 1 y 4, su energía final será 4995.

4) Se pide implementar los trajes modularizados.




Después de ponernos a viciar un poco con el Dragon Ball de Sega, nos dimos cuenta que nos faltaba modelar, a los super saiyans, quién querría perderse las mechas doradas de Goku, en sus distintos niveles?

Solos los Saiyan pueden convertirse. Cuando un Saiyan se convierte en Super Saiyan su poder de ataque aumenta en un 50% y la energía que le quita un golpe es dependiente del nivel en que se encuentra:

* Nivel 1 -> aumento de resistencia en 5%.
* Nivel 2 -> aumento de resistencia en 7%.
* Nivel 3 -> aumento de resistencia en 15%.

Un Saiyan puede volver a su estado original cuando desee o su nivel de energía esté por debajo de un 1% del original. Además cuando se come una semilla del ermitaño su poder de ataque aumenta un 5% del original.

5) Modelar los SuperSaiyan


Para que las peleas empiecen en el torneo, primero deben seleccionarse los jugadores que participaran de él, según la modalidad de juego que definamos, serán seleccionados en base a criterios distintos. Las modalidades disponibles son las siguientes:

* PowerIsBest: se seleccionarán los 16 peleadores con más poder de ataque.
* Funny: se seleccionarán los 16 peleadores con más elementos en sus trajes (un traje enterizo cuenta como 1 pieza, en cambio los trajes modularizados suman 1 por cada pieza).
* Surprise: se seleccionarán 16 peleadores al azar.

6) Modelar los distintos tipos de torneo.


Notas:

* Se deberá entregar toda la codificación y diagrama de clases de toda la solución.
* Deberá quedar claro qué mensaje es el primero a ser enviado para resolver cada requerimiento.
* Aplicar los conceptos vistos en el paradigma y buenas prácticas de desarrollo.

