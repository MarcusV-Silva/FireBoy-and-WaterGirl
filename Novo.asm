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

	loadn r1, #Tela1Linha0
    loadn r2, #2304
    call ImprimeEApaga

    loadn r1, #Tela3Linha0
    loadn r2, #1536
    call ImprimeTela

    loadn r1, #Tela4Linha0
    loadn r2, #0
    call ImprimeTela
	
 	call pressioneE

	loadn r3, #270
	store posicaoFireBoy, r3	;posicao inicial Fireboy
	loadn r2, #2304				;Cor que sera impressa
	loadn r5, #'!'				;Caracter que sera impresso
	call ImprimePersonagem		;Usa r2, r3 e r4
    
 	load r4, saltarFireBoy
	call zeraSalto	;			Inicializa a variável salto como 0
	
	loadn r1, #Tela6Linha0
	store telaAtual, r1

	loadn r3, #269
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
	jmp imprimeGameOver
	rts

verificaGirlNaLava1Nivel2:
	load r1, posicaoWaterGirl
	load r2, Lava1Fase2
	
	
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