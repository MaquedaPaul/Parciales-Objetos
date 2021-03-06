Estamos en el año 50 antes de Jesucristo. Toda la Galia está ocupada por los romanos… ¿Toda? ¡No! Una aldea poblada por irreductibles galos resiste todavía y siempre al invasor…

Se quieren modelar batallas entre galos y romanos, teniendo en cuenta que las personas pueden tomar pociones mágicas para mejorar su desempeño y unirse con otros guerreros para enfrentarse a sus enemigos en ejércitos.


La poción mágica
Una poción se prepara mezclando diferentes ingredientes y el efecto de la poción dependerá de fuerza y resistencia de la persona.

De momento nos interesa modelar los siguientes ingredientes, pero deben poder agregarse muchos más con facilidad:

- Dulce de leche: aumenta la fuerza en 10 unidades. Si la persona estaba fuera de combate, la revive con 2 puntos de resistencia.
- Puñado de hongos silvestres: aumenta la fuerza en tantas unidades como hongos haya en el puñado. Si son más de 5 además le disminuye a la mitad la resistencia.
- Grog: vuelve a quien la ingiera tantas veces más fuerte como ingredientes tenga la poción.
- Grog XD: mismo efecto que el Grog pero además duplica la resistencia.


1. 
    a. Conocer el poder de una persona, que se calcula como el producto entre su fuerza y su resistencia.
    b. Hacer que una persona reciba una cantidad de daño, disminuyendo su resistencia en esa cantidad. El mínimo de resistencia que puede tener una persona es 0, quedando fuera de combate.

2. Hacer que una persona tome una poción mágica modificando su resistencia y fuerza de acuerdo a lo indicado anteriormente.


La unión hace a la fuerza
Las personas se pueden organizar en ejércitos para las batallas. Los ejércitos pueden luchar contra otros ejércitos o también contra personas individuales.

3. Calcular el poder de un ejército, siendo éste la sumatoria de los poderes de todos sus integrantes que no están fuera de combate.

4. Hacer que un ejército reciba un daño determinado, que se reparte en partes iguales entre los integrantes que van adelante. Los que van adelante son los 10 más poderosos (si son menos de 10 van todos adelante).
Nota: se puede usar para este punto el mensaje de colecciones copyFrom:to: que recibe dos índices y retorna la colección con los elementos de la receptora entre esos índices.

5. Hacer que un ejército pelee contra un enemigo (otro ejército o una persona). Cuando esto pasa, el menos poderoso recibe tanto daño como diferencia de poder haya con el contrincante. Pelear contra alguien no debe ser posible para ejércitos que tengan a todos su integrantes fuera de combate.

6. Existen ejércitos romanos denominados “legiones” que, a diferencia de los ejércitos normales, pueden adoptar distintas formaciones modificando sus características básicas en el momento en que se usan:
* Formación “tortuga”: netamente defensiva, el poder de la legión es 0 pero ningún integrante recibe daño independientemente del daño recibido por la legión.
* Formación “en cuadro”: mantiene el mismo comportamiento que los ejércitos comunes en todo sentido, salvo por la cantidad de integrantes que van adelante. Esta cantidad se determina al armar la formación.
* Formación “frontem allargate”: el poder de la legión es un 10% por encima de lo normal, la mitad de los integrantes van adelante pero el daño a recibir se duplica.

Integrar a las legiones con sus posibles formaciones al sistema de modo que pueda seguir funcionando todo lo anterior también para legiones.
Tener en cuenta que la legión debe poder cambiar de formación en cualquier momento de la batalla arbitrariamente.
Si al recibir daño queda con un poder por debajo de un mínimo preestablecido (igual para todas las legiones independientemente de la formación adoptada) debe cambiar su formación a tortuga automáticamente.

Resolver los requerimientos explicados anteriormente con código, diagrama de clases y workspace mostrando el envío de los mensajes que los resuelven.

Para el punto 6 también incluir en el workspace la creación de una legión con formación en cuadro que manda 20 guerreros adelante.
