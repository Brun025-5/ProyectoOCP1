# Objetivos
• Implementar un programa usando un lenguaje de nivel medio para comprender la ejecución de las instrucciones llevadas a cabo por el procesador. 

• Investigar nuevas instrucciones para el uso de diferentes tipos y estructuras de datos. 

• Implementar funciones para un mejor comportamiento del código implementado. 

# Descripción
El proyecto consiste en implementar un programa que realice conversiones entre número enteros
decimales y números binarios. El programa debe incluir un menú con las siguientes opciones:
  1. Convertir Decimal a Binario 
  2. Convertir Binario a Decimal
  3. Generar un número aleatorio 

# Implementación
Para la implementación de su proyecto, tome en cuenta lo siguiente: 

  • Deberá validar los datos ingresados por el usuario. 
  
  • En la opción 2 se asumirá que el número binario ingresado por el usuario es de 8 bits. 
  
  • En la opción 3, el programa generará un número aleatorio entre 10 y 50, mostrando el número en decimal junto con su coversión a binario. 

# Entregables
  • Código en ensamblador
  
  • Documento de especificaciones que incluya:
  
  1. Especificaciones de su proyecto.(Requisitos/ pasos para ejecutar)
  2. Capturas de pantalla de su código funcionando.  
  3. Código en C. 
  4. Referencias en formato IEEE.
  
### Documento de Especificaciones para el Código

---

#### **1. Descripción General**
Este programa realiza las siguientes funciones principales:
- Convierte un número decimal (base 10) a binario (8 bits).
- Convierte un número binario (máximo 8 bits) a decimal.
- Genera un número aleatorio entre 10 y 50, y lo convierte a binario.
- Muestra un menú interactivo para seleccionar las opciones anteriores.

El programa valida las entradas del usuario para asegurar que sean apropiadas para cada operación y proporciona mensajes de error en caso de entradas incorrectas.

---

#### **2. Requisitos del Sistema**
- **Sistema Operativo:** Compatible con cualquier SO que soporte C (Linux, Windows, macOS).
- **Compilador:** GCC o cualquier compilador compatible con el estándar C99 o superior.
- **Librerías necesarias:**
  - `<stdio.h>`: Para entrada y salida estándar.
  - `<stdlib.h>`: Para funciones generales como `rand()` y `srand()`.
  - `<stdbool.h>`: Para utilizar valores booleanos (`true` y `false`).
  - `<time.h>`: Para inicializar el generador de números aleatorios con `time()`.

---

#### **3. Pasos para Compilar y Ejecutar**
1. **Guardar el código fuente:**
   Guarde el programa en un archivo llamado `main.c`.

2. **Compilar el programa:**
   Utilice el comando:
   ```bash
   gcc -o programa main.c
   ```

3. **Ejecutar el programa:**
   En la terminal, escriba:
   ```bash
   ./programa
   ```

---

#### **4. Instrucciones de Uso**
1. Al iniciar, se muestra un menú con las siguientes opciones:
   ```
   ------------ MENU ------------
   1. Convertir Decimal a Binario
   2. Convertir Binario a Decimal
   3. Generar un número aleatorio
   4. Salir
   ```

2. **Opción 1: Convertir Decimal a Binario**
   - Introduzca un número decimal entre 0 y 255.
   - El programa validará la entrada y mostrará el equivalente en binario.

3. **Opción 2: Convertir Binario a Decimal**
   - Introduzca un número binario de hasta 8 bits.
   - El programa validará que todos los dígitos sean `0` o `1` y mostrará el equivalente en decimal.

4. **Opción 3: Generar un Número Aleatorio**
   - El programa generará un número aleatorio entre 10 y 50.
   - Mostrará el número y su equivalente en binario.

5. **Opción 4: Salir**
   - Finaliza el programa.

---

#### **5. Detalles de Validación**
- **Entrada no numérica:** Si el usuario introduce texto o caracteres especiales, el programa muestra un mensaje de error y solicita nuevamente la entrada.
- **Rango de números:**
  - Decimal: Entre 0 y 255.
  - Binario: Hasta 8 bits.
- **Formato binario:** Valida que solo se ingresen los dígitos `0` o `1`.

---

#### **6. Ejemplo de Ejecución**
**Entrada:**
```
------------ MENU ------------
1. Convertir Decimal a Binario
2. Convertir Binario a Decimal
3. Generar un número aleatorio
4. Salir
Ingrese una opción: 1
Ingrese un número en base 10: 13
```

**Salida:**
```
El valor 13 en binario es: 00001101
-------------------------------------
```

**Entrada para opción no válida:**
```
Ingrese una opción: x
Se ingresó una opción no válida.
```

---

#### **7. Posibles Errores del Usuario y Respuestas del Programa**
- **Entrada no numérica:**
  - Mensaje: `"Entrada no válida. Por favor ingrese un número."`
- **Decimal fuera de rango (opción 1):**
  - Mensaje: `"Por favor, ingrese un número menor a 255."`
- **Binario con más de 8 bits (opción 2):**
  - Mensaje: `"Por favor, ingrese un número de 8 bits."`
- **Número binario con dígitos distintos de `0` o `1` (opción 2):**
  - Mensaje: `"Por favor, ingrese un número binario."`

---

#### **8. Notas Adicionales**
- El programa utiliza un generador de números aleatorios inicializado con la hora del sistema (`time(NULL)`). Cada ejecución produce números diferentes.
- El uso de `clearBuffer()` asegura que las entradas adicionales o caracteres residuales no interfieran en las siguientes operaciones.
