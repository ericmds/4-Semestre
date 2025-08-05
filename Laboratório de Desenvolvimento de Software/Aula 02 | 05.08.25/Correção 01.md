# Correção dos exercícios da aula anterior
## Exercício 01

### Classe FormaGeometrica
```java
package Correcao01;

public class FormaGeometrica {
	public float lado;
	public void calcularArea() {
		float area = lado * lado;
		System.out.println("Área: " + area);
	}
}
```

## Classe Triangulo
```
package Correcao01;

public class Triangulo extends FormaGeometrica {
	public float base;
	public float altura;
	
	@Override
	public void calcularArea() {
		float area = (base * altura) / 2;
		System.out.println("Área do triângulo: " + area);
	}
}
```

## Classe Principal
```java
package Correcao01;

public class Principal {

	public static void main(String[] args) {
		FormaGeometrica quadrado = new FormaGeometrica();
		quadrado.lado = 4;
		quadrado.calcularArea();
		
		Triangulo t = new Triangulo();
		t.lado = 3;
		t.base = 4;
		t.calcularArea();
	}

}
```
