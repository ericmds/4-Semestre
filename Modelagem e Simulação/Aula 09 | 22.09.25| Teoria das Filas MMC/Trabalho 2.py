# TRABALHO 2 - FILA M/M/C
# ÉRIC MARTINS DA SILVA
"""
Calculadora mínima de Erlang C (P(wait)) em M/M/c 

Símbolos e fórmulas (todas no contexto M/M/c):
- λ (lambda): taxa de chegadas (clientes por unidade de tempo)
- μ (mi): taxa de atendimento de CADA servidor (clientes por unidade de tempo)
- c: número de servidores idênticos

Derivadas:
- a = λ/μ  (Erlangs)  → tráfego oferecido (carga média ofertada ao sistema)
- ρ = a/c = λ/(c μ)   → utilização média por servidor (0 < ρ < 1 para regime estável)

Fórmula de Erlang C (probabilidade de esperar na fila):
            (a^c / c!) * (c / (c − a))
P(wait) = ---------------------------------------------
          Σ_{n=0}^{c−1} (a^n / n!)  +  (a^c / c!) * (c / (c − a))

Observações:
- Estabilidade prática: a < c  (se a ≥ c, a fila “explode” e P(wait) → 1).
- Unidades de tempo em Wq e W são as mesmas usadas em λ e μ (min, h, ...).

A partir de P(wait), demais métricas (opcionais, mostradas aqui para referência):
- Wq = P(wait) / (c μ − λ)               (tempo médio de espera na fila)
- Lq = λ * Wq                            (número médio na fila — Little)
- W  = Wq + 1/μ                          (tempo médio no sistema)
- L  = λ * W                             (número médio no sistema — Little)

"""

from math import factorial

def erlang_c(a: float, c: int) -> float:
    """Retorna P(wait) dado o tráfego oferecido a=λ/μ (Erlangs) e c servidores.
    Observação: para estabilidade prática, é necessário a < c.
    """
    if a < 0 or c <= 0:
        raise ValueError("'a' deve ser >= 0 e 'c' > 0.")
    if a >= c:
        return 1.0  # sistema instável: P(wait) tende a 1
    
    #Formula: P(wait) = [ (a^c / c!) ×(c / (c -a)) ] / [ Σ(a^n / n!) + (a^c / c!) ×(c / (c -a)) ]
    soma = sum((a**n) / factorial(n) for n in range(c))        # Σ_{n=0}^{c-1} a^n/n!
    termo = (a**c) / factorial(c) * (c / (c - a))              # (a^c/c!) * (c/(c-a))
    return termo / (soma + termo)

def ler_float(msg: str) -> float:
    while True:
        try:
            return float(input(msg).replace(',', '.'))
        except ValueError:
            print('Valor inválido. Tente novamente.')

def ler_int(msg: str) -> int:
    while True:
        try:
            v = int(input(msg))
            if v <= 0:
                print('Digite um inteiro > 0.')
            else:
                return v
        except ValueError:
            print('Valor inválido. Tente novamente.')

## Função para calcular wq (tempo médio de espera da fila)
def tempo_medio_fila(p: float, c: float, mu: float, lam: float) -> float:
    wq = p * 1 / (c * mu - lam)
    return wq

## Função para calcular o lq (número médio da fila)
def numero_medio_fila(lam: float, wq: float) -> float:
    lq = lam / wq
    return lq

## Função para calcular o w (tempo médio do sistema)
def tempo_medio_sistema(wq: float, mu: float) -> float:
    w = wq + (1 / mu)
    return w

## Função para calcular o l (número médio no sistema)
def numero_medio_sistema(lam: float, w: float) -> float:
    l = lam * w
    return l

def main():
    print('\n=== Calculadora Erlang C (P(wait)) ===')
    print('1) Entrar com a = λ/μ (Erlangs) e c')
    print('2) Entrar com λ, μ e c')
    opc = input('Escolha (1/2): ').strip()
    
    if opc == '1':
        a = ler_float('Informe a (λ/μ) em Erlangs: ')
        c = ler_int('Informe c (nº de servidores): ')
    elif opc == '2':
        lam = ler_float('Informe λ (taxa de chegadas): ')
        mu  = ler_float('Informe μ (taxa de atendimento por servidor): ')
        c   = ler_int('Informe c (nº de servidores): ')
        if mu <= 0:
            print('μ deve ser > 0. Encerrando.')
            return
        a = lam / mu
        print(f'a = λ/μ = {a:.6f} Erlangs')
    else:
        print('Opção inválida. Encerrando.')
        return

    p = erlang_c(a, c)
    w = tempo_medio_sistema(wq, mu)
    wq = tempo_medio_fila(p, c, mu, lam)
    l = numero_medio_sistema(lam, w)
    lq = numero_medio_fila(lam, wq)

    print(f'\nP(wait) = {p:.6f}  (equivalente a {p*100:.2f}%)')
    if a >= c:
        print('Atenção: a ≥ c ⇒ sistema instável (fila explode).')
    else:
        print('Observação: estabilidade prática exige a < c.')

if __name__ == '__main__':
    while True:
        main()
        denovo = input('\nDeseja calcular novamente? (s/n): ').strip().lower()
        if denovo != 's':
            print('Encerrado.')
            break
