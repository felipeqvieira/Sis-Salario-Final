# Sistema para Cálculo de Salário
> Programa COBOL que calcula o salário final de um funcionário com base no salário base e no tempo de empresa, usando parágrafos e `PERFORM` para organizar a lógica.

## Índice
1. [Sobre o projeto](#sobre-o-projeto)
2. [Pré-requisitos](#pré-requisitos)
3. [Como compilar e executar](#como-usar-o-sistema)
4. [Estrutura do programa](#estrutura-do-programa)
5. [Regras de negócio](#regras-de-negócio)
6. [Exemplo de uso](#exemplo-de-uso)
7. [Estrutura dos arquivos](#estrutura-dos-arquivos)

## Sobre o projeto
Este sistema foi desenvolvido como parte do Programa de Estágio Acelera Maker da Montreal. Ele demonstra o uso de:

- `PROCEDURE DIVISION` organizada em **parágrafos**
- `PERFORM` para chamar parágrafos
- `PERFORM UNTIL` para loop com menu interativo
- `ACCEPT` e `DISPLAY` para entrada e saída de dados
- `COMPUTE` para cálculos aritméticos
- Parágrafo `VALIDA-DADOS` (desafio extra)
- Menu com opções **Calcular** e **Sair** (desafio extra)

## Pré-requisitos
Você precisará instalar **um único programa** no Windows 11:

| Ferramenta | O que é | Obrigatório? |
|---|---|---|
| **GnuCOBOL** | Compilador COBOL gratuito e open source | Sim |

> Não é necessário instalar nenhuma IDE. Tudo funciona pelo Prompt de Comando (CMD).

## Como usar o sistema
### Passo 3 — Compilar o programa
```cmd
cobc -x -free SALARIO-FINAL.cob -o SALARIO-FINAL.exe
```

Se nenhuma mensagem de erro aparecer, a compilação foi bem-sucedida. 

### Passo 4 — Executar o programa
```cmd
SALARIO-FINAL.exe
```

O programa será iniciado no próprio Prompt de Comando.

## Estrutura do programa
```
MAIN-PROCEDURE
├── EXIBE-CABECALHO      ← Titulo do programa 
└── (loop PERFORM UNTIL)
    ├── EXIBE-MENU       ← Mostra opcoes: 1-Calcular / 2-Sair
    ├── [opcao 1]
    │   ├── ENTRADA-DADOS    ← Le nome, salario base e tempo de empresa
    │   ├── VALIDA-DADOS     ← Verifica se os dados sao validos
    │   ├── CALCULA-BONUS    ← Determina o percentual e calcula o bonus
    │   ├── CALCULA-SALARIO  ← Soma base + bonus
    │   └── EXIBE-RESULTADO  ← Mostra o resultado formatado
    └── [opcao 2]
        └── Encerra o programa (STOP RUN)
```

## Regras de negócio
| Tempo de empresa | Bônus |
|---|---|
| Até 1 ano | 5% |
| De 2 a 5 anos | 10% |
| Acima de 5 anos | 15% |

**Fórmula:**
```
Bônus         = Salário Base × (Percentual ÷ 100)
Salário Final = Salário Base + Bônus
```

## Exemplo de uso
```
  ============================================
       SISTEMA DE CALCULO DE SALARIO FINAL
  ============================================
  Escolha uma opcao:
  1 - Calcular salario
  2 - Sair
  >> 1

  --- DADOS DO FUNCIONARIO ---

  Nome completo: Maria Oliveira
  Salario base (ex: 3500.00): 5000.00
  Tempo de empresa (anos): 6

  ============================================
              RESULTADO FINAL
  ============================================
  Nome          : Maria Oliveira
  Salario Base  : R$       5.000,00
  Bonus (15%)   : R$         750,00
  Salario Final : R$       5.750,00
  ============================================
```

## Estrutura dos arquivos
```
projeto-salario-final/
│
├── SALARIO-FINAL.cob      ← Código-fonte COBOL (editar aqui)
├── SALARIO-FINAL.exe      ← Executável gerado após compilação
└── README.md              ← Este arquivo
```
