jmp main

letra: var #1
linhaAtual: var #1
colunaAtual: var #1
faseAtual: var #1200 ;vetor de 1200 posições

main:
  loadn r1, #Tela1Linha0
  loadn r2, #1536 
  call ImprimeTela

  loadn r4, #1002 ; posicao inicial Fireboy
  loadn r6, #1020 ; posicao inicial Wategirl

  call definePosicao
  call loop

loop:
  ;Fazer a fase atual ficar rodando aqui
  call verificaTeclaPressionada
  call definePosicao
  call Delay
  jmp loop

verificaTeclaPressionada:

    call DigLetra
    loadn r0, #'a'
    load r1, letra
    cmp r0, r1
    ceq moveEsquerda

    loadn r0, #'d'
    load r1, letra
    cmp r0, r1
    ceq moveDireita

	loadn r0, #'w'
    load r1, letra
    cmp r0, r1
    ceq moveCima

	loadn r0, #'s'
    load r1, letra
    cmp r0, r1
    ceq moveBaixo

	loadn r0, #'j'
    load r1, letra
    cmp r0, r1
    ceq moveEsquerdaW

    loadn r0, #'l'
    load r1, letra
    cmp r0, r1
    ceq moveDireitaW

	loadn r0, #'i'
    load r1, letra
    cmp r0, r1
    ceq moveCimaW

	loadn r0, #'k'
    load r1, letra
    cmp r0, r1
    ceq moveBaixoW

  jmp verificaTeclaPressionada

;Encontra e Armazena a Posicao Atual do personagem
definePosicao:
	push r0
	push r1
	push r2

	loadn r0, #40
	div r1, r4, r0
	store linhaAtual, r1

	mul r1, r1, r0
	sub r2, r4, r1
	store colunaAtual, r2

	pop r0
	pop r1
	pop r2
	rts

;---------Movimentacao-------------
moveEsquerda:
    call ApagaObj
    call VaiEsquerda
    call ImprimeFire
    call Delay
    rts

moveDireita:  
    call ApagaObj
    call VaiDireita
    call ImprimeFire
    call Delay
    rts

moveCima:
	call ApagaObj
    call VaiCima
    call ImprimeFire
    call Delay
    rts

moveBaixo:
	call ApagaObj
    call VaiBaixo
    call ImprimeFire
    call Delay
    rts

moveEsquerdaW:
    call ApagaObjW
    call VaiEsquerdaW
    call ImprimeWater
    call Delay
    rts

moveDireitaW:  
    call ApagaObjW
    call VaiDireitaW
    call ImprimeWater
    call Delay
    rts

moveCimaW:
	call ApagaObjW
    call VaiCimaW
    call ImprimeWater
    call Delay
    rts

moveBaixoW:
	call ApagaObjW
    call VaiBaixoW
    call ImprimeWater
    call Delay
    rts
;---------------Subrotinas--------------------

ImprimeFire:
    loadn r5, #'!'
    loadn r2, #2304
	add r5, r2, r5 	; Adicionando cor
    outchar r5, r4  
    rts

ImprimeWater:
    loadn r5, #'!'
    loadn r2, #3072 
	add r5, r2, r5 	; Adicionando cor
    outchar r5, r6  
    rts

VaiBaixo:
	loadn r2, #40
	add r4, r4, r2
	rts

VaiCima:
	loadn r2, #40
	sub r4, r4, r2
	rts

VaiEsquerda:
    dec r4
    rts

VaiDireita:
    inc r4  
    rts

VaiBaixoW:
	loadn r2, #40
	add r6, r6, r2
	rts

VaiCimaW:
	loadn r2, #40
	sub r6, r6, r2
	rts

VaiEsquerdaW:
    dec r6
    rts

VaiDireitaW:
    inc r6  
    rts

ApagaObj:
    outchar r2, r4  ; r0 -> Posição r2 -> " "
    rts 

ApagaObjW:
    outchar r2, r6  ; r0 -> Posição r2 -> " "
    rts 

DigLetra:	; Espera que uma tecla seja digitada e salva na variavel global "Letra"
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

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	loadn R6, #Tela1Linha0	; Endereco onde comeca a primeira linha do cenario!!
	
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
		Loadn R0, #60000		; Intensidade do Delay
		
   		Delay_volta1: 
			dec R0					
			jnz Delay_volta1	
			dec R1
			jnz Delay_volta2
	
	pop R1
	pop R0
	
	rts							; Return

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
Tela1Linha23 : string "                                        "
Tela1Linha24 : string "                                        "
Tela1Linha25 : string "                                        "
Tela1Linha26 : string "----------------------------------------"
Tela1Linha27 : string "   |                               |    "
Tela1Linha28 : string "   |                               |    "
Tela1Linha29  :string "   |                               |    " 	