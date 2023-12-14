jmp main

letra: var #1

posicaoFireBoy: var #1
posicaoWaterGirl: var #1

saltarFireBoy: var #1
saltarWaterGirl: var #1

linhaAtual: var #1
colunaAtual: var #1

porta1FaseAtual: var #1 ;271 --
porta2FaseAtual: var #1 ;276 --

Lava1Fase1: var #1 ; 28*40 + 9 = 1129
Lava2Fase1: var #1 ; 22*40 + 18 = 898
poca1Fase1: var #1 ; 28*40 + 21 = 1141

Lava1Fase2: var #1 ; 28*40 + 27 = 1147
Lava2Fase2: var #1 ; 23*40 + 5 = 925
Lava3Fase2: var #1 ; 11*40 + 9 = 449

poca1Fase2: var #1 ; 28*40 + 8 = 1128
poca2Fase2: var #1 ; 23*40 + 31 = 951
poca3Fase2: var #1 ; 11*40 + 25 = 465

numFaseAtual: var #1

telaAtual: var #1

main:
	
	call iniciaNivel1
    call printTelainicialdojogoScreen
	
    
	call LeituraLoop
    load r1, letra	;Carrega a letra digitada

    loadn r0, #'e'
    cmp r0, r1		
    ceq imprimeInicio

 	call pressioneE

	loadn r3, #883
	store posicaoFireBoy, r3	;posicao inicial Fireboy
	loadn r2, #2304				;Cor que sera impressa
	loadn r5, #'!'				;Caracter que sera impresso
	call ImprimePersonagem		;Usa r2, r3 e r4
    
 	load r4, saltarFireBoy
	call zeraSalto	;			Inicializa a variável salto como 0
	
	loadn r1, #Tela6Linha0
	store telaAtual, r1

	loadn r3, #1043
 	store posicaoWaterGirl, r3	;posicao inicial Wategirl
	loadn r2, #1536				;Cor que sera imprimida
	loadn r5, #'$'				;Caracter  que sera imprimido
	call ImprimePersonagem		;Usa r2, r3 e r4
	
 	load r4, saltarWaterGirl
	call zeraSalto	;Inicializa a variável salto como 0
	
	jmp Nivel1

Nivel1:
    call verificaPorta
	call verificaGirlNaLava1Nivel1
	call verificaGirlNaLava2Nivel1
	call verificaBoyNaPoca1Nivel1
	call movimentaPersonagens
	call Delay
	call gravidade
	call Delay

	jmp Nivel1


Nivel2:
    call verificaPorta
	call verificaGirlNaLava1Nivel2
	call verificaGirlNaLava2Nivel2
	call verificaGirlNaLava3Nivel2
	call verificaBoyNaPoca1Nivel2
	call verificaBoyNaPoca2Nivel2
	call verificaBoyNaPoca3Nivel2

	call movimentaPersonagens
	call Delay
	call gravidade
	call Delay

	jmp Nivel2

verificaPorta:

	load r1, posicaoWaterGirl
	load r2, porta1FaseAtual

	cmp r1, r2
	jeq verificaPorta2

	rts

verificaPorta2:
    load r0, posicaoFireBoy
	load r3, porta2FaseAtual

	cmp r0,r3
	jeq proximaTela

	rts		

verificaGirlNaLava1Nivel1:

	load r1, posicaoWaterGirl
	load r2, Lava1Fase1
	
	
	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2
	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1

    rts
    
verificaGirlNaLava2Nivel1:
	load r1, posicaoWaterGirl
	load r2, Lava2Fase1

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1

    rts
	
verificaBoyNaPoca1Nivel1:
	load r1, posicaoFireBoy
	load r2, poca1Fase1

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	rts

ReiniciaPosicaoDaFase1:
	loadn r1, #1083
	store posicaoWaterGirl, r1
	
	loadn r1, #923
	store posicaoFireBoy, r1
	call imprimeGameOver

	rts

verificaGirlNaLava1Nivel2:
	load r1, posicaoWaterGirl
	load r2, Lava1Fase2
	
verificaGirlNaLava2Nivel1:
	load r1, posicaoWaterGirl
	load r2, Lava2Fase1

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1

    rts

verificaGirlNaLava2Nivel2:
	load r1, posicaoWaterGirl
	load r2, Lava2Fase2
	
	
	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2
	
verificaBoyNaPoca1Nivel1:
	load r1, posicaoFireBoy
	load r2, poca1Fase1

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
    rts

verificaGirlNaLava3Nivel2:
	load r1, posicaoWaterGirl
	load r2, Lava3Fase2
	
	
	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
    rts

verificaBoyNaPoca1Nivel2:
	load r1, posicaoFireBoy
	load r2, poca1Fase2
		
	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2
		
	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2
		
	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2
		
	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	
	rts

verificaBoyNaPoca2Nivel2:
	load r1, posicaoFireBoy
	load r2, poca2Fase2
	
	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2
		
	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2
		
	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	rts

verificaBoyNaPoca3Nivel2:
	load r1, posicaoFireBoy
	load r2, poca3Fase2
		
	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2
		
	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2
		
	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	cmp r1, r2
	jeq ReiniciaPosicaoDaFase1
	inc r2

	rts

proximaTela:
	load r0, numFaseAtual
	inc r0
	store numFaseAtual, r0

	loadn r1, #2    ; tela 2
	loadn r2, #3    ; tela 3
	loadn r3, #4    ; tela 4

	cmp r0,r1
	jeq iniciaNivel2

	cmp r0,r2
	jeq imprimeGameOver

	rts


iniciaNivel1:
	loadn r0, #1 
	store numFaseAtual, r0

	loadn r0, #271
	store porta1FaseAtual, r0

	loadn r0, #276
	store porta2FaseAtual, r0

	loadn r0, #1129
	store Lava1Fase1, r0

	loadn r0, #898
	store Lava2Fase1, r0

	loadn r0, #1141
	store poca1Fase1, r0

	rts

iniciaNivel2:
    
	loadn r0, #626
	store porta1FaseAtual, r0

	loadn r0, #614
	store porta2FaseAtual, r0

	loadn r1, #Tela9Linha0
	store telaAtual, r1

	loadn r0, # 1147
	store Lava1Fase2, r0

	loadn r0, #925
	store Lava2Fase2, r0

	loadn r0, #449
	store Lava3Fase2, r0

	loadn r0, #1128
	store poca1Fase2, r0

	loadn r0, #951
	store poca2Fase2, r0

	loadn r0, #465
	store poca3Fase2, r0


	call imprimeNivel2

	loadn r3, #1082
	store posicaoFireBoy, r3	;posicao inicial Fireboy
    loadn r2, #2304				;Cor que sera impressa
    loadn r5, #'!'				;Caracter que sera impresso
    call ImprimePersonagem	;Usa r2, r3 e r4

	loadn r3, #1117
 	store posicaoWaterGirl, r3	;posicao inicial Wategirl
    loadn r2, #1536				;Cor que sera imprimida
    loadn r5, #'$'				;Caracter  que sera imprimido
    call ImprimePersonagem	;Usa r2, r3 e r4

	jmp Nivel2

pressioneE:
    
    call DigLetra	;Coloca a letra digitada na variável letra
    load r1, letra	;Carrega a letra digitada

    loadn r0, #'e'
    cmp r0, r1
    jne pressioneE		;compare not equal => se a tecla não foi digitada continua no loop
    call imprimeNivel1

gravidade:
	push r0
	push r1
	push r2
	push r5
	

	loadn r2, #2304				;Cor que sera impressa
	load r3, posicaoFireBoy		;Posição da impressao
	loadn r5, #'!'				;Caracter que sera impresso
	load r4, saltarFireBoy

	loadn r0, #0
	cmp r4, r0
	ceq moveBaixo				;Move para baixo
	store posicaoFireBoy, r3	;Atualiza a posição do FireBoy

	loadn r2, #1536  			;Cor que sera imprimida
	load r3, posicaoWaterGirl	;Posição da impressao
	loadn r5, #'$'				;Caracter que sera imprimido
	load r4, saltarWaterGirl

	loadn r0, #0
	cmp r4, r0
	ceq moveBaixo				;Move para baixo
	store posicaoWaterGirl, r3	;Atualiza a posição da WaterGirl

	pop r5
	pop r2
	pop r1
	pop r0
	rts
	
movimentaPersonagens:	;Usa r0, r1, r2, r3, r4, r5

    push r3			;Protege r3 para ser usado no calculo da nova posição ;Talvez possamos retirar isso
    call DigLetra	;Coloca a letra digitada na variável letra
    load r1, letra	;Carrega a letra digitada

	;Movimento FireBoy
    loadn r2, #2304				;Cor que sera impressa
    load r3, posicaoFireBoy		;Posição da impressao
    loadn r5, #'!'				;Caracter que sera impresso
    load r4, saltarFireBoy

    loadn r0, #'a'
    cmp r0, r1
    ceq moveEsquerda

    loadn r0, #'d'
    cmp r0, r1
    ceq moveDireita

	loadn r0, #'w'
    cmp r0, r1
    ceq ativaSalto
    
    loadn r0, #0
    cmp r0, r4
    cne moveCima
    
    store saltarFireBoy, r4
	store posicaoFireBoy, r3	;Atualiza a variável de posição do Fireboy

	;Movimento WaterGirl
    loadn r2, #1536				;Cor que sera imprimida
    load r3, posicaoWaterGirl	;Posição da impressao
    loadn r5, #'$'				;Caracter  que sera imprimido
    load r4, saltarWaterGirl

	loadn r0, #'j'
    cmp r0, r1
    ceq moveEsquerda

    loadn r0, #'l'
    cmp r0, r1
    ceq moveDireita

	loadn r0, #'i'
    cmp r0, r1
    ceq ativaSalto
    
    loadn r0, #0
    cmp r0, r4
    cne moveCima

    store saltarWaterGirl, r4
   	store posicaoWaterGirl, r3	;Atualiza a variável de posição da WhaterGirl

    pop r3	;Recupera o valor anterior do r3
	rts

ativaSalto:
	push r0
	loadn r0, #0
	cmp r4, r0
	jne fimAtivaSalto
	
	loadn r4, #5
	jmp fimAtivaSalto
	
fimAtivaSalto:
	pop r0
	rts

zeraSalto:	;Usa r4 para guardar a variável salto
	loadn r4, #0
	rts
	
decSalto:
    dec r4
	rts
;---------Movimentacao-------------
moveEsquerda:
    call ApagaObj			;Usa r3
    
	push r2
    push r4
    push r5
    push r6
    push r7
    
    loadn r2, #0
	load r4, telaAtual
	loadn r5, #0
	loadn r6, #40
	
	;----Testa colisão com o chão--------
	add r5, r3, r6  ; R5 = pos de baixo do personagem ;;
	div r2, r5, r6  ;R1 = pos de baixo do personagem / 40 = linha de baixo
	add r4, r4, r2  ;R3 = R3 + R1 = 1º posicao da string abaixo dele
	add r4, r4, r5  ;R3 = R3 + 41 = 
	loadn r2, #42
	sub r4, r4, r2
	loadn r5, #37 ; #
	loadi r7, r4
	cmp r5, r7		;if ('#' == R6) para de cair
    cne VaiEsquerda			;Usa r3
    
    pop r7
    pop r6
    pop r5
    pop r4
    pop r2
    
    call ImprimePersonagem	;Usa r2, r3 e r4
    call Delay
    rts

moveDireita:
    call ApagaObj			;Usa r3
    
	push r2
    push r4
    push r5
    push r6
    push r7
    
    loadn r2, #0
	load r4, telaAtual
	loadn r5, #0
	loadn r6, #40
	
	;----Testa colisão com o chão--------
	add r5, r3, r6  ;
	div r2, r5, r6  ;
	add r4, r4, r2  ;
	add r4, r4, r5  ;
	loadn r2, #40
	sub r4, r4, r2
	loadn r5, #37   ;
	loadi r7, r4
	cmp r5, r7		;
    cne VaiDireita			;Usa r3
    
    pop r7
    pop r6
    pop r5
    pop r4
    pop r2
    
    call ImprimePersonagem	;Usa r2, r3 e r4
    call Delay
    rts

moveCima:
    call ApagaObj			;Usa r3
    call decSalto
    
    push r2
    push r4
    push r5
    push r6
    push r7
    
    loadn r2, #0
	load r4, telaAtual
	loadn r5, #0
	loadn r6, #40
	
	;----Testa colisão com o teto--------
	sub r5, r3, r6  ;r5 = posição acima do personagem
	div r2, r5, r6  ;r2 = posição acima do personagem / 40 = linha de cima
	add r4, r4, r2  ;r4 = r4 + r2 = 1º posicao da string acima dele
	add r4, r4, r5  ;r4 = r4 + r5 = char acima dele
	loadn r5, #37 ; #
	loadi r7, r4
	cmp r5, r7		;if ('#' == r7) para de subir
    cne VaiCima			;Usa r3
    
    
    pop r7
    pop r6
    pop r5
    pop r4
    pop r2
    
    call ImprimePersonagem	;Usa r2, r3 e r4
    call Delay
    rts

moveBaixo:
    call ApagaObj			;Usa r3
    
    push r2
    push r4
    push r5
    push r6
    push r7
    
    loadn r2, #0
	load r4, telaAtual
	loadn r5, #0
	loadn r6, #40
	
	;----Testa colisão com o chão--------

	add r5, r3, r6  ; R4 = pos de baixo do persnagem ;;
	div r2, r5, r6  ;R1 = pos de baixo o personagem / 40 = linha de baixo
	add r4, r4, r2  ;R3 = R3 + R1 = 1º posicao da string abaixo dele
	add r4, r4, r5  ;R3 = R3 + 41 = 
  
	loadn r5, #37 ; #
	loadi r7, r4
	cmp r5, r7		;if ('#' == R6) para de cair
    cne VaiBaixo			;Usa r3
    
    pop r7
    pop r6
    pop r5
    pop r4
    pop r2
    
    call ImprimePersonagem	;Usa r2, r3 e r4
    call Delay
    rts

;Funções que fazem o personagem se movimentar
;r3: posição do personagem
VaiBaixo:
	loadn r1, #40
	add r3, r3, r1
	rts

VaiCima:
	loadn r1, #40
	sub r3, r3, r1
	rts

VaiEsquerda:
    dec r3
    rts

VaiDireita:
    inc r3
    rts
;---------------Subrotinas--------------------

;Imprime o personagem
ImprimePersonagem:	;r2: Cor; r3: Posição ;r5: Caracter
	add r5, r2, r5
    outchar r5, r3
    rts

;Apaga um personagem na posição r3
ApagaObj:
	loadn r0, #' '
    outchar r0, r3
    rts

DigLetra:	; Espera que uma tecla seja digitada e salva na variavel global "Letra"
	push r0
	push r1
	loadn r1, #255		; Se nao digitar nada vem 255

	inchar r0			; Le o teclado, se nada for digitado = 255

	store letra, r0		; Salva a tecla na variavel global "Letra"

	pop r1
	pop r0
	rts

imprimeNivel1:
	loadn r1, #Tela2Linha0
	loadn r2, #2304
	call ImprimeEApaga

	loadn r1, #Tela5Linha0
	loadn r2, #1536
	call ImprimeTela

	loadn r1, #Tela6Linha0
	loadn r2, #2048
	call ImprimeTela

	rts

imprimeNivel2:
	loadn r1, #Tela7Linha0
	loadn r2, #2304
	call ImprimeEApaga

	loadn r1, #Tela8Linha0
	loadn r2, #1536
	call ImprimeTela

	loadn r1, #Tela9Linha0
	loadn r2, #2048
	call ImprimeTela

	rts

imprimeInicio:
	loadn r1, #Tela1Linha0
    loadn r2, #2304
    call ImprimeEApaga

    loadn r1, #Tela3Linha0
    loadn r2, #1536
    call ImprimeTela

    loadn r1, #Tela4Linha0
    loadn r2, #0
    call ImprimeTela
    rts

imprimeGameOver:
	loadn r1, #Tela10Linha0
	loadn r2, #2304
	call ImprimeEApaga

	loadn r1, #Tela11Linha0
	loadn r2, #1536
	call ImprimeTela

	loadn r1, #Tela12Linha0
	loadn r2, #2048
	call ImprimeTela

	call LeituraLoop
    load r1, letra	;Carrega a letra digitada

    loadn r0, #'f'
    cmp r0, r1		
    ceq imprimeCreditos

	loadn r0, #'e'
	cmp r0, r1
	jeq main

	rts

imprimeCreditos:
	loadn r1, #Tela13Linha0
	loadn r2, #2048
	call ImprimeEApaga
	call imprimeCreditos
	rts


LeituraLoop:	; Espera que uma tecla seja digitada e salva na variavel global "Letra"
	push r0
	push r1
	loadn r1, #255	; Se nao digitar nada vem 255

	DigLetra_Loop:
		inchar r0			; Le o teclado, se nada for digitado = 255
		cmp r0, r1			;compara r0 com 255
		jeq DigLetra_Loop	; Fica lendo ate' que digite uma tecla valida

		store letra, r0			; Salva a tecla na variavel global "Letra"

		pop r1
		pop r0
		rts

ImprimeTela: 	;  Rotina de Impresao de Cenario na Tela Inteira
	;  r1 = endereco onde comeca a primeira linha do Cenario
	;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina

	loadn r0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn r3, #40  	; Incremento da posicao da tela!
	loadn r4, #41  	; incremento do ponteiro das linhas da tela
	loadn r5, #1200 ; Limite da tela!
	loadn r6, #Tela1Linha0	; Endereco onde comeca a primeira linha do cenario!!

   ImprimeTela2_Loop:
		call ImprimeStr2
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		add r6, r6, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela2_Loop	; Enquanto r0 < 1200

	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

ImprimeEApaga: 	;  Rotina de Impresao de Cenario na Tela Inteira
	;  r1 = endereco onde comeca a primeira linha do Cenario
	;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	loadn R6, #Tela1Linha0	; Endereco onde comeca a primeira linha do cenario!!

   ImprimeEApagaTela2_Loop:
		call ImprimeEApagaStr2
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		add r6, r6, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeEApagaTela2_Loop	; Enquanto r0 < 1200

	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

		;  r1 = endereco onde comeca a primeira linha do Cenario
		;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	loadn R6, #Tela1Linha0	; Endereco onde comeca a primeira linha do cenario!!

   ImprimeTela2_Loop:
		call ImprimeEApagaStr2
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		add r6, r6, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeEApagaTela2_Loop	; Enquanto r0 < 1200

	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

		;  r1 = endereco onde comeca a primeira linha do Cenario
		;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	loadn R6, #Tela1Linha0	; Endereco onde comeca a primeira linha do cenario!!

   ImprimeEApagaTela2_Loop:
		call ImprimeEApagaStr2
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		add r6, r6, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeEApagaTela2_Loop	; Enquanto r0 < 1200

	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

;---- Inicio das Subrotinas -----

ImprimeStr2:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina


	loadn r3, #'\0'	; Criterio de parada
	loadn r5, #' '	; Espaco em Branco
	ImprimeStr2_Loop:
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr2_Sai
		cmp r4, r5		; If (Char == ' ')  vai Pula outchar do espaco para na apagar outros caracteres
		jeq ImprimeStr2_Skip
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		storei r6, r4
   ImprimeStr2_Skip:
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		inc r6			; Incrementa o ponteiro da String da Tela 0
		jmp ImprimeStr2_Loop

   ImprimeStr2_Sai:
	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

ImprimeEApagaStr2:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina


	loadn r3, #'\0'	; Criterio de parada
	loadn r5, #' '	; Espaco em Branco
	ImprimeEApagaStr2_Loop:
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeEApagaStr2_Sai
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		storei r6, r4
   ImprimeEApagaStr2_Skip:
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		inc r6			; Incrementa o ponteiro da String da Tela 0
		jmp ImprimeEApagaStr2_Loop

   ImprimeEApagaStr2_Sai:
	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
;********************************************************
;                       DELAY
;********************************************************

Delay:
	;Utiliza Push e Pop para nao afetar os Ristradores do programa principal
	push R0
	push R1

	Loadn R1, #15
   	Delay_volta2:
		Loadn R0, #40000		; Intensidade do Delay

   		Delay_volta1:
			dec R0
			jnz Delay_volta1
			dec R1
			jnz Delay_volta2

	pop R1
	pop R0

	rts						; Return

;---------------------------------------------------------------
;                       Texto em vermelho
;---------------------------------------------------------------
Tela1Linha0  : string "                                        "
Tela1Linha1  : string "                                        "
Tela1Linha2  : string "                                        "
Tela1Linha3  : string "                                        "
Tela1Linha4  : string "                                        "
Tela1Linha5  : string "                                        "
Tela1Linha6  : string "                                        "
Tela1Linha7  : string "                                        "
Tela1Linha8  : string "          FIREBOY                       "
Tela1Linha9  : string "                                        "
Tela1Linha10 : string "                                        "
Tela1Linha11 : string "                                        "
Tela1Linha12 : string "                                        "
Tela1Linha13 : string "                                        "
Tela1Linha14 : string "                                        "
Tela1Linha15 : string "                                        "
Tela1Linha16 : string "   Fireboy                              "
Tela1Linha17 : string "                                        "
Tela1Linha18 : string "  W - Pular                             "
Tela1Linha19 : string "                                        "
Tela1Linha20 : string "  A - Esquerda                          "
Tela1Linha21 : string "                                        "
Tela1Linha22 : string "  D - Direita                           "
Tela1Linha23 : string "                                        "
Tela1Linha24 : string "        !                               "
Tela1Linha25 : string "                                        "
Tela1Linha26 : string "                                        "
Tela1Linha27 : string "                                        "
Tela1Linha28 : string "                                        "
Tela1Linha29  :string "                                        "

;---------------------------------------------------------------
;                       Texto em azul
;---------------------------------------------------------------

Tela3Linha0  : string "                                        "
Tela3Linha1  : string "                                        "
Tela3Linha2  : string "                                        "
Tela3Linha3  : string "                                        "
Tela3Linha4  : string "                                        "
Tela3Linha5  : string "                                        "
Tela3Linha6  : string "                                        "
Tela3Linha7  : string "                                        "
Tela3Linha8  : string "                    WATERGIRL           "
Tela3Linha9  : string "                                        "
Tela3Linha10 : string "                                        "
Tela3Linha11 : string "                                        "
Tela3Linha12 : string "                                        "
Tela3Linha13 : string "                                        "
Tela3Linha14 : string "                                        "
Tela3Linha15 : string "                                        "
Tela3Linha16 : string "                            Watergirl   "
Tela3Linha17 : string "                                        "
Tela3Linha18 : string "                        I - Pular       "
Tela3Linha19 : string "                                        "
Tela3Linha20 : string "                        J - Esquerda    "
Tela3Linha21 : string "                                        "
Tela3Linha22 : string "                        L - Direita     "
Tela3Linha23 : string "                                        "
Tela3Linha24 : string "                              $         "
Tela3Linha25 : string "                                        "
Tela3Linha26 : string "                                        "
Tela3Linha27 : string "                                        "
Tela3Linha28 : string "                                        "
Tela3Linha29  :string "                                        "

;---------------------------------------------------------------
;                       Texto em branco
;---------------------------------------------------------------

Tela4Linha0  : string "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
Tela4Linha1  : string "%                                      %"
Tela4Linha2  : string "%                                      %"
Tela4Linha3  : string "%                                      %"
Tela4Linha4  : string "%                                      %"
Tela4Linha5  : string "%                                      %"
Tela4Linha6  : string "%                                      %"
Tela4Linha7  : string "%                                      %"
Tela4Linha8  : string "%                 e                    %"
Tela4Linha9  : string "%                                      %"
Tela4Linha10 : string "%                                      %"
Tela4Linha11 : string "%              Controles               %"
Tela4Linha12 : string "%                                      %"
Tela4Linha13 : string "%                                      %"
Tela4Linha14 : string "%                                      %"
Tela4Linha15 : string "%                                      %"
Tela4Linha16 : string "%                                      %"
Tela4Linha17 : string "%                                      %"
Tela4Linha18 : string "%                                      %"
Tela4Linha19 : string "%                                      %"
Tela4Linha20 : string "%                                      %"
Tela4Linha21 : string "%                                      %"
Tela4Linha22 : string "%                                      %"
Tela4Linha23 : string "%                                      %"
Tela4Linha24 : string "%                                      %"
Tela4Linha25 : string "%                                      %"
Tela4Linha26 : string "%                                      %"
Tela4Linha27 : string "%     Pressione `E' para iniciar       %"
Tela4Linha28 : string "%                                      %"
Tela4Linha29  :string "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

;---------------------------------------------------------------
;							Nível 1 (Lava)
;----------------------------------------------------------------

Tela2Linha0  : string "                                        "
Tela2Linha1  : string "                                        "
Tela2Linha2  : string "                                        "
Tela2Linha3  : string "                                  _____ "
Tela2Linha4  : string "                                  |   | "
Tela2Linha5  : string "                                  |   | "
Tela2Linha6  : string "                *                 |   | "
Tela2Linha7  : string "                                        "
Tela2Linha8  : string "                                        "
Tela2Linha9  : string " *                                      "
Tela2Linha10 : string "                                        "
Tela2Linha11 : string "                                        "
Tela2Linha12 : string "                                        "
Tela2Linha13 : string "                                        "
Tela2Linha14 : string "                                        "
Tela2Linha15 : string "                                        "
Tela2Linha16 : string "                                 *      "
Tela2Linha17 : string "                                        "
Tela2Linha18 : string "                                        "
Tela2Linha19 : string "                                        "
Tela2Linha20 : string "                                        "
Tela2Linha21 : string "                                        "
Tela2Linha22 : string "                  ++++                  "
Tela2Linha23 : string "                                        "
Tela2Linha24 : string "                                        "
Tela2Linha25 : string "                                        "
Tela2Linha26 : string "                                        "
Tela2Linha27 : string "            *                           "
Tela2Linha28 : string "         +++++                          "
Tela2Linha29 : string "                                        "

;---------------------------------------------------------------
;							Nível 1 (Agua)
;----------------------------------------------------------------

Tela5Linha0  : string "                                        "
Tela5Linha1  : string "                                        "
Tela5Linha2  : string "                                        "
Tela5Linha3  : string "                             _____      "
Tela5Linha4  : string "          *                  |   |      "
Tela5Linha5  : string "                             |   |      "
Tela5Linha6  : string "                             |   |      "
Tela5Linha7  : string "                                        "
Tela5Linha8  : string "                                        "
Tela5Linha9  : string "                                        "
Tela5Linha10 : string "                                        "
Tela5Linha11 : string "                                        "
Tela5Linha12 : string "                                        "
Tela5Linha13 : string "                                        "
Tela5Linha14 : string "                                        "
Tela5Linha15 : string "         *                              "
Tela5Linha16 : string "                                        "
Tela5Linha17 : string "                                        "
Tela5Linha18 : string "                                        "
Tela5Linha19 : string "                                        "
Tela5Linha20 : string "                                        "
Tela5Linha21 : string "                                        "
Tela5Linha22 : string "                                        "
Tela5Linha23 : string "                                        "
Tela5Linha24 : string "                                        "
Tela5Linha25 : string "                                        "
Tela5Linha26 : string "                                        "
Tela5Linha27 : string "                        *               "
Tela5Linha28 : string "                     ++++++++           "
Tela5Linha29 : string "                                        "

;---------------------------------------------------------------
;							Nível 1 (Cenário)
;----------------------------------------------------------------

Tela6Linha0  : string "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
Tela6Linha1  : string "%                                      %"
Tela6Linha2  : string "%                                      %"
Tela6Linha3  : string "%                                      %"
Tela6Linha4  : string "%                                      %"
Tela6Linha5  : string "%                                      %"
Tela6Linha6  : string "%         %%%%%                        %"
Tela6Linha7  : string "%           %%%%%%%%%%%%%%%%%%%%%%%%%%%%"
Tela6Linha8  : string "%             %%%%%%%                  %"
Tela6Linha9  : string "%                                      %"
Tela6Linha10 : string "%%%%%%%%                               %"
Tela6Linha11 : string "%%%%%%%%                               %"
Tela6Linha12 : string "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         %"
Tela6Linha13 : string "%                            %%%       %"
Tela6Linha14 : string "%                                      %"
Tela6Linha15 : string "%                                      %"
Tela6Linha16 : string "%    %%%%%%%%%%%%%%%%%%%%              %"
Tela6Linha17 : string "%                     %%%%%%%%%%%%%%%%%%"
Tela6Linha18 : string "%                               %%%%%%%%"
Tela6Linha19 : string "%                                      %"
Tela6Linha20 : string "%%%%%%%%%%%%                           %"
Tela6Linha21 : string "%%%%%%%%%%%%%                          %"
Tela6Linha22 : string "%            %%%%%    %%%              %"
Tela6Linha23 : string "%              %%%%%%%%%%%%            %"
Tela6Linha24 : string "%%%%%%%                    %%          %"
Tela6Linha25 : string "%%%%%%                                 %"
Tela6Linha26 : string "%                                      %"
Tela6Linha27 : string "%                                      %"
Tela6Linha28 : string "%%%%%%%%%     %%%%%%%%     %%%%%%%%%%%%%"
Tela6Linha29 : string "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"


;---------------------------------------------------------------
;			Nível 2 (Lava)
;----------------------------------------------------------------

Tela7Linha0  : string "                                        "
Tela7Linha1  : string "                                        "
Tela7Linha2  : string "                                        "
Tela7Linha3  : string "                                        "
Tela7Linha4  : string "                                        "
Tela7Linha5  : string "                                        "
Tela7Linha6  : string "            *                           "
Tela7Linha7  : string "                                        "
Tela7Linha8  : string "                                        "
Tela7Linha9  : string "                                        "
Tela7Linha10 : string "                                        "
Tela7Linha11 : string "             +++                        "
Tela7Linha12 : string "            _____                       "
Tela7Linha13 : string "            |   |                       "
Tela7Linha14 : string "            |   |                       "
Tela7Linha15 : string "        /   |   |                       "
Tela7Linha16 : string "                                        "
Tela7Linha17 : string "                                        "
Tela7Linha18 : string "               *                        "
Tela7Linha19 : string "                                        "
Tela7Linha20 : string "                                        "
Tela7Linha21 : string "                                        "
Tela7Linha22 : string "  /                                     "
Tela7Linha23 : string "     ++++                               "
Tela7Linha24 : string "                                        "
Tela7Linha25 : string "                                        "
Tela7Linha26 : string "                                        "
Tela7Linha27 : string "                             *          "
Tela7Linha28 : string "                           ++++         "
Tela7Linha29 : string "                                        "

;---------------------------------------------------------------
;			Nível 2 (Agua)
;----------------------------------------------------------------

Tela8Linha0  : string "                                        "
Tela8Linha1  : string "                                        "
Tela8Linha2  : string "                                        "
Tela8Linha3  : string "                                        "
Tela8Linha4  : string "                                        "
Tela8Linha5  : string "                                        "
Tela8Linha6  : string "                            *           "
Tela8Linha7  : string "                                        "
Tela8Linha8  : string "                                        "
Tela8Linha9  : string "                                        "
Tela8Linha10 : string "                                        "
Tela8Linha11 : string "                         +++            "
Tela8Linha12 : string "                        _____           "
Tela8Linha13 : string "                        |   |           "
Tela8Linha14 : string "                        |   |           "
Tela8Linha15 : string "                        |   |   /       "
Tela8Linha16 : string "                                        "
Tela8Linha17 : string "                                        "
Tela8Linha18 : string "                         *              "
Tela8Linha19 : string "                                        "
Tela8Linha20 : string "                                        "
Tela8Linha21 : string "                                        "
Tela8Linha22 : string "                                    /   "
Tela8Linha23 : string "                               ++++     "
Tela8Linha24 : string "                                        "
Tela8Linha25 : string "                                        "
Tela8Linha26 : string "                                        "
Tela8Linha27 : string "           *                            "
Tela8Linha28 : string "         ++++                           "
Tela8Linha29 : string "                                        "


;---------------------------------------------------------------
;			Nível 2 (Cenário)
;----------------------------------------------------------------

Tela9Linha0  : string "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
Tela9Linha1  : string "%                                      %"
Tela9Linha2  : string "%                                      %"
Tela9Linha3  : string "%                                      %"
Tela9Linha4  : string "%         %        %%%        %        %"
Tela9Linha5  : string "%         %      %%%%%%%      %        %"
Tela9Linha6  : string "%         %    %%%%%%%%%%%    %        %"
Tela9Linha7  : string "%         %      %%%%%%%      %        %"
Tela9Linha8  : string "%     %%%%%        %%%        %%%%%    %"
Tela9Linha9  : string "%         %         %         %        %"
Tela9Linha10 : string "%         %         %         %        %"
Tela9Linha11 : string "%         %%%   %   %   %   %%%        %"
Tela9Linha12 : string "%%%       %         %         %      %%%"
Tela9Linha13 : string "%         %         %         %        %"
Tela9Linha14 : string "%         %        %%%        %        %"
Tela9Linha15 : string "%         %       %%%%%       %        %"
Tela9Linha16 : string "%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%    %"
Tela9Linha17 : string "%                   %                  %"
Tela9Linha18 : string "%                                      %"
Tela9Linha19 : string "%            %%%%%     %%%%%           %"
Tela9Linha20 : string "%%%%         %%%%%%%%%%%%%%%        %%%%"
Tela9Linha21 : string "%                                      %"
Tela9Linha22 : string "%                                      %"
Tela9Linha23 : string "%%%%%    %%%%              %%%%    %%%%%"
Tela9Linha24 : string "%%%%%%%%%%%                  %%%%%%%%%%%"
Tela9Linha25 : string "%                                      %"
Tela9Linha26 : string "%                %%%%%%                %"
Tela9Linha27 : string "%              %%%%%%%%%%              %"
Tela9Linha28 : string "%%%%%%%%%    %%%%%%%%%%%%%%    %%%%%%%%%"
Tela9Linha29 : string "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"


;---------------------------------------------------------------
;                       Texto em vermelho(GAME OVER)
;---------------------------------------------------------------
Tela10Linha0  : string "                                        "
Tela10Linha1  : string "                                        "
Tela10Linha2  : string "                                        "
Tela10Linha3  : string "                                        "
Tela10Linha4  : string "                                        "
Tela10Linha5  : string "                                        "
Tela10Linha6  : string "                                        "
Tela10Linha7  : string "                                        "
Tela10Linha8  : string "                                        "
Tela10Linha9  : string "                                        "
Tela10Linha10 : string "                                        "
Tela10Linha11 : string "                                        "
Tela10Linha12 : string "                                        "
Tela10Linha13 : string "                                        "
Tela10Linha14 : string "                                        "
Tela10Linha15 : string "                                        "
Tela10Linha16 : string "                                        "
Tela10Linha17 : string "                                        "
Tela10Linha18 : string "                         EXIT           "
Tela10Linha19 : string "                                        "
Tela10Linha20 : string "                                        "
Tela10Linha21 : string "                                        "
Tela10Linha22 : string "                                        "
Tela10Linha23 : string "                                        "
Tela10Linha24 : string "                                        "
Tela10Linha25 : string "                                        "
Tela10Linha26 : string "                                        "
Tela10Linha27 : string "                                        "
Tela10Linha28 : string "                                        "
Tela10Linha29  :string "                                        "

;---------------------------------------------------------------
;                       Texto em azul(GAME OVER)
;---------------------------------------------------------------

Tela11Linha0  : string "                                        "
Tela11Linha1  : string "                                        "
Tela11Linha2  : string "                                        "
Tela11Linha3  : string "                                        "
Tela11Linha4  : string "                                        "
Tela11Linha5  : string "                                        "
Tela11Linha6  : string "                                        "
Tela11Linha7  : string "                                        "
Tela11Linha8  : string "                                        "
Tela11Linha9  : string "                                        "
Tela11Linha10 : string "                                        "
Tela11Linha11 : string "                                        "
Tela11Linha12 : string "                                        "
Tela11Linha13 : string "                                        "
Tela11Linha14 : string "                                        "
Tela11Linha15 : string "                                        "
Tela11Linha16 : string "                                        "
Tela11Linha17 : string "                                        "
Tela11Linha18 : string "           RETRY                        "
Tela11Linha19 : string "                                        "
Tela11Linha20 : string "                                        "
Tela11Linha21 : string "                                        "
Tela11Linha22 : string "                                        "
Tela11Linha23 : string "                                        "
Tela11Linha24 : string "                                        "
Tela11Linha25 : string "                                        "
Tela11Linha26 : string "                                        "
Tela11Linha27 : string "                                        "
Tela11Linha28 : string "                                        "
Tela11Linha29  :string "                                        "

;---------------------------------------------------------------
;                       Texto em branco(GAME OVER)
;---------------------------------------------------------------

Tela12Linha0  : string "                                        "
Tela12Linha1  : string "                                        "
Tela12Linha2  : string "                                        "
Tela12Linha3  : string "                                        "
Tela12Linha4  : string "                                        "
Tela12Linha5  : string "                                        "
Tela12Linha6  : string "                                        "
Tela12Linha7  : string "                                        "
Tela12Linha8  : string "                                        "
Tela12Linha9  : string "                                        " 
Tela12Linha10 : string "                                        "
Tela12Linha11 : string "                                        "
Tela12Linha12 : string "   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   "
Tela12Linha13 : string "   %                                %   "
Tela12Linha14 : string "   %           GAME  OVER           %   "
Tela12Linha15 : string "   %                                %   "
Tela12Linha16 : string "   %                                %   "
Tela12Linha17 : string "   %                                %   "
Tela12Linha18 : string "   %   'E'           'F'            %   "
Tela12Linha19 : string "   %                                %   "
Tela12Linha20 : string "   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   "
Tela12Linha21 : string "                                        "
Tela12Linha22 : string "                                        "
Tela12Linha23 : string "                                        "
Tela12Linha24 : string "                                        "
Tela12Linha25 : string "                                        "
Tela12Linha26 : string "                                        "
Tela12Linha27 : string "                                        "
Tela12Linha28 : string "                                        "
Tela12Linha29  :string "                                        "


;---------------------------------------------------------------
;                       Texto em branco(Credito)
;---------------------------------------------------------------

Tela13Linha0  : string "                                        "
Tela13Linha1  : string "                                        "
Tela13Linha2  : string "                                        "
Tela13Linha3  : string "                                        "
Tela13Linha4  : string "                                        "
Tela13Linha5  : string "                                        "
Tela13Linha6  : string "           !                $           "
Tela13Linha7  : string "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
Tela13Linha8  : string "%                                      %"
Tela13Linha9  : string "%              CREDITOS:               %"
Tela13Linha10 : string "%                                      %"
Tela13Linha11 : string "%          Andre Jacob Suaide          %"
Tela13Linha12 : string "%       Felipe Aparecido da Silva      %"
Tela13Linha13 : string "%         Gustavo Carvalho Araujo      %"
Tela13Linha14 : string "%      Henrique de Oliveira Araujo     %"
Tela13Linha15 : string "%       Marcus Vinicius da Silva       %"
Tela13Linha16 : string "%        Oliver Kenzo Kobayashi        %"
Tela13Linha17 : string "%      Rodrigo Rodrigues de Castro     %"
Tela13Linha18 : string "%       Viktor Sergio Ferreira         %"
Tela13Linha19 : string "%     Vitor Augusto Paiva de Brito     %"
Tela13Linha20 : string "%         Yazid Alamou Bouari          %"
Tela13Linha21 : string "%                                      %"
Tela13Linha22 : string "%             ICMC - USP               %"
Tela13Linha23 : string "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
Tela13Linha24 : string "                                        "
Tela13Linha25 : string "                                        "
Tela13Linha26 : string "                                        "
Tela13Linha27 : string "                                        "
Tela13Linha28 : string "               Aperte 'e' para fechar   "
Tela13Linha29 : string "                                        "


Telainicialdojogo : var #1200
  ;Linha 0
  static Telainicialdojogo + #0, #95
  static Telainicialdojogo + #1, #95
  static Telainicialdojogo + #2, #95
  static Telainicialdojogo + #3, #95
  static Telainicialdojogo + #4, #95
  static Telainicialdojogo + #5, #3967
  static Telainicialdojogo + #6, #3967
  static Telainicialdojogo + #7, #3967
  static Telainicialdojogo + #8, #3967
  static Telainicialdojogo + #9, #3967
  static Telainicialdojogo + #10, #3967
  static Telainicialdojogo + #11, #3967
  static Telainicialdojogo + #12, #95
  static Telainicialdojogo + #13, #95
  static Telainicialdojogo + #14, #95
  static Telainicialdojogo + #15, #95
  static Telainicialdojogo + #16, #95
  static Telainicialdojogo + #17, #3967
  static Telainicialdojogo + #18, #3967
  static Telainicialdojogo + #19, #3967
  static Telainicialdojogo + #20, #3967
  static Telainicialdojogo + #21, #3967
  static Telainicialdojogo + #22, #3967
  static Telainicialdojogo + #23, #95
  static Telainicialdojogo + #24, #95
  static Telainicialdojogo + #25, #95
  static Telainicialdojogo + #26, #95
  static Telainicialdojogo + #27, #95
  static Telainicialdojogo + #28, #3967
  static Telainicialdojogo + #29, #3967
  static Telainicialdojogo + #30, #3967
  static Telainicialdojogo + #31, #3967
  static Telainicialdojogo + #32, #3967
  static Telainicialdojogo + #33, #3967
  static Telainicialdojogo + #34, #3967
  static Telainicialdojogo + #35, #95
  static Telainicialdojogo + #36, #95
  static Telainicialdojogo + #37, #95
  static Telainicialdojogo + #38, #95
  static Telainicialdojogo + #39, #95

  ;Linha 1
  static Telainicialdojogo + #40, #124
  static Telainicialdojogo + #41, #3967
  static Telainicialdojogo + #42, #3967
  static Telainicialdojogo + #43, #3967
  static Telainicialdojogo + #44, #124
  static Telainicialdojogo + #45, #3967
  static Telainicialdojogo + #46, #3967
  static Telainicialdojogo + #47, #3967
  static Telainicialdojogo + #48, #3967
  static Telainicialdojogo + #49, #3967
  static Telainicialdojogo + #50, #3967
  static Telainicialdojogo + #51, #3967
  static Telainicialdojogo + #52, #124
  static Telainicialdojogo + #53, #3967
  static Telainicialdojogo + #54, #3967
  static Telainicialdojogo + #55, #3967
  static Telainicialdojogo + #56, #124
  static Telainicialdojogo + #57, #3967
  static Telainicialdojogo + #58, #3967
  static Telainicialdojogo + #59, #3967
  static Telainicialdojogo + #60, #3967
  static Telainicialdojogo + #61, #3967
  static Telainicialdojogo + #62, #3967
  static Telainicialdojogo + #63, #124
  static Telainicialdojogo + #64, #3967
  static Telainicialdojogo + #65, #3967
  static Telainicialdojogo + #66, #3967
  static Telainicialdojogo + #67, #124
  static Telainicialdojogo + #68, #3967
  static Telainicialdojogo + #69, #3967
  static Telainicialdojogo + #70, #3967
  static Telainicialdojogo + #71, #3967
  static Telainicialdojogo + #72, #3967
  static Telainicialdojogo + #73, #3967
  static Telainicialdojogo + #74, #3967
  static Telainicialdojogo + #75, #124
  static Telainicialdojogo + #76, #3967
  static Telainicialdojogo + #77, #3967
  static Telainicialdojogo + #78, #3967
  static Telainicialdojogo + #79, #124

  ;Linha 2
  static Telainicialdojogo + #80, #124
  static Telainicialdojogo + #81, #3967
  static Telainicialdojogo + #82, #2308
  static Telainicialdojogo + #83, #3967
  static Telainicialdojogo + #84, #124
  static Telainicialdojogo + #85, #3967
  static Telainicialdojogo + #86, #3967
  static Telainicialdojogo + #87, #3967
  static Telainicialdojogo + #88, #3967
  static Telainicialdojogo + #89, #3967
  static Telainicialdojogo + #90, #3967
  static Telainicialdojogo + #91, #3967
  static Telainicialdojogo + #92, #124
  static Telainicialdojogo + #93, #3967
  static Telainicialdojogo + #94, #3077
  static Telainicialdojogo + #95, #3967
  static Telainicialdojogo + #96, #124
  static Telainicialdojogo + #97, #3967
  static Telainicialdojogo + #98, #3967
  static Telainicialdojogo + #99, #3967
  static Telainicialdojogo + #100, #3967
  static Telainicialdojogo + #101, #3967
  static Telainicialdojogo + #102, #3967
  static Telainicialdojogo + #103, #124
  static Telainicialdojogo + #104, #3967
  static Telainicialdojogo + #105, #2308
  static Telainicialdojogo + #106, #3967
  static Telainicialdojogo + #107, #124
  static Telainicialdojogo + #108, #3967
  static Telainicialdojogo + #109, #3967
  static Telainicialdojogo + #110, #3967
  static Telainicialdojogo + #111, #3967
  static Telainicialdojogo + #112, #3967
  static Telainicialdojogo + #113, #3967
  static Telainicialdojogo + #114, #3967
  static Telainicialdojogo + #115, #124
  static Telainicialdojogo + #116, #3967
  static Telainicialdojogo + #117, #2308
  static Telainicialdojogo + #118, #3967
  static Telainicialdojogo + #119, #124

  ;Linha 3
  static Telainicialdojogo + #120, #124
  static Telainicialdojogo + #121, #3967
  static Telainicialdojogo + #122, #3967
  static Telainicialdojogo + #123, #3967
  static Telainicialdojogo + #124, #124
  static Telainicialdojogo + #125, #3967
  static Telainicialdojogo + #126, #3967
  static Telainicialdojogo + #127, #3967
  static Telainicialdojogo + #128, #3967
  static Telainicialdojogo + #129, #3967
  static Telainicialdojogo + #130, #3967
  static Telainicialdojogo + #131, #3967
  static Telainicialdojogo + #132, #124
  static Telainicialdojogo + #133, #3967
  static Telainicialdojogo + #134, #3967
  static Telainicialdojogo + #135, #3967
  static Telainicialdojogo + #136, #124
  static Telainicialdojogo + #137, #3967
  static Telainicialdojogo + #138, #3967
  static Telainicialdojogo + #139, #3967
  static Telainicialdojogo + #140, #3967
  static Telainicialdojogo + #141, #3967
  static Telainicialdojogo + #142, #3967
  static Telainicialdojogo + #143, #124
  static Telainicialdojogo + #144, #3967
  static Telainicialdojogo + #145, #3967
  static Telainicialdojogo + #146, #3967
  static Telainicialdojogo + #147, #124
  static Telainicialdojogo + #148, #3967
  static Telainicialdojogo + #149, #3967
  static Telainicialdojogo + #150, #3967
  static Telainicialdojogo + #151, #3967
  static Telainicialdojogo + #152, #3967
  static Telainicialdojogo + #153, #3967
  static Telainicialdojogo + #154, #3967
  static Telainicialdojogo + #155, #124
  static Telainicialdojogo + #156, #3967
  static Telainicialdojogo + #157, #3967
  static Telainicialdojogo + #158, #3967
  static Telainicialdojogo + #159, #124

  ;Linha 4
  static Telainicialdojogo + #160, #2093
  static Telainicialdojogo + #161, #2093
  static Telainicialdojogo + #162, #2093
  static Telainicialdojogo + #163, #2093
  static Telainicialdojogo + #164, #2093
  static Telainicialdojogo + #165, #2093
  static Telainicialdojogo + #166, #2093
  static Telainicialdojogo + #167, #2093
  static Telainicialdojogo + #168, #2093
  static Telainicialdojogo + #169, #2093
  static Telainicialdojogo + #170, #2093
  static Telainicialdojogo + #171, #2093
  static Telainicialdojogo + #172, #2093
  static Telainicialdojogo + #173, #2093
  static Telainicialdojogo + #174, #2093
  static Telainicialdojogo + #175, #2093
  static Telainicialdojogo + #176, #2093
  static Telainicialdojogo + #177, #2093
  static Telainicialdojogo + #178, #2093
  static Telainicialdojogo + #179, #2093
  static Telainicialdojogo + #180, #2093
  static Telainicialdojogo + #181, #45
  static Telainicialdojogo + #182, #45
  static Telainicialdojogo + #183, #45
  static Telainicialdojogo + #184, #45
  static Telainicialdojogo + #185, #45
  static Telainicialdojogo + #186, #45
  static Telainicialdojogo + #187, #45
  static Telainicialdojogo + #188, #45
  static Telainicialdojogo + #189, #45
  static Telainicialdojogo + #190, #45
  static Telainicialdojogo + #191, #45
  static Telainicialdojogo + #192, #45
  static Telainicialdojogo + #193, #45
  static Telainicialdojogo + #194, #45
  static Telainicialdojogo + #195, #45
  static Telainicialdojogo + #196, #45
  static Telainicialdojogo + #197, #45
  static Telainicialdojogo + #198, #45
  static Telainicialdojogo + #199, #2093

  ;Linha 5
  static Telainicialdojogo + #200, #3967
  static Telainicialdojogo + #201, #3967
  static Telainicialdojogo + #202, #3967
  static Telainicialdojogo + #203, #3967
  static Telainicialdojogo + #204, #3967
  static Telainicialdojogo + #205, #3967
  static Telainicialdojogo + #206, #2143
  static Telainicialdojogo + #207, #2374
  static Telainicialdojogo + #208, #2428
  static Telainicialdojogo + #209, #2386
  static Telainicialdojogo + #210, #2373
  static Telainicialdojogo + #211, #2370
  static Telainicialdojogo + #212, #2383
  static Telainicialdojogo + #213, #2393
  static Telainicialdojogo + #214, #3967
  static Telainicialdojogo + #215, #3967
  static Telainicialdojogo + #216, #3967
  static Telainicialdojogo + #217, #3967
  static Telainicialdojogo + #218, #3967
  static Telainicialdojogo + #219, #806
  static Telainicialdojogo + #220, #3967
  static Telainicialdojogo + #221, #3967
  static Telainicialdojogo + #222, #3967
  static Telainicialdojogo + #223, #3967
  static Telainicialdojogo + #224, #3967
  static Telainicialdojogo + #225, #3967
  static Telainicialdojogo + #226, #3159
  static Telainicialdojogo + #227, #3137
  static Telainicialdojogo + #228, #3156
  static Telainicialdojogo + #229, #3141
  static Telainicialdojogo + #230, #3154
  static Telainicialdojogo + #231, #3143
  static Telainicialdojogo + #232, #3196
  static Telainicialdojogo + #233, #3154
  static Telainicialdojogo + #234, #3148
  static Telainicialdojogo + #235, #2143
  static Telainicialdojogo + #236, #3967
  static Telainicialdojogo + #237, #3967
  static Telainicialdojogo + #238, #3967
  static Telainicialdojogo + #239, #3967

  ;Linha 6
  static Telainicialdojogo + #240, #3967
  static Telainicialdojogo + #241, #3967
  static Telainicialdojogo + #242, #3967
  static Telainicialdojogo + #243, #3967
  static Telainicialdojogo + #244, #3967
  static Telainicialdojogo + #245, #3967
  static Telainicialdojogo + #246, #3967
  static Telainicialdojogo + #247, #3967
  static Telainicialdojogo + #248, #3967
  static Telainicialdojogo + #249, #3967
  static Telainicialdojogo + #250, #3967
  static Telainicialdojogo + #251, #3967
  static Telainicialdojogo + #252, #3967
  static Telainicialdojogo + #253, #3967
  static Telainicialdojogo + #254, #3967
  static Telainicialdojogo + #255, #3967
  static Telainicialdojogo + #256, #3967
  static Telainicialdojogo + #257, #3967
  static Telainicialdojogo + #258, #3967
  static Telainicialdojogo + #259, #3967
  static Telainicialdojogo + #260, #3967
  static Telainicialdojogo + #261, #3967
  static Telainicialdojogo + #262, #3967
  static Telainicialdojogo + #263, #3967
  static Telainicialdojogo + #264, #3967
  static Telainicialdojogo + #265, #3967
  static Telainicialdojogo + #266, #3967
  static Telainicialdojogo + #267, #3967
  static Telainicialdojogo + #268, #3967
  static Telainicialdojogo + #269, #3967
  static Telainicialdojogo + #270, #3967
  static Telainicialdojogo + #271, #3967
  static Telainicialdojogo + #272, #3967
  static Telainicialdojogo + #273, #3967
  static Telainicialdojogo + #274, #3967
  static Telainicialdojogo + #275, #3967
  static Telainicialdojogo + #276, #3967
  static Telainicialdojogo + #277, #3967
  static Telainicialdojogo + #278, #3967
  static Telainicialdojogo + #279, #3967

  ;Linha 7
  static Telainicialdojogo + #280, #3967
  static Telainicialdojogo + #281, #3967
  static Telainicialdojogo + #282, #3967
  static Telainicialdojogo + #283, #3967
  static Telainicialdojogo + #284, #3967
  static Telainicialdojogo + #285, #3967
  static Telainicialdojogo + #286, #3967
  static Telainicialdojogo + #287, #3967
  static Telainicialdojogo + #288, #3967
  static Telainicialdojogo + #289, #3967
  static Telainicialdojogo + #290, #3967
  static Telainicialdojogo + #291, #3967
  static Telainicialdojogo + #292, #3967
  static Telainicialdojogo + #293, #3967
  static Telainicialdojogo + #294, #3967
  static Telainicialdojogo + #295, #3967
  static Telainicialdojogo + #296, #3967
  static Telainicialdojogo + #297, #3967
  static Telainicialdojogo + #298, #841
  static Telainicialdojogo + #299, #3967
  static Telainicialdojogo + #300, #846
  static Telainicialdojogo + #301, #3967
  static Telainicialdojogo + #302, #3967
  static Telainicialdojogo + #303, #3967
  static Telainicialdojogo + #304, #3967
  static Telainicialdojogo + #305, #3967
  static Telainicialdojogo + #306, #3967
  static Telainicialdojogo + #307, #3967
  static Telainicialdojogo + #308, #3967
  static Telainicialdojogo + #309, #3967
  static Telainicialdojogo + #310, #3967
  static Telainicialdojogo + #311, #3967
  static Telainicialdojogo + #312, #3967
  static Telainicialdojogo + #313, #3967
  static Telainicialdojogo + #314, #3967
  static Telainicialdojogo + #315, #3967
  static Telainicialdojogo + #316, #3967
  static Telainicialdojogo + #317, #3967
  static Telainicialdojogo + #318, #3967
  static Telainicialdojogo + #319, #3967

  ;Linha 8
  static Telainicialdojogo + #320, #3967
  static Telainicialdojogo + #321, #3967
  static Telainicialdojogo + #322, #3967
  static Telainicialdojogo + #323, #3967
  static Telainicialdojogo + #324, #3967
  static Telainicialdojogo + #325, #3967
  static Telainicialdojogo + #326, #3967
  static Telainicialdojogo + #327, #3967
  static Telainicialdojogo + #328, #3967
  static Telainicialdojogo + #329, #3967
  static Telainicialdojogo + #330, #3967
  static Telainicialdojogo + #331, #814
  static Telainicialdojogo + #332, #3967
  static Telainicialdojogo + #333, #3967
  static Telainicialdojogo + #334, #3967
  static Telainicialdojogo + #335, #3967
  static Telainicialdojogo + #336, #3967
  static Telainicialdojogo + #337, #3967
  static Telainicialdojogo + #338, #3967
  static Telainicialdojogo + #339, #3967
  static Telainicialdojogo + #340, #3967
  static Telainicialdojogo + #341, #3967
  static Telainicialdojogo + #342, #3967
  static Telainicialdojogo + #343, #3967
  static Telainicialdojogo + #344, #3967
  static Telainicialdojogo + #345, #3967
  static Telainicialdojogo + #346, #3967
  static Telainicialdojogo + #347, #3967
  static Telainicialdojogo + #348, #3967
  static Telainicialdojogo + #349, #814
  static Telainicialdojogo + #350, #3967
  static Telainicialdojogo + #351, #3967
  static Telainicialdojogo + #352, #3967
  static Telainicialdojogo + #353, #3967
  static Telainicialdojogo + #354, #3967
  static Telainicialdojogo + #355, #3967
  static Telainicialdojogo + #356, #3967
  static Telainicialdojogo + #357, #3967
  static Telainicialdojogo + #358, #3967
  static Telainicialdojogo + #359, #3967

  ;Linha 9
  static Telainicialdojogo + #360, #3967
  static Telainicialdojogo + #361, #3967
  static Telainicialdojogo + #362, #3967
  static Telainicialdojogo + #363, #3967
  static Telainicialdojogo + #364, #3967
  static Telainicialdojogo + #365, #3967
  static Telainicialdojogo + #366, #3967
  static Telainicialdojogo + #367, #3967
  static Telainicialdojogo + #368, #3967
  static Telainicialdojogo + #369, #3967
  static Telainicialdojogo + #370, #3967
  static Telainicialdojogo + #371, #3967
  static Telainicialdojogo + #372, #852
  static Telainicialdojogo + #373, #840
  static Telainicialdojogo + #374, #837
  static Telainicialdojogo + #375, #3967
  static Telainicialdojogo + #376, #3967
  static Telainicialdojogo + #377, #841
  static Telainicialdojogo + #378, #835
  static Telainicialdojogo + #379, #845
  static Telainicialdojogo + #380, #835
  static Telainicialdojogo + #381, #3967
  static Telainicialdojogo + #382, #3967
  static Telainicialdojogo + #383, #852
  static Telainicialdojogo + #384, #837
  static Telainicialdojogo + #385, #845
  static Telainicialdojogo + #386, #848
  static Telainicialdojogo + #387, #844
  static Telainicialdojogo + #388, #837
  static Telainicialdojogo + #389, #3967
  static Telainicialdojogo + #390, #3967
  static Telainicialdojogo + #391, #3967
  static Telainicialdojogo + #392, #3967
  static Telainicialdojogo + #393, #3967
  static Telainicialdojogo + #394, #3967
  static Telainicialdojogo + #395, #3967
  static Telainicialdojogo + #396, #3967
  static Telainicialdojogo + #397, #3967
  static Telainicialdojogo + #398, #3967
  static Telainicialdojogo + #399, #3967

  ;Linha 10
  static Telainicialdojogo + #400, #3967
  static Telainicialdojogo + #401, #3967
  static Telainicialdojogo + #402, #3967
  static Telainicialdojogo + #403, #3967
  static Telainicialdojogo + #404, #3967
  static Telainicialdojogo + #405, #3967
  static Telainicialdojogo + #406, #3967
  static Telainicialdojogo + #407, #3967
  static Telainicialdojogo + #408, #3967
  static Telainicialdojogo + #409, #3967
  static Telainicialdojogo + #410, #3967
  static Telainicialdojogo + #411, #3967
  static Telainicialdojogo + #412, #3967
  static Telainicialdojogo + #413, #3967
  static Telainicialdojogo + #414, #3967
  static Telainicialdojogo + #415, #3967
  static Telainicialdojogo + #416, #3967
  static Telainicialdojogo + #417, #3967
  static Telainicialdojogo + #418, #3967
  static Telainicialdojogo + #419, #3967
  static Telainicialdojogo + #420, #3967
  static Telainicialdojogo + #421, #3967
  static Telainicialdojogo + #422, #3967
  static Telainicialdojogo + #423, #3967
  static Telainicialdojogo + #424, #3967
  static Telainicialdojogo + #425, #3967
  static Telainicialdojogo + #426, #3967
  static Telainicialdojogo + #427, #3967
  static Telainicialdojogo + #428, #3967
  static Telainicialdojogo + #429, #3967
  static Telainicialdojogo + #430, #3967
  static Telainicialdojogo + #431, #3967
  static Telainicialdojogo + #432, #3967
  static Telainicialdojogo + #433, #3967
  static Telainicialdojogo + #434, #3967
  static Telainicialdojogo + #435, #3967
  static Telainicialdojogo + #436, #3967
  static Telainicialdojogo + #437, #3967
  static Telainicialdojogo + #438, #3967
  static Telainicialdojogo + #439, #3967

  ;Linha 11
  static Telainicialdojogo + #440, #3967
  static Telainicialdojogo + #441, #3967
  static Telainicialdojogo + #442, #3967
  static Telainicialdojogo + #443, #3967
  static Telainicialdojogo + #444, #3967
  static Telainicialdojogo + #445, #3967
  static Telainicialdojogo + #446, #3967
  static Telainicialdojogo + #447, #3967
  static Telainicialdojogo + #448, #3967
  static Telainicialdojogo + #449, #3967
  static Telainicialdojogo + #450, #3967
  static Telainicialdojogo + #451, #3967
  static Telainicialdojogo + #452, #3967
  static Telainicialdojogo + #453, #3967
  static Telainicialdojogo + #454, #2347
  static Telainicialdojogo + #455, #3967
  static Telainicialdojogo + #456, #3967
  static Telainicialdojogo + #457, #3967
  static Telainicialdojogo + #458, #3967
  static Telainicialdojogo + #459, #3967
  static Telainicialdojogo + #460, #3967
  static Telainicialdojogo + #461, #3967
  static Telainicialdojogo + #462, #3967
  static Telainicialdojogo + #463, #3967
  static Telainicialdojogo + #464, #3167
  static Telainicialdojogo + #465, #3967
  static Telainicialdojogo + #466, #3967
  static Telainicialdojogo + #467, #3967
  static Telainicialdojogo + #468, #3967
  static Telainicialdojogo + #469, #3967
  static Telainicialdojogo + #470, #3967
  static Telainicialdojogo + #471, #3967
  static Telainicialdojogo + #472, #3967
  static Telainicialdojogo + #473, #3967
  static Telainicialdojogo + #474, #3967
  static Telainicialdojogo + #475, #3967
  static Telainicialdojogo + #476, #3967
  static Telainicialdojogo + #477, #3967
  static Telainicialdojogo + #478, #3967
  static Telainicialdojogo + #479, #3967

  ;Linha 12
  static Telainicialdojogo + #480, #3967
  static Telainicialdojogo + #481, #3967
  static Telainicialdojogo + #482, #2143
  static Telainicialdojogo + #483, #2143
  static Telainicialdojogo + #484, #2143
  static Telainicialdojogo + #485, #2143
  static Telainicialdojogo + #486, #2143
  static Telainicialdojogo + #487, #3967
  static Telainicialdojogo + #488, #3967
  static Telainicialdojogo + #489, #3967
  static Telainicialdojogo + #490, #3967
  static Telainicialdojogo + #491, #2347
  static Telainicialdojogo + #492, #3967
  static Telainicialdojogo + #493, #2347
  static Telainicialdojogo + #494, #2347
  static Telainicialdojogo + #495, #2143
  static Telainicialdojogo + #496, #2143
  static Telainicialdojogo + #497, #2143
  static Telainicialdojogo + #498, #3967
  static Telainicialdojogo + #499, #3967
  static Telainicialdojogo + #500, #3967
  static Telainicialdojogo + #501, #3967
  static Telainicialdojogo + #502, #3967
  static Telainicialdojogo + #503, #3119
  static Telainicialdojogo + #504, #3967
  static Telainicialdojogo + #505, #3164
  static Telainicialdojogo + #506, #2143
  static Telainicialdojogo + #507, #2143
  static Telainicialdojogo + #508, #2143
  static Telainicialdojogo + #509, #3967
  static Telainicialdojogo + #510, #3967
  static Telainicialdojogo + #511, #3967
  static Telainicialdojogo + #512, #3967
  static Telainicialdojogo + #513, #2143
  static Telainicialdojogo + #514, #2143
  static Telainicialdojogo + #515, #2143
  static Telainicialdojogo + #516, #2143
  static Telainicialdojogo + #517, #2143
  static Telainicialdojogo + #518, #3967
  static Telainicialdojogo + #519, #3967

  ;Linha 13
  static Telainicialdojogo + #520, #3967
  static Telainicialdojogo + #521, #3967
  static Telainicialdojogo + #522, #2172
  static Telainicialdojogo + #523, #3967
  static Telainicialdojogo + #524, #3967
  static Telainicialdojogo + #525, #3967
  static Telainicialdojogo + #526, #2172
  static Telainicialdojogo + #527, #3967
  static Telainicialdojogo + #528, #3967
  static Telainicialdojogo + #529, #3967
  static Telainicialdojogo + #530, #2347
  static Telainicialdojogo + #531, #2347
  static Telainicialdojogo + #532, #2347
  static Telainicialdojogo + #533, #2347
  static Telainicialdojogo + #534, #2347
  static Telainicialdojogo + #535, #3967
  static Telainicialdojogo + #536, #2347
  static Telainicialdojogo + #537, #2172
  static Telainicialdojogo + #538, #3967
  static Telainicialdojogo + #539, #3967
  static Telainicialdojogo + #540, #3967
  static Telainicialdojogo + #541, #3119
  static Telainicialdojogo + #542, #3117
  static Telainicialdojogo + #543, #3183
  static Telainicialdojogo + #544, #3167
  static Telainicialdojogo + #545, #3167
  static Telainicialdojogo + #546, #3197
  static Telainicialdojogo + #547, #3967
  static Telainicialdojogo + #548, #2172
  static Telainicialdojogo + #549, #3967
  static Telainicialdojogo + #550, #3967
  static Telainicialdojogo + #551, #3967
  static Telainicialdojogo + #552, #3967
  static Telainicialdojogo + #553, #2172
  static Telainicialdojogo + #554, #3967
  static Telainicialdojogo + #555, #3967
  static Telainicialdojogo + #556, #3967
  static Telainicialdojogo + #557, #2172
  static Telainicialdojogo + #558, #3967
  static Telainicialdojogo + #559, #3967

  ;Linha 14
  static Telainicialdojogo + #560, #3967
  static Telainicialdojogo + #561, #3967
  static Telainicialdojogo + #562, #2172
  static Telainicialdojogo + #563, #3967
  static Telainicialdojogo + #564, #3077
  static Telainicialdojogo + #565, #3967
  static Telainicialdojogo + #566, #2172
  static Telainicialdojogo + #567, #3967
  static Telainicialdojogo + #568, #2347
  static Telainicialdojogo + #569, #3967
  static Telainicialdojogo + #570, #2347
  static Telainicialdojogo + #571, #2347
  static Telainicialdojogo + #572, #2347
  static Telainicialdojogo + #573, #2347
  static Telainicialdojogo + #574, #2347
  static Telainicialdojogo + #575, #2347
  static Telainicialdojogo + #576, #2347
  static Telainicialdojogo + #577, #2172
  static Telainicialdojogo + #578, #3967
  static Telainicialdojogo + #579, #3967
  static Telainicialdojogo + #580, #3119
  static Telainicialdojogo + #581, #3967
  static Telainicialdojogo + #582, #3119
  static Telainicialdojogo + #583, #3183
  static Telainicialdojogo + #584, #3164
  static Telainicialdojogo + #585, #3967
  static Telainicialdojogo + #586, #3967
  static Telainicialdojogo + #587, #3164
  static Telainicialdojogo + #588, #2172
  static Telainicialdojogo + #589, #3967
  static Telainicialdojogo + #590, #3967
  static Telainicialdojogo + #591, #3967
  static Telainicialdojogo + #592, #3967
  static Telainicialdojogo + #593, #2172
  static Telainicialdojogo + #594, #3967
  static Telainicialdojogo + #595, #3077
  static Telainicialdojogo + #596, #3967
  static Telainicialdojogo + #597, #2172
  static Telainicialdojogo + #598, #3967
  static Telainicialdojogo + #599, #3967

  ;Linha 15
  static Telainicialdojogo + #600, #3967
  static Telainicialdojogo + #601, #3967
  static Telainicialdojogo + #602, #2172
  static Telainicialdojogo + #603, #3967
  static Telainicialdojogo + #604, #3967
  static Telainicialdojogo + #605, #3967
  static Telainicialdojogo + #606, #2172
  static Telainicialdojogo + #607, #3967
  static Telainicialdojogo + #608, #2347
  static Telainicialdojogo + #609, #2347
  static Telainicialdojogo + #610, #2347
  static Telainicialdojogo + #611, #2347
  static Telainicialdojogo + #612, #2347
  static Telainicialdojogo + #613, #2347
  static Telainicialdojogo + #614, #2347
  static Telainicialdojogo + #615, #2347
  static Telainicialdojogo + #616, #2347
  static Telainicialdojogo + #617, #2172
  static Telainicialdojogo + #618, #3967
  static Telainicialdojogo + #619, #3967
  static Telainicialdojogo + #620, #3164
  static Telainicialdojogo + #621, #3119
  static Telainicialdojogo + #622, #3183
  static Telainicialdojogo + #623, #3183
  static Telainicialdojogo + #624, #3183
  static Telainicialdojogo + #625, #3164
  static Telainicialdojogo + #626, #3167
  static Telainicialdojogo + #627, #3119
  static Telainicialdojogo + #628, #2172
  static Telainicialdojogo + #629, #3967
  static Telainicialdojogo + #630, #3967
  static Telainicialdojogo + #631, #3967
  static Telainicialdojogo + #632, #3967
  static Telainicialdojogo + #633, #2172
  static Telainicialdojogo + #634, #3967
  static Telainicialdojogo + #635, #3967
  static Telainicialdojogo + #636, #3967
  static Telainicialdojogo + #637, #2172
  static Telainicialdojogo + #638, #3967
  static Telainicialdojogo + #639, #3967

  ;Linha 16
  static Telainicialdojogo + #640, #3967
  static Telainicialdojogo + #641, #3967
  static Telainicialdojogo + #642, #2143
  static Telainicialdojogo + #643, #95
  static Telainicialdojogo + #644, #95
  static Telainicialdojogo + #645, #95
  static Telainicialdojogo + #646, #95
  static Telainicialdojogo + #647, #2143
  static Telainicialdojogo + #648, #2347
  static Telainicialdojogo + #649, #2347
  static Telainicialdojogo + #650, #2347
  static Telainicialdojogo + #651, #2347
  static Telainicialdojogo + #652, #2347
  static Telainicialdojogo + #653, #2347
  static Telainicialdojogo + #654, #2347
  static Telainicialdojogo + #655, #2347
  static Telainicialdojogo + #656, #2347
  static Telainicialdojogo + #657, #2143
  static Telainicialdojogo + #658, #95
  static Telainicialdojogo + #659, #95
  static Telainicialdojogo + #660, #3183
  static Telainicialdojogo + #661, #3183
  static Telainicialdojogo + #662, #3183
  static Telainicialdojogo + #663, #3183
  static Telainicialdojogo + #664, #3183
  static Telainicialdojogo + #665, #3183
  static Telainicialdojogo + #666, #3183
  static Telainicialdojogo + #667, #3183
  static Telainicialdojogo + #668, #2143
  static Telainicialdojogo + #669, #95
  static Telainicialdojogo + #670, #95
  static Telainicialdojogo + #671, #95
  static Telainicialdojogo + #672, #95
  static Telainicialdojogo + #673, #95
  static Telainicialdojogo + #674, #2143
  static Telainicialdojogo + #675, #95
  static Telainicialdojogo + #676, #95
  static Telainicialdojogo + #677, #2143
  static Telainicialdojogo + #678, #3967
  static Telainicialdojogo + #679, #3967

  ;Linha 17
  static Telainicialdojogo + #680, #3967
  static Telainicialdojogo + #681, #47
  static Telainicialdojogo + #682, #2093
  static Telainicialdojogo + #683, #2093
  static Telainicialdojogo + #684, #2093
  static Telainicialdojogo + #685, #2093
  static Telainicialdojogo + #686, #2093
  static Telainicialdojogo + #687, #2093
  static Telainicialdojogo + #688, #2347
  static Telainicialdojogo + #689, #2347
  static Telainicialdojogo + #690, #2347
  static Telainicialdojogo + #691, #2818
  static Telainicialdojogo + #692, #2347
  static Telainicialdojogo + #693, #2819
  static Telainicialdojogo + #694, #2347
  static Telainicialdojogo + #695, #2347
  static Telainicialdojogo + #696, #2347
  static Telainicialdojogo + #697, #2093
  static Telainicialdojogo + #698, #2093
  static Telainicialdojogo + #699, #2093
  static Telainicialdojogo + #700, #3183
  static Telainicialdojogo + #701, #3183
  static Telainicialdojogo + #702, #2048
  static Telainicialdojogo + #703, #3183
  static Telainicialdojogo + #704, #3183
  static Telainicialdojogo + #705, #2049
  static Telainicialdojogo + #706, #3183
  static Telainicialdojogo + #707, #3183
  static Telainicialdojogo + #708, #2093
  static Telainicialdojogo + #709, #2093
  static Telainicialdojogo + #710, #2093
  static Telainicialdojogo + #711, #2093
  static Telainicialdojogo + #712, #2093
  static Telainicialdojogo + #713, #2093
  static Telainicialdojogo + #714, #2093
  static Telainicialdojogo + #715, #2093
  static Telainicialdojogo + #716, #2093
  static Telainicialdojogo + #717, #2093
  static Telainicialdojogo + #718, #92
  static Telainicialdojogo + #719, #3967

  ;Linha 18
  static Telainicialdojogo + #720, #47
  static Telainicialdojogo + #721, #3967
  static Telainicialdojogo + #722, #3967
  static Telainicialdojogo + #723, #3967
  static Telainicialdojogo + #724, #3967
  static Telainicialdojogo + #725, #3967
  static Telainicialdojogo + #726, #3967
  static Telainicialdojogo + #727, #3967
  static Telainicialdojogo + #728, #3967
  static Telainicialdojogo + #729, #2347
  static Telainicialdojogo + #730, #2347
  static Telainicialdojogo + #731, #2347
  static Telainicialdojogo + #732, #2347
  static Telainicialdojogo + #733, #2347
  static Telainicialdojogo + #734, #2347
  static Telainicialdojogo + #735, #2347
  static Telainicialdojogo + #736, #3967
  static Telainicialdojogo + #737, #3967
  static Telainicialdojogo + #738, #3967
  static Telainicialdojogo + #739, #3967
  static Telainicialdojogo + #740, #3183
  static Telainicialdojogo + #741, #3183
  static Telainicialdojogo + #742, #3183
  static Telainicialdojogo + #743, #3183
  static Telainicialdojogo + #744, #3183
  static Telainicialdojogo + #745, #3183
  static Telainicialdojogo + #746, #3183
  static Telainicialdojogo + #747, #3183
  static Telainicialdojogo + #748, #3967
  static Telainicialdojogo + #749, #3967
  static Telainicialdojogo + #750, #3967
  static Telainicialdojogo + #751, #3967
  static Telainicialdojogo + #752, #3967
  static Telainicialdojogo + #753, #3967
  static Telainicialdojogo + #754, #3967
  static Telainicialdojogo + #755, #3967
  static Telainicialdojogo + #756, #3967
  static Telainicialdojogo + #757, #3967
  static Telainicialdojogo + #758, #3967
  static Telainicialdojogo + #759, #92

  ;Linha 19
  static Telainicialdojogo + #760, #3967
  static Telainicialdojogo + #761, #3967
  static Telainicialdojogo + #762, #3967
  static Telainicialdojogo + #763, #3967
  static Telainicialdojogo + #764, #3967
  static Telainicialdojogo + #765, #3967
  static Telainicialdojogo + #766, #3967
  static Telainicialdojogo + #767, #3967
  static Telainicialdojogo + #768, #3967
  static Telainicialdojogo + #769, #2347
  static Telainicialdojogo + #770, #2144
  static Telainicialdojogo + #771, #2347
  static Telainicialdojogo + #772, #2347
  static Telainicialdojogo + #773, #2347
  static Telainicialdojogo + #774, #2347
  static Telainicialdojogo + #775, #2347
  static Telainicialdojogo + #776, #3967
  static Telainicialdojogo + #777, #3967
  static Telainicialdojogo + #778, #3967
  static Telainicialdojogo + #779, #3967
  static Telainicialdojogo + #780, #3119
  static Telainicialdojogo + #781, #3183
  static Telainicialdojogo + #782, #3183
  static Telainicialdojogo + #783, #3183
  static Telainicialdojogo + #784, #3183
  static Telainicialdojogo + #785, #2087
  static Telainicialdojogo + #786, #3183
  static Telainicialdojogo + #787, #3967
  static Telainicialdojogo + #788, #3967
  static Telainicialdojogo + #789, #3967
  static Telainicialdojogo + #790, #3967
  static Telainicialdojogo + #791, #3967
  static Telainicialdojogo + #792, #3967
  static Telainicialdojogo + #793, #3967
  static Telainicialdojogo + #794, #3967
  static Telainicialdojogo + #795, #3967
  static Telainicialdojogo + #796, #3967
  static Telainicialdojogo + #797, #3967
  static Telainicialdojogo + #798, #3967
  static Telainicialdojogo + #799, #3967

  ;Linha 20
  static Telainicialdojogo + #800, #3967
  static Telainicialdojogo + #801, #3967
  static Telainicialdojogo + #802, #3967
  static Telainicialdojogo + #803, #3967
  static Telainicialdojogo + #804, #3967
  static Telainicialdojogo + #805, #3967
  static Telainicialdojogo + #806, #3967
  static Telainicialdojogo + #807, #1887
  static Telainicialdojogo + #808, #1887
  static Telainicialdojogo + #809, #1887
  static Telainicialdojogo + #810, #2347
  static Telainicialdojogo + #811, #2144
  static Telainicialdojogo + #812, #2174
  static Telainicialdojogo + #813, #2347
  static Telainicialdojogo + #814, #2347
  static Telainicialdojogo + #815, #3967
  static Telainicialdojogo + #816, #3967
  static Telainicialdojogo + #817, #2143
  static Telainicialdojogo + #818, #2143
  static Telainicialdojogo + #819, #2143
  static Telainicialdojogo + #820, #3196
  static Telainicialdojogo + #821, #3119
  static Telainicialdojogo + #822, #3183
  static Telainicialdojogo + #823, #2144
  static Telainicialdojogo + #824, #2087
  static Telainicialdojogo + #825, #3183
  static Telainicialdojogo + #826, #3967
  static Telainicialdojogo + #827, #3967
  static Telainicialdojogo + #828, #2143
  static Telainicialdojogo + #829, #2143
  static Telainicialdojogo + #830, #2143
  static Telainicialdojogo + #831, #2143
  static Telainicialdojogo + #832, #2143
  static Telainicialdojogo + #833, #3967
  static Telainicialdojogo + #834, #3967
  static Telainicialdojogo + #835, #3967
  static Telainicialdojogo + #836, #3967
  static Telainicialdojogo + #837, #3967
  static Telainicialdojogo + #838, #3967
  static Telainicialdojogo + #839, #3967

  ;Linha 21
  static Telainicialdojogo + #840, #3967
  static Telainicialdojogo + #841, #3967
  static Telainicialdojogo + #842, #3967
  static Telainicialdojogo + #843, #3967
  static Telainicialdojogo + #844, #3967
  static Telainicialdojogo + #845, #3967
  static Telainicialdojogo + #846, #3967
  static Telainicialdojogo + #847, #1916
  static Telainicialdojogo + #848, #3967
  static Telainicialdojogo + #849, #3967
  static Telainicialdojogo + #850, #3967
  static Telainicialdojogo + #851, #2347
  static Telainicialdojogo + #852, #2347
  static Telainicialdojogo + #853, #2347
  static Telainicialdojogo + #854, #3967
  static Telainicialdojogo + #855, #3967
  static Telainicialdojogo + #856, #3967
  static Telainicialdojogo + #857, #2172
  static Telainicialdojogo + #858, #3967
  static Telainicialdojogo + #859, #3967
  static Telainicialdojogo + #860, #3967
  static Telainicialdojogo + #861, #2172
  static Telainicialdojogo + #862, #3967
  static Telainicialdojogo + #863, #3183
  static Telainicialdojogo + #864, #3114
  static Telainicialdojogo + #865, #3967
  static Telainicialdojogo + #866, #3967
  static Telainicialdojogo + #867, #3967
  static Telainicialdojogo + #868, #2172
  static Telainicialdojogo + #869, #3967
  static Telainicialdojogo + #870, #3967
  static Telainicialdojogo + #871, #3967
  static Telainicialdojogo + #872, #2172
  static Telainicialdojogo + #873, #3967
  static Telainicialdojogo + #874, #3967
  static Telainicialdojogo + #875, #3967
  static Telainicialdojogo + #876, #3967
  static Telainicialdojogo + #877, #3967
  static Telainicialdojogo + #878, #3967
  static Telainicialdojogo + #879, #3967

  ;Linha 22
  static Telainicialdojogo + #880, #3967
  static Telainicialdojogo + #881, #3967
  static Telainicialdojogo + #882, #3967
  static Telainicialdojogo + #883, #2095
  static Telainicialdojogo + #884, #3967
  static Telainicialdojogo + #885, #3967
  static Telainicialdojogo + #886, #3967
  static Telainicialdojogo + #887, #1916
  static Telainicialdojogo + #888, #3967
  static Telainicialdojogo + #889, #3077
  static Telainicialdojogo + #890, #3967
  static Telainicialdojogo + #891, #2346
  static Telainicialdojogo + #892, #2346
  static Telainicialdojogo + #893, #2346
  static Telainicialdojogo + #894, #3967
  static Telainicialdojogo + #895, #3967
  static Telainicialdojogo + #896, #3967
  static Telainicialdojogo + #897, #2172
  static Telainicialdojogo + #898, #3967
  static Telainicialdojogo + #899, #2308
  static Telainicialdojogo + #900, #3967
  static Telainicialdojogo + #901, #2172
  static Telainicialdojogo + #902, #3967
  static Telainicialdojogo + #903, #3114
  static Telainicialdojogo + #904, #3114
  static Telainicialdojogo + #905, #3114
  static Telainicialdojogo + #906, #3967
  static Telainicialdojogo + #907, #3967
  static Telainicialdojogo + #908, #2172
  static Telainicialdojogo + #909, #3967
  static Telainicialdojogo + #910, #2308
  static Telainicialdojogo + #911, #3967
  static Telainicialdojogo + #912, #2172
  static Telainicialdojogo + #913, #3967
  static Telainicialdojogo + #914, #3967
  static Telainicialdojogo + #915, #3967
  static Telainicialdojogo + #916, #2140
  static Telainicialdojogo + #917, #3967
  static Telainicialdojogo + #918, #3967
  static Telainicialdojogo + #919, #3967

  ;Linha 23
  static Telainicialdojogo + #920, #3967
  static Telainicialdojogo + #921, #3967
  static Telainicialdojogo + #922, #2095
  static Telainicialdojogo + #923, #2172
  static Telainicialdojogo + #924, #3967
  static Telainicialdojogo + #925, #3967
  static Telainicialdojogo + #926, #3967
  static Telainicialdojogo + #927, #1916
  static Telainicialdojogo + #928, #3967
  static Telainicialdojogo + #929, #3967
  static Telainicialdojogo + #930, #2346
  static Telainicialdojogo + #931, #2346
  static Telainicialdojogo + #932, #2346
  static Telainicialdojogo + #933, #2346
  static Telainicialdojogo + #934, #2346
  static Telainicialdojogo + #935, #3967
  static Telainicialdojogo + #936, #3967
  static Telainicialdojogo + #937, #2172
  static Telainicialdojogo + #938, #3967
  static Telainicialdojogo + #939, #3967
  static Telainicialdojogo + #940, #3967
  static Telainicialdojogo + #941, #2172
  static Telainicialdojogo + #942, #3114
  static Telainicialdojogo + #943, #3114
  static Telainicialdojogo + #944, #3114
  static Telainicialdojogo + #945, #3114
  static Telainicialdojogo + #946, #3114
  static Telainicialdojogo + #947, #3967
  static Telainicialdojogo + #948, #2172
  static Telainicialdojogo + #949, #3967
  static Telainicialdojogo + #950, #3967
  static Telainicialdojogo + #951, #3967
  static Telainicialdojogo + #952, #2172
  static Telainicialdojogo + #953, #3967
  static Telainicialdojogo + #954, #3967
  static Telainicialdojogo + #955, #3967
  static Telainicialdojogo + #956, #2172
  static Telainicialdojogo + #957, #2140
  static Telainicialdojogo + #958, #3967
  static Telainicialdojogo + #959, #3967

  ;Linha 24
  static Telainicialdojogo + #960, #3967
  static Telainicialdojogo + #961, #2095
  static Telainicialdojogo + #962, #3967
  static Telainicialdojogo + #963, #2172
  static Telainicialdojogo + #964, #3967
  static Telainicialdojogo + #965, #95
  static Telainicialdojogo + #966, #95
  static Telainicialdojogo + #967, #1887
  static Telainicialdojogo + #968, #95
  static Telainicialdojogo + #969, #2346
  static Telainicialdojogo + #970, #2346
  static Telainicialdojogo + #971, #2346
  static Telainicialdojogo + #972, #2346
  static Telainicialdojogo + #973, #2346
  static Telainicialdojogo + #974, #2346
  static Telainicialdojogo + #975, #2346
  static Telainicialdojogo + #976, #95
  static Telainicialdojogo + #977, #95
  static Telainicialdojogo + #978, #95
  static Telainicialdojogo + #979, #95
  static Telainicialdojogo + #980, #3967
  static Telainicialdojogo + #981, #3114
  static Telainicialdojogo + #982, #3114
  static Telainicialdojogo + #983, #3114
  static Telainicialdojogo + #984, #3114
  static Telainicialdojogo + #985, #3114
  static Telainicialdojogo + #986, #3114
  static Telainicialdojogo + #987, #3114
  static Telainicialdojogo + #988, #95
  static Telainicialdojogo + #989, #95
  static Telainicialdojogo + #990, #95
  static Telainicialdojogo + #991, #95
  static Telainicialdojogo + #992, #95
  static Telainicialdojogo + #993, #95
  static Telainicialdojogo + #994, #95
  static Telainicialdojogo + #995, #3967
  static Telainicialdojogo + #996, #2172
  static Telainicialdojogo + #997, #3967
  static Telainicialdojogo + #998, #2140
  static Telainicialdojogo + #999, #3967

  ;Linha 25
  static Telainicialdojogo + #1000, #2095
  static Telainicialdojogo + #1001, #2172
  static Telainicialdojogo + #1002, #3077
  static Telainicialdojogo + #1003, #2172
  static Telainicialdojogo + #1004, #47
  static Telainicialdojogo + #1005, #2093
  static Telainicialdojogo + #1006, #2093
  static Telainicialdojogo + #1007, #2093
  static Telainicialdojogo + #1008, #2346
  static Telainicialdojogo + #1009, #2346
  static Telainicialdojogo + #1010, #3967
  static Telainicialdojogo + #1011, #2346
  static Telainicialdojogo + #1012, #2346
  static Telainicialdojogo + #1013, #2346
  static Telainicialdojogo + #1014, #3967
  static Telainicialdojogo + #1015, #2346
  static Telainicialdojogo + #1016, #2346
  static Telainicialdojogo + #1017, #2093
  static Telainicialdojogo + #1018, #2093
  static Telainicialdojogo + #1019, #2093
  static Telainicialdojogo + #1020, #3114
  static Telainicialdojogo + #1021, #3114
  static Telainicialdojogo + #1022, #3967
  static Telainicialdojogo + #1023, #3114
  static Telainicialdojogo + #1024, #3114
  static Telainicialdojogo + #1025, #3114
  static Telainicialdojogo + #1026, #3967
  static Telainicialdojogo + #1027, #3114
  static Telainicialdojogo + #1028, #3114
  static Telainicialdojogo + #1029, #2093
  static Telainicialdojogo + #1030, #2093
  static Telainicialdojogo + #1031, #2093
  static Telainicialdojogo + #1032, #2093
  static Telainicialdojogo + #1033, #2093
  static Telainicialdojogo + #1034, #2093
  static Telainicialdojogo + #1035, #92
  static Telainicialdojogo + #1036, #2172
  static Telainicialdojogo + #1037, #3077
  static Telainicialdojogo + #1038, #2172
  static Telainicialdojogo + #1039, #3967

  ;Linha 26
  static Telainicialdojogo + #1040, #3967
  static Telainicialdojogo + #1041, #2172
  static Telainicialdojogo + #1042, #3967
  static Telainicialdojogo + #1043, #47
  static Telainicialdojogo + #1044, #3967
  static Telainicialdojogo + #1045, #3967
  static Telainicialdojogo + #1046, #3967
  static Telainicialdojogo + #1047, #3967
  static Telainicialdojogo + #1048, #3967
  static Telainicialdojogo + #1049, #3967
  static Telainicialdojogo + #1050, #3967
  static Telainicialdojogo + #1051, #2346
  static Telainicialdojogo + #1052, #2346
  static Telainicialdojogo + #1053, #2346
  static Telainicialdojogo + #1054, #3967
  static Telainicialdojogo + #1055, #3967
  static Telainicialdojogo + #1056, #3967
  static Telainicialdojogo + #1057, #3967
  static Telainicialdojogo + #1058, #3967
  static Telainicialdojogo + #1059, #3967
  static Telainicialdojogo + #1060, #3967
  static Telainicialdojogo + #1061, #3967
  static Telainicialdojogo + #1062, #3967
  static Telainicialdojogo + #1063, #3114
  static Telainicialdojogo + #1064, #3114
  static Telainicialdojogo + #1065, #3114
  static Telainicialdojogo + #1066, #3967
  static Telainicialdojogo + #1067, #3967
  static Telainicialdojogo + #1068, #3967
  static Telainicialdojogo + #1069, #3967
  static Telainicialdojogo + #1070, #3967
  static Telainicialdojogo + #1071, #3967
  static Telainicialdojogo + #1072, #3967
  static Telainicialdojogo + #1073, #3967
  static Telainicialdojogo + #1074, #3967
  static Telainicialdojogo + #1075, #3967
  static Telainicialdojogo + #1076, #92
  static Telainicialdojogo + #1077, #3967
  static Telainicialdojogo + #1078, #2172
  static Telainicialdojogo + #1079, #3967

  ;Linha 27
  static Telainicialdojogo + #1080, #3967
  static Telainicialdojogo + #1081, #2172
  static Telainicialdojogo + #1082, #47
  static Telainicialdojogo + #1083, #3967
  static Telainicialdojogo + #1084, #3967
  static Telainicialdojogo + #1085, #3967
  static Telainicialdojogo + #1086, #3967
  static Telainicialdojogo + #1087, #3967
  static Telainicialdojogo + #1088, #3967
  static Telainicialdojogo + #1089, #3967
  static Telainicialdojogo + #1090, #3967
  static Telainicialdojogo + #1091, #2346
  static Telainicialdojogo + #1092, #3967
  static Telainicialdojogo + #1093, #2346
  static Telainicialdojogo + #1094, #3967
  static Telainicialdojogo + #1095, #3967
  static Telainicialdojogo + #1096, #3967
  static Telainicialdojogo + #1097, #3967
  static Telainicialdojogo + #1098, #3967
  static Telainicialdojogo + #1099, #3967
  static Telainicialdojogo + #1100, #3967
  static Telainicialdojogo + #1101, #3967
  static Telainicialdojogo + #1102, #3967
  static Telainicialdojogo + #1103, #3114
  static Telainicialdojogo + #1104, #3967
  static Telainicialdojogo + #1105, #3114
  static Telainicialdojogo + #1106, #3967
  static Telainicialdojogo + #1107, #3967
  static Telainicialdojogo + #1108, #3967
  static Telainicialdojogo + #1109, #3967
  static Telainicialdojogo + #1110, #3967
  static Telainicialdojogo + #1111, #3967
  static Telainicialdojogo + #1112, #3967
  static Telainicialdojogo + #1113, #3967
  static Telainicialdojogo + #1114, #3967
  static Telainicialdojogo + #1115, #3967
  static Telainicialdojogo + #1116, #3967
  static Telainicialdojogo + #1117, #92
  static Telainicialdojogo + #1118, #2172
  static Telainicialdojogo + #1119, #3967

  ;Linha 28
  static Telainicialdojogo + #1120, #3967
  static Telainicialdojogo + #1121, #47
  static Telainicialdojogo + #1122, #3967
  static Telainicialdojogo + #1123, #3967
  static Telainicialdojogo + #1124, #3967
  static Telainicialdojogo + #1125, #3967
  static Telainicialdojogo + #1126, #3967
  static Telainicialdojogo + #1127, #3967
  static Telainicialdojogo + #1128, #3967
  static Telainicialdojogo + #1129, #3967
  static Telainicialdojogo + #1130, #2347
  static Telainicialdojogo + #1131, #2346
  static Telainicialdojogo + #1132, #3967
  static Telainicialdojogo + #1133, #2346
  static Telainicialdojogo + #1134, #2347
  static Telainicialdojogo + #1135, #3967
  static Telainicialdojogo + #1136, #3967
  static Telainicialdojogo + #1137, #3967
  static Telainicialdojogo + #1138, #3967
  static Telainicialdojogo + #1139, #3967
  static Telainicialdojogo + #1140, #3967
  static Telainicialdojogo + #1141, #3967
  static Telainicialdojogo + #1142, #3183
  static Telainicialdojogo + #1143, #3114
  static Telainicialdojogo + #1144, #3967
  static Telainicialdojogo + #1145, #3114
  static Telainicialdojogo + #1146, #3183
  static Telainicialdojogo + #1147, #3967
  static Telainicialdojogo + #1148, #3967
  static Telainicialdojogo + #1149, #3967
  static Telainicialdojogo + #1150, #3967
  static Telainicialdojogo + #1151, #3967
  static Telainicialdojogo + #1152, #3967
  static Telainicialdojogo + #1153, #3967
  static Telainicialdojogo + #1154, #3967
  static Telainicialdojogo + #1155, #3967
  static Telainicialdojogo + #1156, #3967
  static Telainicialdojogo + #1157, #3967
  static Telainicialdojogo + #1158, #92
  static Telainicialdojogo + #1159, #3967

  ;Linha 29
  static Telainicialdojogo + #1160, #47
  static Telainicialdojogo + #1161, #3967
  static Telainicialdojogo + #1162, #3967
  static Telainicialdojogo + #1163, #3967
  static Telainicialdojogo + #1164, #3967
  static Telainicialdojogo + #1165, #3967
  static Telainicialdojogo + #1166, #3967
  static Telainicialdojogo + #1167, #3967
  static Telainicialdojogo + #1168, #3967
  static Telainicialdojogo + #1169, #3967
  static Telainicialdojogo + #1170, #3967
  static Telainicialdojogo + #1171, #3967
  static Telainicialdojogo + #1172, #3967
  static Telainicialdojogo + #1173, #3967
  static Telainicialdojogo + #1174, #3967
  static Telainicialdojogo + #1175, #3967
  static Telainicialdojogo + #1176, #3967
  static Telainicialdojogo + #1177, #3967
  static Telainicialdojogo + #1178, #3967
  static Telainicialdojogo + #1179, #3967
  static Telainicialdojogo + #1180, #3967
  static Telainicialdojogo + #1181, #3967
  static Telainicialdojogo + #1182, #3967
  static Telainicialdojogo + #1183, #3967
  static Telainicialdojogo + #1184, #3967
  static Telainicialdojogo + #1185, #3967
  static Telainicialdojogo + #1186, #3967
  static Telainicialdojogo + #1187, #3967
  static Telainicialdojogo + #1188, #3967
  static Telainicialdojogo + #1189, #3967
  static Telainicialdojogo + #1190, #3967
  static Telainicialdojogo + #1191, #3967
  static Telainicialdojogo + #1192, #3967
  static Telainicialdojogo + #1193, #3967
  static Telainicialdojogo + #1194, #3967
  static Telainicialdojogo + #1195, #3967
  static Telainicialdojogo + #1196, #3967
  static Telainicialdojogo + #1197, #3967
  static Telainicialdojogo + #1198, #3967
  static Telainicialdojogo + #1199, #92

printTelainicialdojogoScreen:
  push R0
  push R1
  push R2
  push R3

  loadn R0, #Telainicialdojogo
  loadn R1, #0
  loadn R2, #1200

  printTelainicialdojogoScreenLoop:

    add R3,R0,R1
    loadi R3, R3
    outchar R3, R1
    inc R1
    cmp R1, R2

    jne printTelainicialdojogoScreenLoop

  pop R3
  pop R2
  pop R1
  pop R0
  rts