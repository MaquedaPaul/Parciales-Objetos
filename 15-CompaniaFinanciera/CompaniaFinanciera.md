Compañía Financiera
Una compañía financiera que otorga préstamos necesita
una aplicación que le permita calcular el monto máximo de
dinero que puede prestar a sus clientes.

El monto a prestarle a un cliente depende de varios factores:

Si se trata de un empleado, se le presta un monto equivalente al valor total de sus bienes registrados menos un porcentaje fijado por cada hijo, que actualmente es del 10%, pero podría modificarse en un futuro. Ejemplo: si Juan es un empleado que tiene una casa de 160, un auto de 25, otro bien de 15 y 3 hijos, entonces se le podría prestar 140 (200 – 30%).


Si el cliente es una empresa, se le puede prestar tanto como le permita el organismo que le brinda garantía, que puede ser un fondo de garantía o un pool de empresas. Un fondo de garantía tiene un importe de referencia y el monto a prestar es el doble del mínimo entre dicho importe y el capital social de la empresa. Un pool de empresas permite prestar un monto equivalente a la suma de los capitales sociales de las empresas que lo conforman, cuyos capitales sociales sean mayores al de la empresa que pide el préstamo. Ejemplo: Si la empresa 

Necesito Mosca, con un capital social de 50, tiene como garante al fondo Buitrex que tiene un importe de referencia de 80, puede acceder a un préstamo de 100 (50*2, ya que 50 < 80). Si en cambio tuviera como garante al pool “Soja para todos”, compuesto por SojaSantafesina, de capital social 60, SojaEntrerriana, de 40 y SojaBonaerense, de 90, el préstamo al que podría acceder es de 150 (90+60, ya que 90 > 50 y 60 > 50)



También, la financiera ofrece préstamos para organismos públicos, a quienes les presta como máximo un importe que acuerda directamente con cada organismo, al que se le descuenta un porcentaje de gastos administrativos que depende de dónde se encuentra ubicado dicho organismo.

Si es un organismo del poder ejecutivo nacional, es un 10%; si es de la justicia, un 20%; si se trata de un ente autárquico, sólo es del 5%; si es del GCBA, también es del 10%; etc. Puede que en el futuro estos porcentajes cambien o se agreguen otros criterios para ubicar a los organismos públicos en el complejo aparato estatal. 

Ejemplo: Si el AFSCA, que es un organismo del poder ejecutivo nacional,
tiene acordado un importe de 100, el monto de préstamo al que puede acceder es de 90 (100 - 10%) Además, como un cliente cuando pide un préstamo, puede ser que tenga otros préstamos otorgados anteriormente, se le resta del monto a prestar el total de saldos pendientes de pago de todos los préstamos ya otorgados. Ejemplo: Si un cliente NN, por lo dicho anteriormente, podría recibir un préstamo por 200, pero ya tiene un préstamo anterior del que le falta pagar 50 y otro en el que aún
tiene un saldo de 30, el monto máximo al que puede acceder es de 120. (200 - (50 + 30)) La aplicación debe permitirle a la empresa financiera:


1. Calcular el monto máximo de préstamo que la financiera puede otorgarle a un cliente.

2. Otorgárselo, registrando la fecha actual* y actualizando la información que sea
necesaria.

3. Cobrar a un cliente un importe dado e imputarlo al más antiguo de sus préstamos pendientes de pago. (No hace falta el detalle del pago, sino simplemente permitir
luego calcular el saldo correctamente. Asumir que el importe no es mayor que la deuda)

Se pide realizar:
1. Workspace de prueba.
2. Código de los métodos y todos sus auxiliares (excepto getters/setters)

* Para obtener la fecha actual: Date today.


1. Diagrama de clases, indicando relaciones.