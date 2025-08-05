## Classe FormaGeometrica
```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClasseAbstrata;

/**
 *
 * @author laboratorio
 */
abstract class FormaGeometrica {

    public String descricao;

    abstract float calcularArea();

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

}

```

## Classe Quadrado
```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClasseAbstrata;

/**
 *
 * @author laboratorio
 */
public class Quadrado extends FormaGeometrica {

    public float lado;

    @Override
    float calcularArea() {
        float area;
        area = lado * lado;
        return area;
    }

}

```

## Classe Retangulo
```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClasseAbstrata;

/**
 *
 * @author laboratorio
 */
public class Retangulo extends FormaGeometrica {

    float base;
    float altura;

    @Override
    float calcularArea() {
        float area = base * altura;
        return area;
    }

}

```

## Classe Triangulo
```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClasseAbstrata;

/**
 *
 * @author laboratorio
 */
public class Triangulo extends FormaGeometrica {

    float base;
    float altura;

    @Override
    float calcularArea() {
        float area;
        area = (base * altura) / 2;
        return area;
    }

}

```

## Classe Principal
```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClasseAbstrata;

/**
 *
 * @author laboratorio
 */
public class Principal {

    public static void main(String[] args) {
        Quadrado q = new Quadrado();
        q.setDescricao("Quadrado"); // está na classe abstrata
        q.lado = 7;
        System.out.println("Área do  " + q.getDescricao() + ": " + q.calcularArea());

        Triangulo t = new Triangulo();
        t.base = 3;
        t.altura = 4;
        t.setDescricao("Triangulo");
        System.out.println("Área do  " + t.getDescricao() + ": " + t.calcularArea());

        Retangulo r = new Retangulo();
        r.base = 3;
        r.altura = 4;
        r.setDescricao("Retangulo");
        System.out.println("Área do " + r.getDescricao() + ": " + r.calcularArea());

    }
}

```
