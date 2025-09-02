# Revisão

## Código 1
### Pessoa
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Codigo1;

/**
 *
 * @author laboratorio
 */
public class Pessoa {
    private String nome;
    private int idade;

    public Pessoa(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }
    
    
}

```
### Principal
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Codigo1;

/**
 *
 * @author laboratorio
 */
public class Principal {
    public static void main(String[] args) {
        Pessoa p = new Pessoa("Ãric", 25);
        
        System.out.println("Nome: " + p.getNome());
        System.out.println("Idade: " + p.getIdade());
                
                
    }
}

```
## Código 2
### Aluno
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Codigo2;

/**
 *
 * @author laboratorio
 */
public class Aluno {
    private String nome;
    private double nota1;
    private double nota2;
     
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getNota1() {
        return nota1;
    }

    public void setNota1(double nota1) {
        this.nota1 = nota1;
    }

    public double getNota2() {
        return nota2;
    }

    public void setNota2(double nota2) {
        this.nota2 = nota2;
    }
    
    public double calculaMedia(){
        return ((nota1+nota2)/2);
    }
}

```
### Pessoa
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Codigo2;

/**
 *
 * @author laboratorio
 */
public class Pessoa {
    public static void main(String[] args) {
        
        Aluno a = new Aluno();
        
        a.setNome("Eric");
        a.setNota1(7);
        a.setNota2(8.5);
        System.out.println("Nome: " + a.getNome());
        System.out.println("Media: " + a.calculaMedia());
    }
}

```

## Código 3
### Carro
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Codigo3;

/**
 *
 * @author laboratorio
 */
public class Carro {
    protected String nome;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public void exibirMsg() {
        System.out.println("Estou na classe Carro");
    }
}

```
### Onibus
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Codigo3;

/**
 *
 * @author laboratorio
 */
public class Onibus extends Carro {
    protected String modelo;

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    
    
}

```
### Principal
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Codigo3;

/**
 *
 * @author laboratorio
 */
public class Principal {
    public static void main(String[] args) {
        Carro c = new Carro();
        c.setNome("Carro 1");
        System.out.println("Nome do carro: " + c.getNome());
        c.exibirMsg();
        
        Onibus o = new Onibus();
        o.setNome("Onibus 1");
        o.setModelo("Modelo X");
        System.out.println("Nome do onibus: " + o.getNome());
        System.out.println("Modelo do onibus: " + o.getModelo());
        o.exibirMsg();
    }
}

```

## Código 4
### Animal
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Codigo4;

/**
 *
 * @author laboratorio
 */
public class Animal {
    protected String nome;
    protected int idade;
    protected String som;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public String getSom() {
        return som;
    }

    public void setSom(String som) {
        this.som = som;
    }
    
}

```
### Cachorro
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Codigo4;

/**
 *
 * @author laboratorio
 */
public class Cachorro extends Animal {
    protected String raca;
    
    public void latir() {
        System.out.println("Som: " + som);
    }
}

```
### Principal
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Codigo4;

/**
 *
 * @author laboratorio
 */
public class Principal {
    public static void main(String[] args) {
        
    }
}
```

## Código 5
### Cliente
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Codigo5;

/**
 *
 * @author laboratorio
 */
public class Cliente extends Pessoa {
    public String CPF;
    
    @Override //Sobreescrevendo o método
    public void exibirDados() {
        System.out.println("Exibindo os dados do Cliente");
        System.out.println("Nome: " + nome);
        System.out.println("CPF: " + CPF);
    }
}

```
### Pessoa
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Codigo5;

/**
 *
 * @author laboratorio
 */
public class Pessoa {
    public String nome;
    
    public void exibirDados() {
        System.out.println("Nome: " + nome);
    }
}

```
### Principal
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Codigo5;

/**
 *
 * @author laboratorio
 */
public class Principal {
    public static void main(String[] args) {
        Pessoa p = new Pessoa();
        
        p.nome = "Ricardo";
        System.out.println("Exibindo dados da Pessoa");
        p.exibirDados();
        
        Cliente c = new Cliente();
        c.nome = "Ricardo da Silva";
        c.CPF = "123456789-04";
        c.exibirDados();
    }
}

```

## Exercício 1
### FormaGeometrica
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Exercico1;

/**
 *
 * @author laboratorio
 */
public class FormaGeometrica { // Quadrado
    public double lado;
    public double area;
    
    public void calcularArea() {
        area = lado * lado;
        System.out.println("Area do quadrado" + area);
    }
}

```

### Principal
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Exercico1;

/**
 *
 * @author laboratorio
 */
public class Principal {
    public static void main(String[] args) {
        FormaGeometrica quadrado = new FormaGeometrica();
        quadrado.lado = 4;
        quadrado.calcularArea();
        
        Triangulo triangulo = new Triangulo(10, 5);
        triangulo.calcularArea();
    }
}

```

### Triangulo
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Exercico1;

/**
 *
 * @author laboratorio
 */
public class Triangulo extends FormaGeometrica {
    public double base;
    public double altura;

    public Triangulo(double base, double altura) {
        this.base = base;
        this.altura = altura;
    }
    
    public void calcularArea() {
        area = (base * altura) / 2;
        System.out.println("Area do triangulo: " + area);
    }
}

```

## Exercício 2
### Casa
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Exercico2;

/**
 *
 * @author laboratorio
 */
public class Casa {
   public double valorCasa;
   
   public double calcularPreco(int tamanho) {
       return tamanho * valorCasa;
   }
   
   public double calcularPreco(int tamanho, int quartos) {
       return (tamanho * valorCasa) + (quartos * valorCasa);
   }
}

```

### Principal
```
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Exercico2;

/**
 *
 * @author laboratorio
 */
public class Principal {
    public static void main(String[] args) {
        Casa c = new Casa();
        
        double resultado = c.calcularPreco(300);
        System.out.println(resultado);
        
        resultado = c.calcularPreco(0, 0)
        
        
        
        
        System.out.println("Casa 1: " + c.calcularPreco(2));
        System.out.println("Casa 2: " + c.calcularPreco(3, 2));
    }
}

```
