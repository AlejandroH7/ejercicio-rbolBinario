// Representa a un empleado en la empresa.
class Empleado {
  int id; // id del empleado.
  String nombre; // Nombre del empleado.

  // Constructor para crear un empleado con su id y nombre.
  Empleado(this.id, this.nombre);
}

// Representa un nodo del árbol binario.
class Nodo {
  Empleado empleado; // Cada nodo almacena un empleado.
  Nodo? izquierdo; // Referencia al subordinado izquierdo.
  Nodo? derecho; // Referencia al subordinado derecho.

  // Constructor para crear un nodo con un empleado y sin hijos inicialmente.
  Nodo(this.empleado);
}

// Clase que representa el Árbol Binario de empleados. (encargada de manejar la estructura del árbol binario de empleados)
class ArbolBinario {
  Nodo?
  raiz; // El primer empleado  será la raíz del árbol. (raiz es una varibale de tipo Nodo?)

  // Método para insertar un nuevo empleado en el árbol.
  void insertar(int id, String nombre) {
    Empleado nuevoEmpleado = Empleado(id, nombre); // Se crea el empleado.
    raiz = _insertarRecursivo(
      raiz,
      nuevoEmpleado,
    ); // Se llama al método recursivo.
  }

  // Método recursivo para encontrar la posición correcta y agregar el nodo.
  Nodo _insertarRecursivo(Nodo? nodo, Empleado empleado) {
    if (nodo == null) {
      return Nodo(empleado); // Si el nodo está vacío, se inserta aquí.
    }

    // Si el nuevo ID es menor, se inserta a la izquierda.
    if (empleado.id < nodo.empleado.id) {
      nodo.izquierdo = _insertarRecursivo(nodo.izquierdo, empleado);
    }
    // Si el nuevo ID es mayor, inserta a la derecha.
    else {
      nodo.derecho = _insertarRecursivo(nodo.derecho, empleado);
    }

    return nodo; // Retorna el nodo modificado.
  }

  // Método para recorrer el árbol en **Preorden** (raíz → izquierda → derecha).
  void preorden() {
    print("Recorrido Preorden:");
    _preordenRecursivo(raiz);
    print("");
  }

  void _preordenRecursivo(Nodo? nodo) {
    if (nodo != null) {
      print(
        "${nodo.empleado.id}: ${nodo.empleado.nombre}",
      ); // Imprime el nodo actual.
      _preordenRecursivo(
        nodo.izquierdo,
      ); // Llamada recursiva al hijo izquierdo.
      _preordenRecursivo(nodo.derecho); // Llamada recursiva al hijo derecho.
    }
  }

  // Método para recorrer el árbol en **Inorden** (izquierda → raíz → derecha).
  void inorden() {
    print("Recorrido Inorden:");
    _inordenRecursivo(raiz);
    print("");
  }

  void _inordenRecursivo(Nodo? nodo) {
    if (nodo != null) {
      _inordenRecursivo(nodo.izquierdo); // Primero, recorre el hijo izquierdo.
      print(
        "${nodo.empleado.id}: ${nodo.empleado.nombre}",
      ); // Luego imprime la raíz.
      _inordenRecursivo(nodo.derecho); // Finalmente, recorre el hijo derecho.
    }
  }

  // Método para recorrer el árbol en **Postorden** (izquierda → derecha → raíz).
  void postorden() {
    print("Recorrido Postorden:");
    _postordenRecursivo(raiz);
    print("");
  }

  void _postordenRecursivo(Nodo? nodo) {
    if (nodo != null) {
      _postordenRecursivo(
        nodo.izquierdo,
      ); // Primero, recorre el hijo izquierdo.
      _postordenRecursivo(nodo.derecho); // Luego, recorre el hijo derecho.
      print(
        "${nodo.empleado.id}: ${nodo.empleado.nombre}",
      ); // Finalmente, imprime la raíz.
    }
  }
}

// Función principal (main) para probar el código.
void main() {
  // Se crea un árbol binario.
  ArbolBinario empresa = ArbolBinario();

  // Se agregan  empleados con sus ID y nombres.
  empresa.insertar(50, "Alejandro");
  empresa.insertar(30, "Amy");
  empresa.insertar(70, "Rafael");
  empresa.insertar(20, "Kristal");
  empresa.insertar(40, "Brandon");
  empresa.insertar(60, "Ana");
  empresa.insertar(80, "Bradley");

  //Se muestra la jerarquía con los tres recorridos.
  empresa.preorden();
  empresa.inorden();
  empresa.postorden();
}
