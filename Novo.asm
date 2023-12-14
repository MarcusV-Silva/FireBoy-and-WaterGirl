jmp main

letra: var #1
posicaoFireBoy: var #1
posicaoWaterGirl: var #1
saltarFireBoy: var #1
saltarWaterGirl: var #1

main:
	
	loadn r1, #Tela1Linha0
    loadn r2, #256
    call ImprimeTela

    loadn r1, #Tela3Linha0
    loadn r2, #1536
    call ImprimeTela

    loadn r1, #Tela4Linha0
    loadn r2, #0
    call ImprimeTela
	
 	call pressioneE

	loadn r3, #1043
	store posicaoFireBoy, r3	;posicao inicial Fireboy
    loadn r2, #2304				;Cor que sera impressa
    loadn r5, #'!'				;Caracter que sera impresso
    call ImprimePersonagem		;Usa r2, r3 e r4
    
 	load r4, saltarFireBoy
	call zeraSalto	;			Inicializa a variável salto como 0
	
	loadn r3, #883
 	store posicaoWaterGirl, r3	;posicao inicial Wategirl
    loadn r2, #3072				;Cor que sera imprimida
    loadn r5, #'$'				;Caracter  que sera imprimido
    call ImprimePersonagem		;Usa r2, r3 e r4
	
 	load r4, saltarWaterGirl
	call zeraSalto	;Inicializa a variável salto como 0
	
	jmp Nivel1
	
Nivel1:
	;Lê o teclado e atualiza posição
	call movimentaPersonagens
	
	call Delay
	;Faz o FireBoy e a WaterGirl caírem
	call gravidade

	call Delay
	jmp Nivel1

pressioneE:
    
    call DigLetra	;Coloca a letra digitada na variável letra
    load r1, letra	;Carrega a letra digitada

    loadn r0, #'e'
    cmp r0, r1
    jne pressioneE		;compare not equal => se a tecla não foi digitada continua no loop
    call imprimeNivel

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

    loadn r2, #3072				;Cor que sera imprimida
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

    loadn r0, #0
    cmp r0, r4
    cne moveCima

    loadn r0, #'a'
    cmp r0, r1
    ceq moveEsquerda

    loadn r0, #'d'
    cmp r0, r1
    ceq moveDireita

	loadn r0, #'w'
    cmp r0, r1
    ceq ativaSalto
    
    store saltarFireBoy, r4
	store posicaoFireBoy, r3	;Atualiza a variável de posição do Fireboy

	;Movimento WaterGirl
    loadn r2, #3072				;Cor que sera imprimida
    load r3, posicaoWaterGirl	;Posição da impressao
    loadn r5, #'$'				;Caracter  que sera imprimido
    load r4, saltarWaterGirl

    loadn r0, #0
    cmp r0, r4
    cne moveCima

	loadn r0, #'j'
    cmp r0, r1
    ceq moveEsquerda

    loadn r0, #'l'
    cmp r0, r1
    ceq moveDireita

	loadn r0, #'i'
    cmp r0, r1
    ceq ativaSalto

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
	loadn r4, #Tela6Linha0
	loadn r5, #0
	loadn r6, #40
	
	;----Testa colisão com o chão--------
	add r5, r3, r6  ; R4 = pos de baixo do mario ;;
	div r2, r5, r6  ;R1 = posMario de baixo / 40 = linha de baixo
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
	loadn r4, #Tela6Linha0
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
	loadn r4, #Tela6Linha0
	loadn r5, #0
	loadn r6, #40
	
	;----Testa colisão com o chão--------
	sub r5, r3, r6  ;r5 = posição acima do personagem
	div r2, r5, r6  ;r2 = posição acima do personagem / 40 = linha de baixo
	add r4, r4, r2  ;r4 = r4 + r2 = 1º posicao da string acima dele
	add r4, r4, r5  ;r4 = r4 + r5 = 
	loadn r5, #37 ; #
	loadi r7, r4
	cmp r5, r7		;if ('#' == r7) para de cair
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
	loadn r4, #Tela6Linha0
	loadn r5, #0
	loadn r6, #40
	
	;----Testa colisão com o chão--------
	add r5, r3, r6  ; R4 = pos de baixo do mario ;;
	div r2, r5, r6  ;R1 = posMario de baixo / 40 = linha de baixo
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

imprimeNivel:
	loadn r1, #Tela2Linha0
	loadn r2, #256
	call ImprimeEApaga

	loadn r1, #Tela5Linha0
	loadn r2, #1536
	call ImprimeTela

	loadn r1, #Tela6Linha0
	loadn r2, #2048
	call ImprimeTela
	
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
Tela1Linha8  : string "          Fireboy                       "
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
Tela1Linha19 : string "  A - Esquerda                          "
Tela1Linha20 : string "  D - Direita                           "
Tela1Linha21 : string "                                        "
Tela1Linha22 : string "       !                                "
Tela1Linha23 : string "                                        "
Tela1Linha24 : string "                                        "
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
Tela3Linha8  : string "                    Watergirl           "
Tela3Linha9  : string "                                        "
Tela3Linha10 : string "                                        "
Tela3Linha11 : string "                                        "
Tela3Linha12 : string "                                        "
Tela3Linha13 : string "                                        "
Tela3Linha14 : string "                                        "
Tela3Linha15 : string "                                        "
Tela3Linha16 : string "                           Watergirl    "
Tela3Linha17 : string "                                        "
Tela3Linha18 : string "                       I - Pular        "
Tela3Linha19 : string "                       J - Esquerda     "
Tela3Linha20 : string "                       L - Direita      "
Tela3Linha21 : string "                                        "
Tela3Linha22 : string "                              $         "
Tela3Linha23 : string "                                        "
Tela3Linha24 : string "                                        "
Tela3Linha25 : string "                                        "
Tela3Linha26 : string "                                        "
Tela3Linha27 : string "                                        "
Tela3Linha28 : string "                                        "
Tela3Linha29  :string "                                        "

;---------------------------------------------------------------
;                       Texto em branco
;---------------------------------------------------------------

Tela4Linha0  : string "                                        "
Tela4Linha1  : string "                                        "
Tela4Linha2  : string "                                        "
Tela4Linha3  : string "                                        "
Tela4Linha4  : string "                                        "
Tela4Linha5  : string "                                        "
Tela4Linha6  : string "                                        "
Tela4Linha7  : string "                                        "
Tela4Linha8  : string "                  e                     "
Tela4Linha9  : string "                                        "
Tela4Linha10 : string "                                        "
Tela4Linha11 : string "               Controles                "
Tela4Linha12 : string "                                        "
Tela4Linha13 : string "                                        "
Tela4Linha14 : string "                                        "
Tela4Linha15 : string "                                        "
Tela4Linha16 : string "                                        "
Tela4Linha17 : string "                                        "
Tela4Linha18 : string "                                        "
Tela4Linha19 : string "                                        "
Tela4Linha20 : string "                                        "
Tela4Linha21 : string "                                        "
Tela4Linha22 : string "                                        "
Tela4Linha23 : string "                                        "
Tela4Linha24 : string "                                        "
Tela4Linha25 : string "                                        "
Tela4Linha26 : string "                                        "
Tela4Linha27 : string "      Pressione 'e' para iniciar        "
Tela4Linha28 : string "                                        "
Tela4Linha29  :string "                                        "

;---------------------------------------------------------------
;							Nível 1 (Lava)
;----------------------------------------------------------------

Tela2Linha0  : string "                                        "
Tela2Linha1  : string "                                        "
Tela2Linha2  : string "                                        "
Tela2Linha3  : string "                                        "
Tela2Linha4  : string "                                   ___  "
Tela2Linha5  : string "                                  |   | "
Tela2Linha6  : string "                *                 |   | "
Tela2Linha7  : string "                                        "
Tela2Linha8  : string "                                        "
Tela2Linha9  : string " *                                      "
Tela2Linha10 : string "                                        "
Tela2Linha11 : string "                          ___           "
Tela2Linha12 : string "                                        "
Tela2Linha13 : string "                                        "
Tela2Linha14 : string "                                        "
Tela2Linha15 : string "             ___                        "
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
Tela5Linha3  : string "                                        "
Tela5Linha4  : string "          *                   ___       "
Tela5Linha5  : string "                             |   |      "
Tela5Linha6  : string "                             |   |      "
Tela5Linha7  : string "                                        "
Tela5Linha8  : string "                                        "
Tela5Linha9  : string "                                        "
Tela5Linha10 : string "                                        "
Tela5Linha11 : string "                          ___           "
Tela5Linha12 : string "                                        "
Tela5Linha13 : string "                                        "
Tela5Linha14 : string "                                        "
Tela5Linha15 : string "         *   ___                        "
Tela5Linha16 : string "                                        "
Tela5Linha17 : string "                                        "
Tela5Linha18 : string "                                        "
Tela5Linha19 : string "       /                                "
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
Tela6Linha5  : string "%       %%%%%                          %"
Tela6Linha6  : string "%         %%%%%                        %"
Tela6Linha7  : string "%           %%%%%%%%%%%%%%%%%%%%%%%%%%%%"
Tela6Linha8  : string "%           %%%%%%%%%                  %"
Tela6Linha9  : string "%                                      %"
Tela6Linha10 : string "%%%%%%%%                               %"
Tela6Linha11 : string "%%%%%%%%                               %"
Tela6Linha12 : string "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%[][][]%"
Tela6Linha13 : string "%                                      %"
Tela6Linha14 : string "%                                      %"
Tela6Linha15 : string "%                                      %"
Tela6Linha16 : string "%[][]%%%%%%%%%%%%%%%%%%%%              %"
Tela6Linha17 : string "%                     %%%%%%%%%%%%%%%%%%"
Tela6Linha18 : string "%                               %%%%%%%%"
Tela6Linha19 : string "%                                      %"
Tela6Linha20 : string "%%%%%%%%%%%%                           %"
Tela6Linha21 : string "%%%%%%%%%%%%%                          %"
Tela6Linha22 : string "%            %%%%%    %%%%%            %"
Tela6Linha23 : string "%              %%%%%%%%%%%             %"
Tela6Linha24 : string "%%%%%%%%                               %"
Tela6Linha25 : string "%%%%%%%%                               %"
Tela6Linha26 : string "%                                      %"
Tela6Linha27 : string "%                                      %"
Tela6Linha28 : string "%%%%%%%%       %%%%%%        %%%%%%%%%%%"
Tela6Linha29 : string "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
