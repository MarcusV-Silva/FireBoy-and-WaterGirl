jmp main

letra: var #1
posicaoFireBoy: var #1
posicaoWaterGirl: var #1
linhaAtual: var #1
colunaAtual: var #1
faseAtual: var #1200 ;vetor de 1200 posições

main:

	loadn r0, #1002
	store posicaoFireBoy, r0		; posicao inicial Fireboy
	
	loadn r1, #1024
 	store posicaoWaterGirl, r1		; posicao inicial Wategirl

 	loadn r1, #Tela1Linha0
	loadn r2, #1536
	call ImprimeTela
	call loop

loop:
	;Lê o teclado e atualiza posição
	call verificaTeclaPressionada
	
	
	;Fase atual
	loadn r1, #Tela1Linha0	;Tela
	loadn r2, #0 			;Cor adicional
	call ImprimeTela

	;Atualiza linha e coluna do FireBoy(por enquanto) *Testar*
	call atualizaPosicao
	
	;Faz o FireBoy e a WaterGirl caírem
	call gravidade
		
	call Delay
	jmp loop

gravidade:
	push r0
	push r2
	push r5
	
	loadn r0, #1000				;Linha do chão (pode ser setado fora daqui se apagarmos essa linha)
	
	loadn r2, #2304				;Cor que sera impressa
    load r3, posicaoFireBoy		;Posição da impressao
    loadn r5, #'$'				;Caracter que sera impresso
    
    cmp r3, r0					;Se não passar do chão
    cle moveBaixo				;Move para baixo
    store posicaoFireBoy, r3	;Atualiza a posição do FireBoy
    
	
    loadn r2, #3072				;Cor que sera imprimida
    load r3, posicaoWaterGirl	;Posição da impressao
    loadn r5, #'$'				;Caracter que sera imprimido
        
    cmp r3, r0					;Se não passar do chão
    cle moveBaixo				;Move para baixo
    store posicaoWaterGirl, r3	;Atualiza a posição da WaterGirl
    
	pop r5
	pop r2
	pop r0
	rts

verificaTeclaPressionada:

    push r3			;Protege r3 para ser usado no calculo da nova posição
    call DigLetra	;Coloca a letra digitada na variável letra
    load r1, letra	;Carrega a letra digitada
    
	;Movimento FireBoy
    loadn r2, #2304				;Cor que sera impressa
    load r3, posicaoFireBoy		;Posição da impressao
    loadn r5, #'$'				;Caracter que sera impresso
    
    loadn r0, #'a'
    cmp r0, r1
    ceq moveEsquerda
    
    loadn r0, #'d'
    cmp r0, r1
    ceq moveDireita
	
	loadn r0, #'w'
    cmp r0, r1
    ceq moveCima
	
	loadn r0, #'s'
    cmp r0, r1
    ceq moveBaixo
    
	store posicaoFireBoy, r3	;Atualiza a variável de posição do Fireboy
    
	;Movimento WaterGirl
    loadn r2, #3072				;Cor que sera imprimida
    load r3, posicaoWaterGirl	;Posição da impressao
    loadn r5, #'$'				;Caracter  que sera imprimido
    
	loadn r0, #'j'
    cmp r0, r1
    ceq moveEsquerda
    
    loadn r0, #'l'
    cmp r0, r1
    ceq moveDireita
    
	loadn r0, #'i'
    cmp r0, r1
    ceq moveCima
    
	loadn r0, #'k'
    cmp r0, r1
    ceq moveBaixo
    
   	store posicaoWaterGirl, r3	;Atualiza a variável de posição da WhaterGirl
    
    pop r3	;Recupera o valor anterior do r3
	rts

;Encontra e Armazena a Posicao Atual dos personagens
atualizaPosicao:
	push r0
	push r1
	push r2
	push r3

	loadn r0, #40
	load r3, posicaoFireBoy
	
	div r1, r3, r0
	store linhaAtual, r1

	mul r1, r1, r0
	sub r2, r3, r1
	store colunaAtual, r2

	pop r0
	pop r1
	pop r2
	pop r4
	rts

;---------Movimentacao-------------
moveEsquerda:
    call ApagaObj			;Usa r3
    call VaiEsquerda		;Usa r3
    call ImprimePersonagem	;Usa r2, r3 e r4
    call Delay
    rts

moveDireita:  
    call ApagaObj			;Usa r3
    call VaiDireita			;Usa r3
    call ImprimePersonagem	;Usa r2, r3 e r4
    call Delay
    rts

moveCima:
    call ApagaObj			;Usa r3
    call VaiCima			;Usa r3
    call ImprimePersonagem	;Usa r2, r3 e r4
    call Delay
    rts

moveBaixo:
    call ApagaObj			;Usa r3
    call VaiBaixo			;Usa r3
    call ImprimePersonagem	;Usa r2, r3 e r4
    call Delay
    rts

;---------------Subrotinas--------------------

;Imprime o personagem
ImprimePersonagem:	;r2: Cor
	add r5, r2, r5 	;r3: Posição
    outchar r5, r3  ;r5: Caracter
    rts

;Funções que fazem o personagem se movimentar
;r3: posição do personagem
VaiBaixo:
	loadn r1, #40
	add r3, r3, r1
	rts
	
VaiCima:
	loadn r1, #160
	sub r3, r3, r1
	rts
	
VaiEsquerda:
    dec r3
    rts
    
VaiDireita:
    inc r3 
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

Tela1Linha0  : string "                                        "
Tela1Linha1  : string "             TESTE INICIAL              "
Tela1Linha2  : string "                                        "
Tela1Linha3  : string "                                        "
Tela1Linha4  : string "                                        "
Tela1Linha5  : string "                                        "
Tela1Linha6  : string "                                        "
Tela1Linha7  : string "                                        "
Tela1Linha8  : string "                                        "
Tela1Linha9  : string "                                        "
Tela1Linha10 : string "                                        "
Tela1Linha11 : string "                                        "
Tela1Linha12 : string "                                        "
Tela1Linha13 : string "                                        "
Tela1Linha14 : string "                                        "
Tela1Linha15 : string "                                        "
Tela1Linha16 : string "                                        "
Tela1Linha17 : string "                                        "
Tela1Linha18 : string "                                        "
Tela1Linha19 : string "                                        "
Tela1Linha20 : string "                                        "
Tela1Linha21 : string "                                        "
Tela1Linha22 : string "                                        "
Tela1Linha23 : string "                      ---------         "
Tela1Linha24 : string "                                        "
Tela1Linha25 : string "                                        "
Tela1Linha26 : string "}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}"
Tela1Linha27 : string "   |                               |    "
Tela1Linha28 : string "   |                               |    "
Tela1Linha29  :string "   |                               |    " 
