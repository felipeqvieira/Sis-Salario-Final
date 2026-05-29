       IDENTIFICATION DIVISION.
       PROGRAM-ID. SALARIO-FINAL.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

      * Dados de entrada
       01 WS-NOME           PIC X(40).
       01 WS-SALARIO-BASE   PIC 9(7)V99.
       01 WS-TEMPO-EMPRESA  PIC 9(2).
      * Variaveis de calculo
       01 WS-PERCENTUAL-BONUS PIC 9(2).
       01 WS-BONUS          PIC 9(7)V99.
       01 WS-SALARIO-FINAL  PIC 9(7)V99.
      * Variaveis de exibicao
       01 WS-EXIBE-BASE     PIC ZZZ,ZZZ,ZZ9.99.
       01 WS-EXIBE-BONUS    PIC ZZZ,ZZZ,ZZ9.99.
       01 WS-EXIBE-FINAL    PIC ZZZ,ZZZ,ZZ9.99.
      * Variavel menu
       01 WS-OPCAO          PIC 9 VALUE 0.
       PROCEDURE DIVISION.

      * Menu interativo. Repete até que o usuário escolha Sair (2)
       MAIN-PROCEDURE.
           PERFORM EXIBE-CABECALHO
           PERFORM UNTIL WS-OPCAO = 2
               PERFORM EXIBE-MENU
               ACCEPT WS-OPCAO
               IF WS-OPCAO = 1
                   PERFORM ENTRADA-DADOS
                   PERFORM VALIDA-DADOS
                   PERFORM CALCULA-BONUS
                   PERFORM CALCULA-SALARIO
                   PERFORM EXIBE-RESULTADO
               ELSE
                   IF WS-OPCAO = 2
                       DISPLAY " "
                       DISPLAY "  Encerrando o programa. Ate logo!"
                       DISPLAY " "
                   ELSE
                       DISPLAY " "
                       DISPLAY "  Opcao invalida. Tente novamente."
                       DISPLAY " "
                   END-IF
               END-IF
           END-PERFORM
           STOP RUN.

      * Título exibido ao iniciar
       EXIBE-CABECALHO.
           DISPLAY " "
           DISPLAY "  ============================================"
           DISPLAY "     SISTEMA DE CALCULO DE SALARIO FINAL     "
           DISPLAY "  ============================================"
           DISPLAY " ".

      * Menu com opções para o usuário
       EXIBE-MENU.
           DISPLAY "  Escolha uma opcao:"
           DISPLAY "  1 - Calcular salario"
           DISPLAY "  2 - Sair"
           DISPLAY "  >> ".

      * Entrada de dados
       ENTRADA-DADOS.
           DISPLAY " "
           DISPLAY "  --- DADOS DO FUNCIONARIO ---"
           DISPLAY " "
           DISPLAY "  Nome completo: "
           ACCEPT WS-NOME
           DISPLAY "  Salario base (ex: 3500.00): "
           ACCEPT WS-SALARIO-BASE
           DISPLAY "  Tempo de empresa (em anos, ex: 3): "
           ACCEPT WS-TEMPO-EMPRESA
           DISPLAY " ".

      * Verifica se o salario informado e valido (maior que zero).
       VALIDA-DADOS.
           IF WS-SALARIO-BASE <= 0
               DISPLAY "  AVISO: Salario base deve ser maior que zero."
               DISPLAY " "
           END-IF.

      * Aplica a regra de bonus conforme o tempo de empresa:
      *   Ate 1 ano     -> 5%
      *   De 2 a 5 anos -> 10%
      *   Acima de 5    -> 15%
      * COMPUTE calcula o valor do bonus em reais.
       CALCULA-BONUS.
           IF WS-TEMPO-EMPRESA <= 1
               MOVE 5 TO WS-PERCENTUAL-BONUS
           ELSE IF WS-TEMPO-EMPRESA <= 5
               MOVE 10 TO WS-PERCENTUAL-BONUS
           ELSE
               MOVE 15 TO WS-PERCENTUAL-BONUS
           END-IF
           COMPUTE WS-BONUS =
               WS-SALARIO-BASE * WS-PERCENTUAL-BONUS / 100.

      * Salario final = salario base + bonus.
       CALCULA-SALARIO.
           COMPUTE WS-SALARIO-FINAL = WS-SALARIO-BASE + WS-BONUS.
      
      * Formata valores e exibe relatório final na tela
       EXIBE-RESULTADO.
           MOVE WS-SALARIO-BASE  TO WS-EXIBE-BASE
           MOVE WS-BONUS         TO WS-EXIBE-BONUS
           MOVE WS-SALARIO-FINAL TO WS-EXIBE-FINAL
           DISPLAY "  ============================================"
           DISPLAY "              RESULTADO FINAL                "
           DISPLAY "  ============================================"
           DISPLAY "  Nome          : " WS-NOME
           DISPLAY "  Salario Base  : R$ " WS-EXIBE-BASE
           DISPLAY "  Bonus (" WS-PERCENTUAL-BONUS "%)    : R$ "
               WS-EXIBE-BONUS
           DISPLAY "  Salario Final : R$ " WS-EXIBE-FINAL
           DISPLAY "  ============================================"
           DISPLAY " ".
