## Classe Casa
```java
package Correcao02;

public class Casa {
	float tamanho;
	
	public void calcularPreco(tamanho) {
		
	}
}

```

## Classe Principal
```java
package Correcao02;

import java.util.Scanner;

public class Principal {
	private void psvm() {
		Scanner sc = new Scanner(System.in);
		int tamanho;
		System.out.println("Digite o tamanho da casa: ");
		tamanho = sc.nextInt();
		Casa c = new Casa();
		
		float retorno = c.calcularPreco(tamanho);
		System.out.println("Uma casa de " + tamanho + " metros custa: " + retorno);
		
		int qtdQuartos;
		System.out.println("Digite a quantidade de quartos: ");
		qtdQuartos = sc.nextInt();
		retorno = c.calcularPreco(tamanho, qtdQuartos);
		System.out.println("Uma casa de " + tamanho + " metros e "+ qtdQuartos +" quartos custa: " + retorno);
		
	}
}	

```
