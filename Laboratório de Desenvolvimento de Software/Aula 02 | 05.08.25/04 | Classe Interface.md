## Animal
```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package ClasseInterface;

/**
 *
 * @author laboratorio
 */
interface Animal {
    void emitirSom();
    void movimentar();
}

```

## Cachorro
```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClasseInterface;

/**
 *
 * @author laboratorio
 */
public class Cachorro implements Animal {

    @Override
    public void emitirSom() {
        System.out.println("O cachorro esta latindo");
    }

    @Override
    public void movimentar() {
        System.out.println("O cachorro esta andando");
    }
    
    void morder() {
        System.out.println("O cachorro esta mordendo");
    }
    
}

```

## Gato
```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClasseInterface;

/**
 *
 * @author laboratorio
 */
public class Gato implements Animal {

    @Override
    public void emitirSom() {
        System.out.println("O gato esta miando");
    }

    @Override
    public void movimentar() {
        System.out.println("O gato esta andando");
    }
    
    void arranhar() {
        System.out.println("O gato esta arranhando");
    }
    
}

```

## Principal
```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClasseInterface;

/**
 *
 * @author laboratorio
 */
public class Principal {
    public static void main(String[] args) {
        Cachorro c = new Cachorro();
        c.emitirSom();
        c.movimentar();
        c.morder();
        
        Gato g = new Gato();
        g.emitirSom();
        g.movimentar();
        g.arranhar();
        
        System.out.println("\n--- Teste ---");
        Animal a = new Cachorro();
        a.emitirSom();
        
        Animal b = new Gato();
        b.emitirSom();
    }
}
```
