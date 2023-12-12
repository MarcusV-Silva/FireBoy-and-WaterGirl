jmp main

letra: var #1

main:
	call loop

loop:
	call printTelainicialScreen

  call DigLetra
    loadn r0, #'w'
    load r1, letra
    cmp r0, r1
    ceq verificaTeclaPressionada;

  call DigLetra
	loadn r0, #'e'
	load r1, letra
	cmp r0, r1	; if tecla == 'e' : tela Instru├º├úo
	ceq printTelainstrucaoScreen; 

  call DigLetra
  loadn r1, #Tela0Linha0 
  loadn r2, #2304
	loadn r4, #'e'
	load r3, letra
	cmp r4, r3	; if tecla == 'e' : tela Instru├º├úo
	ceq imprimeTela; 

  call DigLetra
  loadn r1, #Tela1Linha0 
  loadn r2, #2304
	loadn r4, #'e'
	load r3, letra
	cmp r4, r3	; if tecla == 'e' : tela Instru├º├úo
	ceq imprimeTela; 

  call DigLetra
  loadn r0, #'f'
	load r1, letra
	cmp r0, r1 ; if tecla == 'f' : fim
	ceq fim;


;    call ApagaObj
;    call RecalculaPos
;    call ImprimeObj
;    call Delay
;    jmp Loop


  call Delay

fim:
    halt

;*******************************************************
;                   MOVIMENTAÇÃO
;*******************************************************

verificaTeclaPressionada:
  call DigLetra
    loadn r0, #'w'
    load r5, letra
    cmp r0, r1
    ceq moveJogador

  jmp verificaTeclaPressionada


moveJogador:  ; Move o jogador
  ;call ApagaObj
  call RecalculaPos
  call ImprimeObj
  call Delay
  ;jmp moveJogador


;---------------Subrotinas--------------------



ApagaObj:
    outchar r2, r4  ; r0 -> Posição r2 -> " "
    rts

RecalculaPos:
    inc r4  ; r0++
    rts

ImprimeObj:
    outchar r5, r4  ; r0-> Posicao  r1-> "O"
    rts


;------------------------		
;********************************************************
;                   DIGITE UMA LETRA
;********************************************************

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


printTelainicialScreen:
  push R0
  push R1
  push R2
  push R3

  loadn R0, #Telainicial
  loadn R1, #0
  loadn R2, #1200

  printTelainicialScreenLoop:

    add R3,R0,R1
    loadi R3, R3
    outchar R3, R1
    inc R1
    cmp R1, R2

    jne printTelainicialScreenLoop

  pop R3
  pop R2
  pop R1
  pop R0
  rts

printTelainstrucaoScreen:
  push R0
  push R1
  push R2
  push R3

  loadn R0, #Telainstrucao
  loadn R1, #0
  loadn R2, #1200

  printTelainstrucaoScreenLoop:

    add R3,R0,R1
    loadi R3, R3
    outchar R3, R1
    inc R1
    cmp R1, R2

    jne printTelainstrucaoScreenLoop

  pop R3
  pop R2
  pop R1
  pop R0
  rts

imprimeTela: 	;  Rotina de Impresao de Cenario na Tela Inteira
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
	loadn R6, #Tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	
    imprimeTela2_Loop:
		call imprimeStr
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		add r6, r6, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne imprimeTela2_Loop	; Enquanto r0 < 1200

	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

;---- Inicio das Subrotinas -----
	
imprimeStr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina
	
	
	loadn r3, #'\0'	; Criterio de parada
	loadn r5, #' '	; Espaco em Branco

	imprimeStr_Loop:
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq imprimeStr_Sai
		cmp r4, r5		; If (Char == ' ')  vai Pula outchar do espaco para na apagar outros caracteres
		jeq imprimeStr_Skip
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		storei r6, r4

    imprimeStr_Skip:
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		inc r6			; Incrementa o ponteiro da String da Tela 0
		jmp imprimeStr_Loop
	
    imprimeStr_Sai:	
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

;********************************************************	
;                      TELAS
;********************************************************	

Tela0Linha0  : string "                                        "
Tela0Linha1  : string "               INSTRUCOES               "
Tela0Linha2  : string "                                        "
Tela0Linha3  : string "                                        "
Tela0Linha4  : string "      TESTE FAZENDO ALGO TRABALHO       "
Tela0Linha5  : string "                                        "
Tela0Linha6  : string "                                        "
Tela0Linha7  : string "                                        "
Tela0Linha8  : string "                                        "
Tela0Linha9  : string "                                        "
Tela0Linha10  :string "                                        "
Tela0Linha11  :string "                                        "
Tela0Linha12  :string "                                        "
Tela0Linha13  :string "                                        "
Tela0Linha14  :string "                                        "
Tela0Linha15  :string "              FEITO POR:                "
Tela0Linha16  :string "                                        "
Tela0Linha17  :string "          Andre Jacob Suaide            "
Tela0Linha18  :string "       Felipe Aparecido da Silva        "
Tela0Linha19  :string "         Gustavo Carvalho Araujo        "
Tela0Linha20  :string "      Henrique de Oliveira Araujo       "
Tela0Linha21  :string "       Marcus Vinicius da Silva         "
Tela0Linha22  :string "        Oliver Kenzo Kobayashi          "
Tela0Linha23  :string "      Rodrigo Rodrigues de Castro       "
Tela0Linha24  :string "       Viktor Sergio Ferreira           "
Tela0Linha25  :string "     Vitor Augusto Paiva de Brito       "
Tela0Linha26  :string "        Yazid Alamou Bouari             "
Tela0Linha27  :string "                                        "
Tela0Linha28  :string "             ICMC - USP                 "
Tela0Linha29  :string "                                        " 


; Tela Jogo
Tela1Linha0  : string "                                        "
Tela1Linha1  : string "                                        "
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
Tela1Linha26 : string "                                        "
Tela1Linha27 : string "                                        "
Tela1Linha28 : string "                                        "
Tela1Linha29 : string "                                        "	
Telainicial : var #1200
  ;Linha 0
  static Telainicial + #0, #95
  static Telainicial + #1, #95
  static Telainicial + #2, #95
  static Telainicial + #3, #95
  static Telainicial + #4, #95
  static Telainicial + #5, #95
  static Telainicial + #6, #95
  static Telainicial + #7, #95
  static Telainicial + #8, #95
  static Telainicial + #9, #95
  static Telainicial + #10, #95
  static Telainicial + #11, #95
  static Telainicial + #12, #95
  static Telainicial + #13, #95
  static Telainicial + #14, #95
  static Telainicial + #15, #95
  static Telainicial + #16, #95
  static Telainicial + #17, #95
  static Telainicial + #18, #95
  static Telainicial + #19, #95
  static Telainicial + #20, #95
  static Telainicial + #21, #95
  static Telainicial + #22, #95
  static Telainicial + #23, #95
  static Telainicial + #24, #95
  static Telainicial + #25, #95
  static Telainicial + #26, #95
  static Telainicial + #27, #95
  static Telainicial + #28, #95
  static Telainicial + #29, #95
  static Telainicial + #30, #95
  static Telainicial + #31, #95
  static Telainicial + #32, #95
  static Telainicial + #33, #95
  static Telainicial + #34, #95
  static Telainicial + #35, #95
  static Telainicial + #36, #95
  static Telainicial + #37, #95
  static Telainicial + #38, #95
  static Telainicial + #39, #95

  ;Linha 1
  static Telainicial + #40, #95
  static Telainicial + #41, #95
  static Telainicial + #42, #3967
  static Telainicial + #43, #3967
  static Telainicial + #44, #3967
  static Telainicial + #45, #3967
  static Telainicial + #46, #3967
  static Telainicial + #47, #3967
  static Telainicial + #48, #3967
  static Telainicial + #49, #3967
  static Telainicial + #50, #3967
  static Telainicial + #51, #3967
  static Telainicial + #52, #3967
  static Telainicial + #53, #3967
  static Telainicial + #54, #3967
  static Telainicial + #55, #3967
  static Telainicial + #56, #3967
  static Telainicial + #57, #3967
  static Telainicial + #58, #3967
  static Telainicial + #59, #3967
  static Telainicial + #60, #3967
  static Telainicial + #61, #3967
  static Telainicial + #62, #3967
  static Telainicial + #63, #3967
  static Telainicial + #64, #3967
  static Telainicial + #65, #3967
  static Telainicial + #66, #3967
  static Telainicial + #67, #3967
  static Telainicial + #68, #3967
  static Telainicial + #69, #3967
  static Telainicial + #70, #3967
  static Telainicial + #71, #3967
  static Telainicial + #72, #3967
  static Telainicial + #73, #3967
  static Telainicial + #74, #3967
  static Telainicial + #75, #3967
  static Telainicial + #76, #3967
  static Telainicial + #77, #3967
  static Telainicial + #78, #95
  static Telainicial + #79, #95

  ;Linha 2
  static Telainicial + #80, #95
  static Telainicial + #81, #3967
  static Telainicial + #82, #3967
  static Telainicial + #83, #3967
  static Telainicial + #84, #3967
  static Telainicial + #85, #3967
  static Telainicial + #86, #3967
  static Telainicial + #87, #3967
  static Telainicial + #88, #3967
  static Telainicial + #89, #3967
  static Telainicial + #90, #3967
  static Telainicial + #91, #3967
  static Telainicial + #92, #3967
  static Telainicial + #93, #3967
  static Telainicial + #94, #3967
  static Telainicial + #95, #3967
  static Telainicial + #96, #3967
  static Telainicial + #97, #3967
  static Telainicial + #98, #3967
  static Telainicial + #99, #3967
  static Telainicial + #100, #3967
  static Telainicial + #101, #3967
  static Telainicial + #102, #3967
  static Telainicial + #103, #3967
  static Telainicial + #104, #3967
  static Telainicial + #105, #3967
  static Telainicial + #106, #3967
  static Telainicial + #107, #3967
  static Telainicial + #108, #3967
  static Telainicial + #109, #3967
  static Telainicial + #110, #3967
  static Telainicial + #111, #3967
  static Telainicial + #112, #3967
  static Telainicial + #113, #3967
  static Telainicial + #114, #3967
  static Telainicial + #115, #3967
  static Telainicial + #116, #3967
  static Telainicial + #117, #3967
  static Telainicial + #118, #3967
  static Telainicial + #119, #95

  ;Linha 3
  static Telainicial + #120, #95
  static Telainicial + #121, #3967
  static Telainicial + #122, #3967
  static Telainicial + #123, #3967
  static Telainicial + #124, #3967
  static Telainicial + #125, #3967
  static Telainicial + #126, #3967
  static Telainicial + #127, #3967
  static Telainicial + #128, #2366
  static Telainicial + #129, #2377
  static Telainicial + #130, #2371
  static Telainicial + #131, #2381
  static Telainicial + #132, #2371
  static Telainicial + #133, #3967
  static Telainicial + #134, #3967
  static Telainicial + #135, #3967
  static Telainicial + #136, #3967
  static Telainicial + #137, #3967
  static Telainicial + #138, #3967
  static Telainicial + #139, #3967
  static Telainicial + #140, #3967
  static Telainicial + #141, #3967
  static Telainicial + #142, #3967
  static Telainicial + #143, #3967
  static Telainicial + #144, #3967
  static Telainicial + #145, #3967
  static Telainicial + #146, #3134
  static Telainicial + #147, #3141
  static Telainicial + #148, #3141
  static Telainicial + #149, #3155
  static Telainicial + #150, #3139
  static Telainicial + #151, #3967
  static Telainicial + #152, #3967
  static Telainicial + #153, #3967
  static Telainicial + #154, #3967
  static Telainicial + #155, #3967
  static Telainicial + #156, #3967
  static Telainicial + #157, #3967
  static Telainicial + #158, #3967
  static Telainicial + #159, #95

  ;Linha 4
  static Telainicial + #160, #95
  static Telainicial + #161, #3967
  static Telainicial + #162, #3967
  static Telainicial + #163, #3967
  static Telainicial + #164, #3967
  static Telainicial + #165, #3967
  static Telainicial + #166, #3967
  static Telainicial + #167, #3967
  static Telainicial + #168, #95
  static Telainicial + #169, #95
  static Telainicial + #170, #95
  static Telainicial + #171, #95
  static Telainicial + #172, #95
  static Telainicial + #173, #3967
  static Telainicial + #174, #3967
  static Telainicial + #175, #3967
  static Telainicial + #176, #3967
  static Telainicial + #177, #3967
  static Telainicial + #178, #3967
  static Telainicial + #179, #3967
  static Telainicial + #180, #3967
  static Telainicial + #181, #3967
  static Telainicial + #182, #3967
  static Telainicial + #183, #3967
  static Telainicial + #184, #3967
  static Telainicial + #185, #3967
  static Telainicial + #186, #95
  static Telainicial + #187, #95
  static Telainicial + #188, #95
  static Telainicial + #189, #95
  static Telainicial + #190, #95
  static Telainicial + #191, #3967
  static Telainicial + #192, #3967
  static Telainicial + #193, #3967
  static Telainicial + #194, #3967
  static Telainicial + #195, #3967
  static Telainicial + #196, #3967
  static Telainicial + #197, #3967
  static Telainicial + #198, #3967
  static Telainicial + #199, #95

  ;Linha 5
  static Telainicial + #200, #95
  static Telainicial + #201, #3967
  static Telainicial + #202, #3967
  static Telainicial + #203, #3967
  static Telainicial + #204, #3967
  static Telainicial + #205, #3967
  static Telainicial + #206, #3967
  static Telainicial + #207, #3967
  static Telainicial + #208, #124
  static Telainicial + #209, #3967
  static Telainicial + #210, #3967
  static Telainicial + #211, #3967
  static Telainicial + #212, #124
  static Telainicial + #213, #3967
  static Telainicial + #214, #3967
  static Telainicial + #215, #3967
  static Telainicial + #216, #3967
  static Telainicial + #217, #3967
  static Telainicial + #218, #3967
  static Telainicial + #219, #3967
  static Telainicial + #220, #3967
  static Telainicial + #221, #3967
  static Telainicial + #222, #3967
  static Telainicial + #223, #3967
  static Telainicial + #224, #3967
  static Telainicial + #225, #3967
  static Telainicial + #226, #124
  static Telainicial + #227, #3967
  static Telainicial + #228, #3967
  static Telainicial + #229, #3967
  static Telainicial + #230, #124
  static Telainicial + #231, #3967
  static Telainicial + #232, #3967
  static Telainicial + #233, #3967
  static Telainicial + #234, #3967
  static Telainicial + #235, #3967
  static Telainicial + #236, #3967
  static Telainicial + #237, #3967
  static Telainicial + #238, #3967
  static Telainicial + #239, #95

  ;Linha 6
  static Telainicial + #240, #95
  static Telainicial + #241, #3967
  static Telainicial + #242, #3967
  static Telainicial + #243, #3967
  static Telainicial + #244, #3967
  static Telainicial + #245, #3967
  static Telainicial + #246, #3967
  static Telainicial + #247, #3967
  static Telainicial + #248, #124
  static Telainicial + #249, #3967
  static Telainicial + #250, #3967
  static Telainicial + #251, #3967
  static Telainicial + #252, #124
  static Telainicial + #253, #3967
  static Telainicial + #254, #3967
  static Telainicial + #255, #2305
  static Telainicial + #256, #3967
  static Telainicial + #257, #3967
  static Telainicial + #258, #3967
  static Telainicial + #259, #3967
  static Telainicial + #260, #3967
  static Telainicial + #261, #3967
  static Telainicial + #262, #3967
  static Telainicial + #263, #3074
  static Telainicial + #264, #3967
  static Telainicial + #265, #3967
  static Telainicial + #266, #124
  static Telainicial + #267, #3967
  static Telainicial + #268, #3967
  static Telainicial + #269, #3967
  static Telainicial + #270, #124
  static Telainicial + #271, #3967
  static Telainicial + #272, #3967
  static Telainicial + #273, #3967
  static Telainicial + #274, #3967
  static Telainicial + #275, #3967
  static Telainicial + #276, #3967
  static Telainicial + #277, #3967
  static Telainicial + #278, #3967
  static Telainicial + #279, #95

  ;Linha 7
  static Telainicial + #280, #95
  static Telainicial + #281, #3967
  static Telainicial + #282, #3967
  static Telainicial + #283, #3967
  static Telainicial + #284, #3967
  static Telainicial + #285, #3967
  static Telainicial + #286, #3967
  static Telainicial + #287, #3967
  static Telainicial + #288, #124
  static Telainicial + #289, #3967
  static Telainicial + #290, #2304
  static Telainicial + #291, #3967
  static Telainicial + #292, #124
  static Telainicial + #293, #3967
  static Telainicial + #294, #3967
  static Telainicial + #295, #2307
  static Telainicial + #296, #3967
  static Telainicial + #297, #3967
  static Telainicial + #298, #3967
  static Telainicial + #299, #3967
  static Telainicial + #300, #3967
  static Telainicial + #301, #3967
  static Telainicial + #302, #3967
  static Telainicial + #303, #3075
  static Telainicial + #304, #3967
  static Telainicial + #305, #3967
  static Telainicial + #306, #124
  static Telainicial + #307, #3967
  static Telainicial + #308, #3104
  static Telainicial + #309, #3967
  static Telainicial + #310, #124
  static Telainicial + #311, #3967
  static Telainicial + #312, #3967
  static Telainicial + #313, #3967
  static Telainicial + #314, #3967
  static Telainicial + #315, #3967
  static Telainicial + #316, #3967
  static Telainicial + #317, #3967
  static Telainicial + #318, #3967
  static Telainicial + #319, #95

  ;Linha 8
  static Telainicial + #320, #95
  static Telainicial + #321, #3967
  static Telainicial + #322, #3967
  static Telainicial + #323, #3967
  static Telainicial + #324, #3967
  static Telainicial + #325, #3967
  static Telainicial + #326, #3967
  static Telainicial + #327, #3967
  static Telainicial + #328, #124
  static Telainicial + #329, #3967
  static Telainicial + #330, #3967
  static Telainicial + #331, #3967
  static Telainicial + #332, #124
  static Telainicial + #333, #3967
  static Telainicial + #334, #3967
  static Telainicial + #335, #3967
  static Telainicial + #336, #3967
  static Telainicial + #337, #3967
  static Telainicial + #338, #3967
  static Telainicial + #339, #3967
  static Telainicial + #340, #3967
  static Telainicial + #341, #3967
  static Telainicial + #342, #3967
  static Telainicial + #343, #3967
  static Telainicial + #344, #3967
  static Telainicial + #345, #3967
  static Telainicial + #346, #124
  static Telainicial + #347, #3967
  static Telainicial + #348, #3967
  static Telainicial + #349, #3967
  static Telainicial + #350, #124
  static Telainicial + #351, #3967
  static Telainicial + #352, #3967
  static Telainicial + #353, #3967
  static Telainicial + #354, #3967
  static Telainicial + #355, #3967
  static Telainicial + #356, #3967
  static Telainicial + #357, #3967
  static Telainicial + #358, #3967
  static Telainicial + #359, #95

  ;Linha 9
  static Telainicial + #360, #95
  static Telainicial + #361, #3967
  static Telainicial + #362, #3967
  static Telainicial + #363, #3967
  static Telainicial + #364, #95
  static Telainicial + #365, #95
  static Telainicial + #366, #95
  static Telainicial + #367, #95
  static Telainicial + #368, #95
  static Telainicial + #369, #95
  static Telainicial + #370, #95
  static Telainicial + #371, #95
  static Telainicial + #372, #95
  static Telainicial + #373, #95
  static Telainicial + #374, #95
  static Telainicial + #375, #95
  static Telainicial + #376, #95
  static Telainicial + #377, #95
  static Telainicial + #378, #95
  static Telainicial + #379, #95
  static Telainicial + #380, #95
  static Telainicial + #381, #95
  static Telainicial + #382, #95
  static Telainicial + #383, #95
  static Telainicial + #384, #95
  static Telainicial + #385, #95
  static Telainicial + #386, #95
  static Telainicial + #387, #95
  static Telainicial + #388, #95
  static Telainicial + #389, #95
  static Telainicial + #390, #95
  static Telainicial + #391, #95
  static Telainicial + #392, #95
  static Telainicial + #393, #95
  static Telainicial + #394, #95
  static Telainicial + #395, #3967
  static Telainicial + #396, #3967
  static Telainicial + #397, #3967
  static Telainicial + #398, #3967
  static Telainicial + #399, #95

  ;Linha 10
  static Telainicial + #400, #95
  static Telainicial + #401, #3967
  static Telainicial + #402, #3967
  static Telainicial + #403, #3967
  static Telainicial + #404, #3967
  static Telainicial + #405, #3967
  static Telainicial + #406, #3967
  static Telainicial + #407, #3967
  static Telainicial + #408, #3967
  static Telainicial + #409, #3967
  static Telainicial + #410, #3967
  static Telainicial + #411, #3967
  static Telainicial + #412, #3967
  static Telainicial + #413, #3967
  static Telainicial + #414, #3967
  static Telainicial + #415, #3967
  static Telainicial + #416, #3967
  static Telainicial + #417, #3967
  static Telainicial + #418, #3967
  static Telainicial + #419, #3967
  static Telainicial + #420, #3967
  static Telainicial + #421, #3967
  static Telainicial + #422, #3967
  static Telainicial + #423, #3967
  static Telainicial + #424, #3967
  static Telainicial + #425, #3967
  static Telainicial + #426, #3967
  static Telainicial + #427, #3967
  static Telainicial + #428, #3967
  static Telainicial + #429, #3967
  static Telainicial + #430, #3967
  static Telainicial + #431, #3967
  static Telainicial + #432, #3967
  static Telainicial + #433, #3967
  static Telainicial + #434, #3967
  static Telainicial + #435, #3967
  static Telainicial + #436, #3967
  static Telainicial + #437, #3967
  static Telainicial + #438, #3967
  static Telainicial + #439, #95

  ;Linha 11
  static Telainicial + #440, #95
  static Telainicial + #441, #3967
  static Telainicial + #442, #3967
  static Telainicial + #443, #3967
  static Telainicial + #444, #3967
  static Telainicial + #445, #3967
  static Telainicial + #446, #3967
  static Telainicial + #447, #3967
  static Telainicial + #448, #3967
  static Telainicial + #449, #3967
  static Telainicial + #450, #3967
  static Telainicial + #451, #3967
  static Telainicial + #452, #3967
  static Telainicial + #453, #3967
  static Telainicial + #454, #3967
  static Telainicial + #455, #3967
  static Telainicial + #456, #3967
  static Telainicial + #457, #3967
  static Telainicial + #458, #3967
  static Telainicial + #459, #3967
  static Telainicial + #460, #3967
  static Telainicial + #461, #3967
  static Telainicial + #462, #3967
  static Telainicial + #463, #3967
  static Telainicial + #464, #3967
  static Telainicial + #465, #3967
  static Telainicial + #466, #3967
  static Telainicial + #467, #3967
  static Telainicial + #468, #3967
  static Telainicial + #469, #3967
  static Telainicial + #470, #3967
  static Telainicial + #471, #3967
  static Telainicial + #472, #3967
  static Telainicial + #473, #3967
  static Telainicial + #474, #3967
  static Telainicial + #475, #3967
  static Telainicial + #476, #3967
  static Telainicial + #477, #3967
  static Telainicial + #478, #3967
  static Telainicial + #479, #95

  ;Linha 12
  static Telainicial + #480, #95
  static Telainicial + #481, #3967
  static Telainicial + #482, #3967
  static Telainicial + #483, #3967
  static Telainicial + #484, #3967
  static Telainicial + #485, #2374
  static Telainicial + #486, #2377
  static Telainicial + #487, #2386
  static Telainicial + #488, #2373
  static Telainicial + #489, #2370
  static Telainicial + #490, #2383
  static Telainicial + #491, #2393
  static Telainicial + #492, #3967
  static Telainicial + #493, #3967
  static Telainicial + #494, #3967
  static Telainicial + #495, #3967
  static Telainicial + #496, #3967
  static Telainicial + #497, #3967
  static Telainicial + #498, #3622
  static Telainicial + #499, #3967
  static Telainicial + #500, #3967
  static Telainicial + #501, #3967
  static Telainicial + #502, #3967
  static Telainicial + #503, #3967
  static Telainicial + #504, #3967
  static Telainicial + #505, #3159
  static Telainicial + #506, #3137
  static Telainicial + #507, #3156
  static Telainicial + #508, #3141
  static Telainicial + #509, #3154
  static Telainicial + #510, #3143
  static Telainicial + #511, #3145
  static Telainicial + #512, #3154
  static Telainicial + #513, #3148
  static Telainicial + #514, #3967
  static Telainicial + #515, #3967
  static Telainicial + #516, #3967
  static Telainicial + #517, #3967
  static Telainicial + #518, #3967
  static Telainicial + #519, #95

  ;Linha 13
  static Telainicial + #520, #95
  static Telainicial + #521, #3967
  static Telainicial + #522, #3967
  static Telainicial + #523, #3967
  static Telainicial + #524, #3967
  static Telainicial + #525, #3967
  static Telainicial + #526, #3967
  static Telainicial + #527, #3967
  static Telainicial + #528, #3967
  static Telainicial + #529, #3967
  static Telainicial + #530, #3967
  static Telainicial + #531, #3967
  static Telainicial + #532, #3967
  static Telainicial + #533, #3967
  static Telainicial + #534, #3967
  static Telainicial + #535, #3967
  static Telainicial + #536, #3967
  static Telainicial + #537, #3967
  static Telainicial + #538, #3967
  static Telainicial + #539, #3967
  static Telainicial + #540, #3967
  static Telainicial + #541, #3967
  static Telainicial + #542, #3967
  static Telainicial + #543, #3967
  static Telainicial + #544, #3967
  static Telainicial + #545, #3967
  static Telainicial + #546, #3967
  static Telainicial + #547, #3967
  static Telainicial + #548, #3967
  static Telainicial + #549, #3967
  static Telainicial + #550, #3967
  static Telainicial + #551, #3967
  static Telainicial + #552, #3967
  static Telainicial + #553, #3967
  static Telainicial + #554, #3967
  static Telainicial + #555, #3967
  static Telainicial + #556, #3967
  static Telainicial + #557, #3967
  static Telainicial + #558, #3967
  static Telainicial + #559, #95

  ;Linha 14
  static Telainicial + #560, #95
  static Telainicial + #561, #3967
  static Telainicial + #562, #3967
  static Telainicial + #563, #3967
  static Telainicial + #564, #3967
  static Telainicial + #565, #3967
  static Telainicial + #566, #3967
  static Telainicial + #567, #3967
  static Telainicial + #568, #3967
  static Telainicial + #569, #3967
  static Telainicial + #570, #3967
  static Telainicial + #571, #3967
  static Telainicial + #572, #3967
  static Telainicial + #573, #3967
  static Telainicial + #574, #3967
  static Telainicial + #575, #3649
  static Telainicial + #576, #3668
  static Telainicial + #577, #3967
  static Telainicial + #578, #3967
  static Telainicial + #579, #3668
  static Telainicial + #580, #3656
  static Telainicial + #581, #3653
  static Telainicial + #582, #3967
  static Telainicial + #583, #3967
  static Telainicial + #584, #3967
  static Telainicial + #585, #3967
  static Telainicial + #586, #3967
  static Telainicial + #587, #3967
  static Telainicial + #588, #3967
  static Telainicial + #589, #3967
  static Telainicial + #590, #3967
  static Telainicial + #591, #3967
  static Telainicial + #592, #3967
  static Telainicial + #593, #3967
  static Telainicial + #594, #3967
  static Telainicial + #595, #3967
  static Telainicial + #596, #3967
  static Telainicial + #597, #3967
  static Telainicial + #598, #3967
  static Telainicial + #599, #95

  ;Linha 15
  static Telainicial + #600, #95
  static Telainicial + #601, #3967
  static Telainicial + #602, #3967
  static Telainicial + #603, #3967
  static Telainicial + #604, #3967
  static Telainicial + #605, #3967
  static Telainicial + #606, #3967
  static Telainicial + #607, #3967
  static Telainicial + #608, #3967
  static Telainicial + #609, #3967
  static Telainicial + #610, #3967
  static Telainicial + #611, #3967
  static Telainicial + #612, #3967
  static Telainicial + #613, #3967
  static Telainicial + #614, #3967
  static Telainicial + #615, #3967
  static Telainicial + #616, #3967
  static Telainicial + #617, #3967
  static Telainicial + #618, #3967
  static Telainicial + #619, #3967
  static Telainicial + #620, #3967
  static Telainicial + #621, #3967
  static Telainicial + #622, #3967
  static Telainicial + #623, #3967
  static Telainicial + #624, #3967
  static Telainicial + #625, #3967
  static Telainicial + #626, #3967
  static Telainicial + #627, #3967
  static Telainicial + #628, #3967
  static Telainicial + #629, #3967
  static Telainicial + #630, #3967
  static Telainicial + #631, #3967
  static Telainicial + #632, #3967
  static Telainicial + #633, #3967
  static Telainicial + #634, #3967
  static Telainicial + #635, #3967
  static Telainicial + #636, #3967
  static Telainicial + #637, #3967
  static Telainicial + #638, #3967
  static Telainicial + #639, #95

  ;Linha 16
  static Telainicial + #640, #95
  static Telainicial + #641, #3967
  static Telainicial + #642, #3967
  static Telainicial + #643, #3967
  static Telainicial + #644, #3967
  static Telainicial + #645, #3967
  static Telainicial + #646, #3967
  static Telainicial + #647, #3967
  static Telainicial + #648, #3669
  static Telainicial + #649, #3662
  static Telainicial + #650, #3657
  static Telainicial + #651, #3670
  static Telainicial + #652, #3653
  static Telainicial + #653, #3666
  static Telainicial + #654, #3667
  static Telainicial + #655, #3657
  static Telainicial + #656, #3668
  static Telainicial + #657, #3673
  static Telainicial + #658, #3967
  static Telainicial + #659, #3663
  static Telainicial + #660, #3654
  static Telainicial + #661, #3967
  static Telainicial + #662, #3667
  static Telainicial + #663, #3649
  static Telainicial + #664, #3663
  static Telainicial + #665, #3967
  static Telainicial + #666, #3664
  static Telainicial + #667, #3649
  static Telainicial + #668, #3669
  static Telainicial + #669, #3660
  static Telainicial + #670, #3663
  static Telainicial + #671, #3967
  static Telainicial + #672, #3967
  static Telainicial + #673, #3967
  static Telainicial + #674, #3967
  static Telainicial + #675, #3967
  static Telainicial + #676, #3967
  static Telainicial + #677, #3967
  static Telainicial + #678, #3967
  static Telainicial + #679, #95

  ;Linha 17
  static Telainicial + #680, #95
  static Telainicial + #681, #3967
  static Telainicial + #682, #3967
  static Telainicial + #683, #3967
  static Telainicial + #684, #3967
  static Telainicial + #685, #3967
  static Telainicial + #686, #3967
  static Telainicial + #687, #3967
  static Telainicial + #688, #3967
  static Telainicial + #689, #3967
  static Telainicial + #690, #3967
  static Telainicial + #691, #3967
  static Telainicial + #692, #3967
  static Telainicial + #693, #3967
  static Telainicial + #694, #3967
  static Telainicial + #695, #3967
  static Telainicial + #696, #3967
  static Telainicial + #697, #3967
  static Telainicial + #698, #3967
  static Telainicial + #699, #3967
  static Telainicial + #700, #3967
  static Telainicial + #701, #3967
  static Telainicial + #702, #3967
  static Telainicial + #703, #3967
  static Telainicial + #704, #3967
  static Telainicial + #705, #3967
  static Telainicial + #706, #3967
  static Telainicial + #707, #3967
  static Telainicial + #708, #3967
  static Telainicial + #709, #3967
  static Telainicial + #710, #3967
  static Telainicial + #711, #3967
  static Telainicial + #712, #3967
  static Telainicial + #713, #3967
  static Telainicial + #714, #3967
  static Telainicial + #715, #3967
  static Telainicial + #716, #3967
  static Telainicial + #717, #3967
  static Telainicial + #718, #3967
  static Telainicial + #719, #95

  ;Linha 18
  static Telainicial + #720, #95
  static Telainicial + #721, #3967
  static Telainicial + #722, #3967
  static Telainicial + #723, #3967
  static Telainicial + #724, #3967
  static Telainicial + #725, #3967
  static Telainicial + #726, #3967
  static Telainicial + #727, #3967
  static Telainicial + #728, #3967
  static Telainicial + #729, #3967
  static Telainicial + #730, #3967
  static Telainicial + #731, #3967
  static Telainicial + #732, #3967
  static Telainicial + #733, #3967
  static Telainicial + #734, #3967
  static Telainicial + #735, #3967
  static Telainicial + #736, #3967
  static Telainicial + #737, #3967
  static Telainicial + #738, #3967
  static Telainicial + #739, #3967
  static Telainicial + #740, #3967
  static Telainicial + #741, #3967
  static Telainicial + #742, #3967
  static Telainicial + #743, #3967
  static Telainicial + #744, #3967
  static Telainicial + #745, #3967
  static Telainicial + #746, #3967
  static Telainicial + #747, #3967
  static Telainicial + #748, #3967
  static Telainicial + #749, #3967
  static Telainicial + #750, #3967
  static Telainicial + #751, #3967
  static Telainicial + #752, #3967
  static Telainicial + #753, #3967
  static Telainicial + #754, #3967
  static Telainicial + #755, #3967
  static Telainicial + #756, #3967
  static Telainicial + #757, #3967
  static Telainicial + #758, #3967
  static Telainicial + #759, #95

  ;Linha 19
  static Telainicial + #760, #95
  static Telainicial + #761, #3967
  static Telainicial + #762, #3967
  static Telainicial + #763, #3967
  static Telainicial + #764, #3967
  static Telainicial + #765, #3967
  static Telainicial + #766, #3967
  static Telainicial + #767, #3967
  static Telainicial + #768, #3967
  static Telainicial + #769, #3967
  static Telainicial + #770, #3967
  static Telainicial + #771, #3967
  static Telainicial + #772, #3967
  static Telainicial + #773, #3967
  static Telainicial + #774, #3967
  static Telainicial + #775, #3967
  static Telainicial + #776, #3967
  static Telainicial + #777, #3967
  static Telainicial + #778, #3967
  static Telainicial + #779, #3967
  static Telainicial + #780, #3967
  static Telainicial + #781, #3967
  static Telainicial + #782, #3967
  static Telainicial + #783, #3967
  static Telainicial + #784, #3967
  static Telainicial + #785, #3967
  static Telainicial + #786, #3967
  static Telainicial + #787, #3967
  static Telainicial + #788, #3967
  static Telainicial + #789, #3967
  static Telainicial + #790, #3967
  static Telainicial + #791, #3967
  static Telainicial + #792, #3967
  static Telainicial + #793, #3967
  static Telainicial + #794, #3967
  static Telainicial + #795, #3967
  static Telainicial + #796, #3967
  static Telainicial + #797, #3967
  static Telainicial + #798, #3967
  static Telainicial + #799, #95

  ;Linha 20
  static Telainicial + #800, #95
  static Telainicial + #801, #3967
  static Telainicial + #802, #3967
  static Telainicial + #803, #3967
  static Telainicial + #804, #3967
  static Telainicial + #805, #3967
  static Telainicial + #806, #3967
  static Telainicial + #807, #3967
  static Telainicial + #808, #3967
  static Telainicial + #809, #3967
  static Telainicial + #810, #3967
  static Telainicial + #811, #3967
  static Telainicial + #812, #3967
  static Telainicial + #813, #3967
  static Telainicial + #814, #3967
  static Telainicial + #815, #3967
  static Telainicial + #816, #3967
  static Telainicial + #817, #3967
  static Telainicial + #818, #3967
  static Telainicial + #819, #3967
  static Telainicial + #820, #3967
  static Telainicial + #821, #3967
  static Telainicial + #822, #3967
  static Telainicial + #823, #3967
  static Telainicial + #824, #3967
  static Telainicial + #825, #3967
  static Telainicial + #826, #3967
  static Telainicial + #827, #3967
  static Telainicial + #828, #3967
  static Telainicial + #829, #3967
  static Telainicial + #830, #3967
  static Telainicial + #831, #3967
  static Telainicial + #832, #3967
  static Telainicial + #833, #3967
  static Telainicial + #834, #3967
  static Telainicial + #835, #3967
  static Telainicial + #836, #3967
  static Telainicial + #837, #3967
  static Telainicial + #838, #3967
  static Telainicial + #839, #95

  ;Linha 21
  static Telainicial + #840, #95
  static Telainicial + #841, #3967
  static Telainicial + #842, #3967
  static Telainicial + #843, #3967
  static Telainicial + #844, #3967
  static Telainicial + #845, #3967
  static Telainicial + #846, #3967
  static Telainicial + #847, #3967
  static Telainicial + #848, #3967
  static Telainicial + #849, #3967
  static Telainicial + #850, #3967
  static Telainicial + #851, #3967
  static Telainicial + #852, #3967
  static Telainicial + #853, #3967
  static Telainicial + #854, #3967
  static Telainicial + #855, #3967
  static Telainicial + #856, #3967
  static Telainicial + #857, #3967
  static Telainicial + #858, #3967
  static Telainicial + #859, #3967
  static Telainicial + #860, #3967
  static Telainicial + #861, #3967
  static Telainicial + #862, #3967
  static Telainicial + #863, #3967
  static Telainicial + #864, #3967
  static Telainicial + #865, #3967
  static Telainicial + #866, #3967
  static Telainicial + #867, #3967
  static Telainicial + #868, #3967
  static Telainicial + #869, #3967
  static Telainicial + #870, #3967
  static Telainicial + #871, #3967
  static Telainicial + #872, #3967
  static Telainicial + #873, #3967
  static Telainicial + #874, #3967
  static Telainicial + #875, #3967
  static Telainicial + #876, #3967
  static Telainicial + #877, #3967
  static Telainicial + #878, #3967
  static Telainicial + #879, #95

  ;Linha 22
  static Telainicial + #880, #95
  static Telainicial + #881, #3967
  static Telainicial + #882, #3967
  static Telainicial + #883, #3967
  static Telainicial + #884, #3967
  static Telainicial + #885, #3967
  static Telainicial + #886, #3967
  static Telainicial + #887, #3967
  static Telainicial + #888, #3967
  static Telainicial + #889, #3967
  static Telainicial + #890, #3967
  static Telainicial + #891, #3967
  static Telainicial + #892, #3967
  static Telainicial + #893, #3967
  static Telainicial + #894, #3967
  static Telainicial + #895, #3967
  static Telainicial + #896, #3967
  static Telainicial + #897, #3967
  static Telainicial + #898, #3967
  static Telainicial + #899, #3967
  static Telainicial + #900, #3967
  static Telainicial + #901, #3967
  static Telainicial + #902, #3967
  static Telainicial + #903, #3967
  static Telainicial + #904, #3967
  static Telainicial + #905, #3967
  static Telainicial + #906, #3967
  static Telainicial + #907, #3967
  static Telainicial + #908, #3967
  static Telainicial + #909, #3967
  static Telainicial + #910, #3967
  static Telainicial + #911, #3967
  static Telainicial + #912, #3967
  static Telainicial + #913, #3967
  static Telainicial + #914, #3967
  static Telainicial + #915, #3967
  static Telainicial + #916, #3967
  static Telainicial + #917, #3967
  static Telainicial + #918, #3967
  static Telainicial + #919, #95

  ;Linha 23
  static Telainicial + #920, #95
  static Telainicial + #921, #3967
  static Telainicial + #922, #3967
  static Telainicial + #923, #3967
  static Telainicial + #924, #3967
  static Telainicial + #925, #3967
  static Telainicial + #926, #3967
  static Telainicial + #927, #3967
  static Telainicial + #928, #3967
  static Telainicial + #929, #3967
  static Telainicial + #930, #3967
  static Telainicial + #931, #3967
  static Telainicial + #932, #3967
  static Telainicial + #933, #3967
  static Telainicial + #934, #3967
  static Telainicial + #935, #3967
  static Telainicial + #936, #3967
  static Telainicial + #937, #3967
  static Telainicial + #938, #3967
  static Telainicial + #939, #3967
  static Telainicial + #940, #3967
  static Telainicial + #941, #3967
  static Telainicial + #942, #3967
  static Telainicial + #943, #3967
  static Telainicial + #944, #3967
  static Telainicial + #945, #3967
  static Telainicial + #946, #3967
  static Telainicial + #947, #3967
  static Telainicial + #948, #3967
  static Telainicial + #949, #3967
  static Telainicial + #950, #3967
  static Telainicial + #951, #3967
  static Telainicial + #952, #3967
  static Telainicial + #953, #3967
  static Telainicial + #954, #3967
  static Telainicial + #955, #3967
  static Telainicial + #956, #3967
  static Telainicial + #957, #3967
  static Telainicial + #958, #3967
  static Telainicial + #959, #95

  ;Linha 24
  static Telainicial + #960, #95
  static Telainicial + #961, #3967
  static Telainicial + #962, #3967
  static Telainicial + #963, #3967
  static Telainicial + #964, #3967
  static Telainicial + #965, #2113
  static Telainicial + #966, #2128
  static Telainicial + #967, #2117
  static Telainicial + #968, #2130
  static Telainicial + #969, #2132
  static Telainicial + #970, #2117
  static Telainicial + #971, #3967
  static Telainicial + #972, #2082
  static Telainicial + #973, #2629
  static Telainicial + #974, #2082
  static Telainicial + #975, #3967
  static Telainicial + #976, #2128
  static Telainicial + #977, #2113
  static Telainicial + #978, #2130
  static Telainicial + #979, #2113
  static Telainicial + #980, #3967
  static Telainicial + #981, #2121
  static Telainicial + #982, #2126
  static Telainicial + #983, #2121
  static Telainicial + #984, #2115
  static Telainicial + #985, #2121
  static Telainicial + #986, #2113
  static Telainicial + #987, #2130
  static Telainicial + #988, #3967
  static Telainicial + #989, #3967
  static Telainicial + #990, #3967
  static Telainicial + #991, #3967
  static Telainicial + #992, #3967
  static Telainicial + #993, #3967
  static Telainicial + #994, #3967
  static Telainicial + #995, #3967
  static Telainicial + #996, #3967
  static Telainicial + #997, #3967
  static Telainicial + #998, #3967
  static Telainicial + #999, #95

  ;Linha 25
  static Telainicial + #1000, #95
  static Telainicial + #1001, #3967
  static Telainicial + #1002, #3967
  static Telainicial + #1003, #3967
  static Telainicial + #1004, #3967
  static Telainicial + #1005, #3967
  static Telainicial + #1006, #3967
  static Telainicial + #1007, #3967
  static Telainicial + #1008, #3967
  static Telainicial + #1009, #3967
  static Telainicial + #1010, #3967
  static Telainicial + #1011, #3967
  static Telainicial + #1012, #3967
  static Telainicial + #1013, #3967
  static Telainicial + #1014, #3967
  static Telainicial + #1015, #3967
  static Telainicial + #1016, #3967
  static Telainicial + #1017, #3967
  static Telainicial + #1018, #3967
  static Telainicial + #1019, #3967
  static Telainicial + #1020, #3967
  static Telainicial + #1021, #3967
  static Telainicial + #1022, #3967
  static Telainicial + #1023, #3967
  static Telainicial + #1024, #3967
  static Telainicial + #1025, #3967
  static Telainicial + #1026, #3967
  static Telainicial + #1027, #3967
  static Telainicial + #1028, #3967
  static Telainicial + #1029, #3967
  static Telainicial + #1030, #3967
  static Telainicial + #1031, #3967
  static Telainicial + #1032, #3967
  static Telainicial + #1033, #3967
  static Telainicial + #1034, #3967
  static Telainicial + #1035, #3967
  static Telainicial + #1036, #3967
  static Telainicial + #1037, #3967
  static Telainicial + #1038, #3967
  static Telainicial + #1039, #95

  ;Linha 26
  static Telainicial + #1040, #95
  static Telainicial + #1041, #3967
  static Telainicial + #1042, #3967
  static Telainicial + #1043, #3967
  static Telainicial + #1044, #3967
  static Telainicial + #1045, #3967
  static Telainicial + #1046, #3967
  static Telainicial + #1047, #3967
  static Telainicial + #1048, #3967
  static Telainicial + #1049, #3967
  static Telainicial + #1050, #3967
  static Telainicial + #1051, #3967
  static Telainicial + #1052, #3967
  static Telainicial + #1053, #3967
  static Telainicial + #1054, #3967
  static Telainicial + #1055, #3967
  static Telainicial + #1056, #3134
  static Telainicial + #1057, #2126
  static Telainicial + #1058, #2127
  static Telainicial + #1059, #3967
  static Telainicial + #1060, #2125
  static Telainicial + #1061, #2117
  static Telainicial + #1062, #2126
  static Telainicial + #1063, #2133
  static Telainicial + #1064, #3967
  static Telainicial + #1065, #3967
  static Telainicial + #1066, #3967
  static Telainicial + #1067, #3967
  static Telainicial + #1068, #3967
  static Telainicial + #1069, #3967
  static Telainicial + #1070, #3967
  static Telainicial + #1071, #3967
  static Telainicial + #1072, #3967
  static Telainicial + #1073, #3967
  static Telainicial + #1074, #3967
  static Telainicial + #1075, #3967
  static Telainicial + #1076, #3967
  static Telainicial + #1077, #3967
  static Telainicial + #1078, #3967
  static Telainicial + #1079, #95

  ;Linha 27
  static Telainicial + #1080, #95
  static Telainicial + #1081, #3967
  static Telainicial + #1082, #3967
  static Telainicial + #1083, #3967
  static Telainicial + #1084, #3967
  static Telainicial + #1085, #3967
  static Telainicial + #1086, #3967
  static Telainicial + #1087, #3967
  static Telainicial + #1088, #3967
  static Telainicial + #1089, #3967
  static Telainicial + #1090, #3967
  static Telainicial + #1091, #3967
  static Telainicial + #1092, #3967
  static Telainicial + #1093, #3967
  static Telainicial + #1094, #3967
  static Telainicial + #1095, #3967
  static Telainicial + #1096, #3967
  static Telainicial + #1097, #3967
  static Telainicial + #1098, #3967
  static Telainicial + #1099, #3967
  static Telainicial + #1100, #3967
  static Telainicial + #1101, #3967
  static Telainicial + #1102, #3967
  static Telainicial + #1103, #3967
  static Telainicial + #1104, #3967
  static Telainicial + #1105, #3967
  static Telainicial + #1106, #3967
  static Telainicial + #1107, #3967
  static Telainicial + #1108, #3967
  static Telainicial + #1109, #3967
  static Telainicial + #1110, #3967
  static Telainicial + #1111, #3967
  static Telainicial + #1112, #3967
  static Telainicial + #1113, #3967
  static Telainicial + #1114, #3967
  static Telainicial + #1115, #3967
  static Telainicial + #1116, #3967
  static Telainicial + #1117, #3967
  static Telainicial + #1118, #3967
  static Telainicial + #1119, #95

  ;Linha 28
  static Telainicial + #1120, #95
  static Telainicial + #1121, #95
  static Telainicial + #1122, #3967
  static Telainicial + #1123, #3967
  static Telainicial + #1124, #3967
  static Telainicial + #1125, #3967
  static Telainicial + #1126, #3967
  static Telainicial + #1127, #3967
  static Telainicial + #1128, #3967
  static Telainicial + #1129, #3967
  static Telainicial + #1130, #3967
  static Telainicial + #1131, #3967
  static Telainicial + #1132, #3967
  static Telainicial + #1133, #3967
  static Telainicial + #1134, #3967
  static Telainicial + #1135, #3967
  static Telainicial + #1136, #3967
  static Telainicial + #1137, #3967
  static Telainicial + #1138, #3967
  static Telainicial + #1139, #3967
  static Telainicial + #1140, #3967
  static Telainicial + #1141, #3967
  static Telainicial + #1142, #3967
  static Telainicial + #1143, #3967
  static Telainicial + #1144, #3967
  static Telainicial + #1145, #3967
  static Telainicial + #1146, #3967
  static Telainicial + #1147, #3967
  static Telainicial + #1148, #3967
  static Telainicial + #1149, #3967
  static Telainicial + #1150, #3967
  static Telainicial + #1151, #3967
  static Telainicial + #1152, #3967
  static Telainicial + #1153, #3967
  static Telainicial + #1154, #3967
  static Telainicial + #1155, #3967
  static Telainicial + #1156, #3967
  static Telainicial + #1157, #3967
  static Telainicial + #1158, #95
  static Telainicial + #1159, #95

  ;Linha 29
  static Telainicial + #1160, #95
  static Telainicial + #1161, #95
  static Telainicial + #1162, #95
  static Telainicial + #1163, #95
  static Telainicial + #1164, #95
  static Telainicial + #1165, #95
  static Telainicial + #1166, #95
  static Telainicial + #1167, #95
  static Telainicial + #1168, #95
  static Telainicial + #1169, #95
  static Telainicial + #1170, #95
  static Telainicial + #1171, #95
  static Telainicial + #1172, #95
  static Telainicial + #1173, #95
  static Telainicial + #1174, #95
  static Telainicial + #1175, #95
  static Telainicial + #1176, #95
  static Telainicial + #1177, #95
  static Telainicial + #1178, #95
  static Telainicial + #1179, #95
  static Telainicial + #1180, #95
  static Telainicial + #1181, #95
  static Telainicial + #1182, #95
  static Telainicial + #1183, #95
  static Telainicial + #1184, #95
  static Telainicial + #1185, #95
  static Telainicial + #1186, #95
  static Telainicial + #1187, #95
  static Telainicial + #1188, #95
  static Telainicial + #1189, #95
  static Telainicial + #1190, #95
  static Telainicial + #1191, #95
  static Telainicial + #1192, #95
  static Telainicial + #1193, #95
  static Telainicial + #1194, #95
  static Telainicial + #1195, #95
  static Telainicial + #1196, #95
  static Telainicial + #1197, #95
  static Telainicial + #1198, #95
  static Telainicial + #1199, #95


Telainstrucao : var #1200
  ;Linha 0
  static Telainstrucao + #0, #95
  static Telainstrucao + #1, #95
  static Telainstrucao + #2, #95
  static Telainstrucao + #3, #95
  static Telainstrucao + #4, #95
  static Telainstrucao + #5, #95
  static Telainstrucao + #6, #95
  static Telainstrucao + #7, #95
  static Telainstrucao + #8, #95
  static Telainstrucao + #9, #95
  static Telainstrucao + #10, #95
  static Telainstrucao + #11, #95
  static Telainstrucao + #12, #95
  static Telainstrucao + #13, #95
  static Telainstrucao + #14, #95
  static Telainstrucao + #15, #95
  static Telainstrucao + #16, #95
  static Telainstrucao + #17, #95
  static Telainstrucao + #18, #95
  static Telainstrucao + #19, #95
  static Telainstrucao + #20, #95
  static Telainstrucao + #21, #95
  static Telainstrucao + #22, #95
  static Telainstrucao + #23, #95
  static Telainstrucao + #24, #95
  static Telainstrucao + #25, #95
  static Telainstrucao + #26, #95
  static Telainstrucao + #27, #95
  static Telainstrucao + #28, #95
  static Telainstrucao + #29, #95
  static Telainstrucao + #30, #95
  static Telainstrucao + #31, #95
  static Telainstrucao + #32, #95
  static Telainstrucao + #33, #95
  static Telainstrucao + #34, #95
  static Telainstrucao + #35, #95
  static Telainstrucao + #36, #95
  static Telainstrucao + #37, #95
  static Telainstrucao + #38, #95
  static Telainstrucao + #39, #95

  ;Linha 1
  static Telainstrucao + #40, #95
  static Telainstrucao + #41, #95
  static Telainstrucao + #42, #3967
  static Telainstrucao + #43, #3967
  static Telainstrucao + #44, #3967
  static Telainstrucao + #45, #3967
  static Telainstrucao + #46, #3967
  static Telainstrucao + #47, #3967
  static Telainstrucao + #48, #3967
  static Telainstrucao + #49, #3967
  static Telainstrucao + #50, #3967
  static Telainstrucao + #51, #3967
  static Telainstrucao + #52, #3967
  static Telainstrucao + #53, #3967
  static Telainstrucao + #54, #3967
  static Telainstrucao + #55, #3967
  static Telainstrucao + #56, #3967
  static Telainstrucao + #57, #3967
  static Telainstrucao + #58, #3967
  static Telainstrucao + #59, #3967
  static Telainstrucao + #60, #3967
  static Telainstrucao + #61, #3967
  static Telainstrucao + #62, #3967
  static Telainstrucao + #63, #3967
  static Telainstrucao + #64, #3967
  static Telainstrucao + #65, #3967
  static Telainstrucao + #66, #3967
  static Telainstrucao + #67, #3967
  static Telainstrucao + #68, #3967
  static Telainstrucao + #69, #3967
  static Telainstrucao + #70, #3967
  static Telainstrucao + #71, #3967
  static Telainstrucao + #72, #3967
  static Telainstrucao + #73, #3967
  static Telainstrucao + #74, #3967
  static Telainstrucao + #75, #3967
  static Telainstrucao + #76, #3967
  static Telainstrucao + #77, #3967
  static Telainstrucao + #78, #95
  static Telainstrucao + #79, #95

  ;Linha 2
  static Telainstrucao + #80, #95
  static Telainstrucao + #81, #3967
  static Telainstrucao + #82, #3967
  static Telainstrucao + #83, #3967
  static Telainstrucao + #84, #3967
  static Telainstrucao + #85, #3967
  static Telainstrucao + #86, #3967
  static Telainstrucao + #87, #3967
  static Telainstrucao + #88, #3967
  static Telainstrucao + #89, #3967
  static Telainstrucao + #90, #3967
  static Telainstrucao + #91, #3967
  static Telainstrucao + #92, #3967
  static Telainstrucao + #93, #3967
  static Telainstrucao + #94, #3967
  static Telainstrucao + #95, #3967
  static Telainstrucao + #96, #3967
  static Telainstrucao + #97, #3967
  static Telainstrucao + #98, #3967
  static Telainstrucao + #99, #3967
  static Telainstrucao + #100, #3967
  static Telainstrucao + #101, #3967
  static Telainstrucao + #102, #3967
  static Telainstrucao + #103, #3967
  static Telainstrucao + #104, #3967
  static Telainstrucao + #105, #3967
  static Telainstrucao + #106, #3967
  static Telainstrucao + #107, #3967
  static Telainstrucao + #108, #3967
  static Telainstrucao + #109, #3967
  static Telainstrucao + #110, #3967
  static Telainstrucao + #111, #3967
  static Telainstrucao + #112, #3967
  static Telainstrucao + #113, #3967
  static Telainstrucao + #114, #3967
  static Telainstrucao + #115, #3967
  static Telainstrucao + #116, #3967
  static Telainstrucao + #117, #3967
  static Telainstrucao + #118, #3967
  static Telainstrucao + #119, #95

  ;Linha 3
  static Telainstrucao + #120, #95
  static Telainstrucao + #121, #3967
  static Telainstrucao + #122, #3967
  static Telainstrucao + #123, #3967
  static Telainstrucao + #124, #3967
  static Telainstrucao + #125, #3967
  static Telainstrucao + #126, #3967
  static Telainstrucao + #127, #3967
  static Telainstrucao + #128, #3967
  static Telainstrucao + #129, #3967
  static Telainstrucao + #130, #3967
  static Telainstrucao + #131, #3967
  static Telainstrucao + #132, #3967
  static Telainstrucao + #133, #3967
  static Telainstrucao + #134, #3967
  static Telainstrucao + #135, #3967
  static Telainstrucao + #136, #3967
  static Telainstrucao + #137, #3967
  static Telainstrucao + #138, #3967
  static Telainstrucao + #139, #3967
  static Telainstrucao + #140, #3967
  static Telainstrucao + #141, #3967
  static Telainstrucao + #142, #3967
  static Telainstrucao + #143, #3967
  static Telainstrucao + #144, #3967
  static Telainstrucao + #145, #3967
  static Telainstrucao + #146, #3967
  static Telainstrucao + #147, #3967
  static Telainstrucao + #148, #3967
  static Telainstrucao + #149, #3967
  static Telainstrucao + #150, #3967
  static Telainstrucao + #151, #3967
  static Telainstrucao + #152, #3967
  static Telainstrucao + #153, #3967
  static Telainstrucao + #154, #3967
  static Telainstrucao + #155, #3967
  static Telainstrucao + #156, #3967
  static Telainstrucao + #157, #3967
  static Telainstrucao + #158, #3967
  static Telainstrucao + #159, #95

  ;Linha 4
  static Telainstrucao + #160, #95
  static Telainstrucao + #161, #3967
  static Telainstrucao + #162, #3967
  static Telainstrucao + #163, #3967
  static Telainstrucao + #164, #3967
  static Telainstrucao + #165, #3967
  static Telainstrucao + #166, #3967
  static Telainstrucao + #167, #3967
  static Telainstrucao + #168, #3967
  static Telainstrucao + #169, #3967
  static Telainstrucao + #170, #3967
  static Telainstrucao + #171, #3967
  static Telainstrucao + #172, #3967
  static Telainstrucao + #173, #3967
  static Telainstrucao + #174, #3967
  static Telainstrucao + #175, #3967
  static Telainstrucao + #176, #3967
  static Telainstrucao + #177, #3967
  static Telainstrucao + #178, #3967
  static Telainstrucao + #179, #3967
  static Telainstrucao + #180, #3967
  static Telainstrucao + #181, #3967
  static Telainstrucao + #182, #3967
  static Telainstrucao + #183, #3967
  static Telainstrucao + #184, #3967
  static Telainstrucao + #185, #3967
  static Telainstrucao + #186, #3967
  static Telainstrucao + #187, #3967
  static Telainstrucao + #188, #3967
  static Telainstrucao + #189, #3967
  static Telainstrucao + #190, #3967
  static Telainstrucao + #191, #3967
  static Telainstrucao + #192, #3967
  static Telainstrucao + #193, #3967
  static Telainstrucao + #194, #3967
  static Telainstrucao + #195, #3967
  static Telainstrucao + #196, #3967
  static Telainstrucao + #197, #3967
  static Telainstrucao + #198, #3967
  static Telainstrucao + #199, #95

  ;Linha 5
  static Telainstrucao + #200, #95
  static Telainstrucao + #201, #3967
  static Telainstrucao + #202, #3967
  static Telainstrucao + #203, #3967
  static Telainstrucao + #204, #3967
  static Telainstrucao + #205, #3967
  static Telainstrucao + #206, #3967
  static Telainstrucao + #207, #3967
  static Telainstrucao + #208, #3967
  static Telainstrucao + #209, #3967
  static Telainstrucao + #210, #3967
  static Telainstrucao + #211, #3967
  static Telainstrucao + #212, #3967
  static Telainstrucao + #213, #3967
  static Telainstrucao + #214, #3967
  static Telainstrucao + #215, #3967
  static Telainstrucao + #216, #3967
  static Telainstrucao + #217, #3967
  static Telainstrucao + #218, #3967
  static Telainstrucao + #219, #3967
  static Telainstrucao + #220, #3967
  static Telainstrucao + #221, #3967
  static Telainstrucao + #222, #3967
  static Telainstrucao + #223, #3967
  static Telainstrucao + #224, #3967
  static Telainstrucao + #225, #3967
  static Telainstrucao + #226, #3967
  static Telainstrucao + #227, #3967
  static Telainstrucao + #228, #3967
  static Telainstrucao + #229, #3967
  static Telainstrucao + #230, #3967
  static Telainstrucao + #231, #3967
  static Telainstrucao + #232, #3967
  static Telainstrucao + #233, #3967
  static Telainstrucao + #234, #3967
  static Telainstrucao + #235, #3967
  static Telainstrucao + #236, #3967
  static Telainstrucao + #237, #3967
  static Telainstrucao + #238, #3967
  static Telainstrucao + #239, #95

  ;Linha 6
  static Telainstrucao + #240, #95
  static Telainstrucao + #241, #3967
  static Telainstrucao + #242, #3967
  static Telainstrucao + #243, #3967
  static Telainstrucao + #244, #3967
  static Telainstrucao + #245, #3967
  static Telainstrucao + #246, #3967
  static Telainstrucao + #247, #3967
  static Telainstrucao + #248, #3967
  static Telainstrucao + #249, #3967
  static Telainstrucao + #250, #3967
  static Telainstrucao + #251, #3967
  static Telainstrucao + #252, #3967
  static Telainstrucao + #253, #3967
  static Telainstrucao + #254, #3967
  static Telainstrucao + #255, #3967
  static Telainstrucao + #256, #3967
  static Telainstrucao + #257, #3967
  static Telainstrucao + #258, #3967
  static Telainstrucao + #259, #3967
  static Telainstrucao + #260, #3967
  static Telainstrucao + #261, #3967
  static Telainstrucao + #262, #3967
  static Telainstrucao + #263, #3967
  static Telainstrucao + #264, #3967
  static Telainstrucao + #265, #3967
  static Telainstrucao + #266, #3967
  static Telainstrucao + #267, #3967
  static Telainstrucao + #268, #3967
  static Telainstrucao + #269, #3967
  static Telainstrucao + #270, #3967
  static Telainstrucao + #271, #3967
  static Telainstrucao + #272, #3967
  static Telainstrucao + #273, #3967
  static Telainstrucao + #274, #3967
  static Telainstrucao + #275, #3967
  static Telainstrucao + #276, #3967
  static Telainstrucao + #277, #3967
  static Telainstrucao + #278, #3967
  static Telainstrucao + #279, #95

  ;Linha 7
  static Telainstrucao + #280, #95
  static Telainstrucao + #281, #3967
  static Telainstrucao + #282, #3967
  static Telainstrucao + #283, #3967
  static Telainstrucao + #284, #3967
  static Telainstrucao + #285, #3967
  static Telainstrucao + #286, #3967
  static Telainstrucao + #287, #3967
  static Telainstrucao + #288, #3967
  static Telainstrucao + #289, #3967
  static Telainstrucao + #290, #3967
  static Telainstrucao + #291, #3967
  static Telainstrucao + #292, #3967
  static Telainstrucao + #293, #3967
  static Telainstrucao + #294, #3967
  static Telainstrucao + #295, #3967
  static Telainstrucao + #296, #3967
  static Telainstrucao + #297, #3967
  static Telainstrucao + #298, #3967
  static Telainstrucao + #299, #3967
  static Telainstrucao + #300, #3967
  static Telainstrucao + #301, #3967
  static Telainstrucao + #302, #3967
  static Telainstrucao + #303, #3967
  static Telainstrucao + #304, #3967
  static Telainstrucao + #305, #3967
  static Telainstrucao + #306, #3967
  static Telainstrucao + #307, #3967
  static Telainstrucao + #308, #3967
  static Telainstrucao + #309, #3967
  static Telainstrucao + #310, #3967
  static Telainstrucao + #311, #3967
  static Telainstrucao + #312, #3967
  static Telainstrucao + #313, #3967
  static Telainstrucao + #314, #3967
  static Telainstrucao + #315, #3967
  static Telainstrucao + #316, #3967
  static Telainstrucao + #317, #3967
  static Telainstrucao + #318, #3967
  static Telainstrucao + #319, #95

  ;Linha 8
  static Telainstrucao + #320, #95
  static Telainstrucao + #321, #3967
  static Telainstrucao + #322, #3967
  static Telainstrucao + #323, #3967
  static Telainstrucao + #324, #3967
  static Telainstrucao + #325, #3967
  static Telainstrucao + #326, #3967
  static Telainstrucao + #327, #3967
  static Telainstrucao + #328, #3967
  static Telainstrucao + #329, #3967
  static Telainstrucao + #330, #3967
  static Telainstrucao + #331, #3967
  static Telainstrucao + #332, #3967
  static Telainstrucao + #333, #3967
  static Telainstrucao + #334, #3967
  static Telainstrucao + #335, #3967
  static Telainstrucao + #336, #3967
  static Telainstrucao + #337, #3967
  static Telainstrucao + #338, #3967
  static Telainstrucao + #339, #3967
  static Telainstrucao + #340, #3967
  static Telainstrucao + #341, #3967
  static Telainstrucao + #342, #3967
  static Telainstrucao + #343, #3967
  static Telainstrucao + #344, #3967
  static Telainstrucao + #345, #3967
  static Telainstrucao + #346, #3967
  static Telainstrucao + #347, #3967
  static Telainstrucao + #348, #3967
  static Telainstrucao + #349, #3967
  static Telainstrucao + #350, #3967
  static Telainstrucao + #351, #3967
  static Telainstrucao + #352, #3967
  static Telainstrucao + #353, #3967
  static Telainstrucao + #354, #3967
  static Telainstrucao + #355, #3967
  static Telainstrucao + #356, #3967
  static Telainstrucao + #357, #3967
  static Telainstrucao + #358, #3967
  static Telainstrucao + #359, #95

  ;Linha 9
  static Telainstrucao + #360, #95
  static Telainstrucao + #361, #3967
  static Telainstrucao + #362, #3967
  static Telainstrucao + #363, #3967
  static Telainstrucao + #364, #3967
  static Telainstrucao + #365, #3967
  static Telainstrucao + #366, #3967
  static Telainstrucao + #367, #3967
  static Telainstrucao + #368, #3967
  static Telainstrucao + #369, #3967
  static Telainstrucao + #370, #3967
  static Telainstrucao + #371, #3967
  static Telainstrucao + #372, #3967
  static Telainstrucao + #373, #3967
  static Telainstrucao + #374, #3967
  static Telainstrucao + #375, #3967
  static Telainstrucao + #376, #3967
  static Telainstrucao + #377, #3967
  static Telainstrucao + #378, #3967
  static Telainstrucao + #379, #3967
  static Telainstrucao + #380, #3967
  static Telainstrucao + #381, #3967
  static Telainstrucao + #382, #3967
  static Telainstrucao + #383, #3967
  static Telainstrucao + #384, #3967
  static Telainstrucao + #385, #3967
  static Telainstrucao + #386, #3967
  static Telainstrucao + #387, #3967
  static Telainstrucao + #388, #3967
  static Telainstrucao + #389, #3967
  static Telainstrucao + #390, #3967
  static Telainstrucao + #391, #3967
  static Telainstrucao + #392, #3967
  static Telainstrucao + #393, #3967
  static Telainstrucao + #394, #3967
  static Telainstrucao + #395, #3967
  static Telainstrucao + #396, #3967
  static Telainstrucao + #397, #3967
  static Telainstrucao + #398, #3967
  static Telainstrucao + #399, #95

  ;Linha 10
  static Telainstrucao + #400, #95
  static Telainstrucao + #401, #3967
  static Telainstrucao + #402, #3967
  static Telainstrucao + #403, #3967
  static Telainstrucao + #404, #3967
  static Telainstrucao + #405, #3967
  static Telainstrucao + #406, #70
  static Telainstrucao + #407, #73
  static Telainstrucao + #408, #82
  static Telainstrucao + #409, #69
  static Telainstrucao + #410, #66
  static Telainstrucao + #411, #79
  static Telainstrucao + #412, #89
  static Telainstrucao + #413, #3967
  static Telainstrucao + #414, #3967
  static Telainstrucao + #415, #3967
  static Telainstrucao + #416, #3967
  static Telainstrucao + #417, #3967
  static Telainstrucao + #418, #3967
  static Telainstrucao + #419, #3967
  static Telainstrucao + #420, #3967
  static Telainstrucao + #421, #3967
  static Telainstrucao + #422, #3967
  static Telainstrucao + #423, #3967
  static Telainstrucao + #424, #3967
  static Telainstrucao + #425, #87
  static Telainstrucao + #426, #65
  static Telainstrucao + #427, #84
  static Telainstrucao + #428, #69
  static Telainstrucao + #429, #82
  static Telainstrucao + #430, #71
  static Telainstrucao + #431, #73
  static Telainstrucao + #432, #82
  static Telainstrucao + #433, #76
  static Telainstrucao + #434, #3967
  static Telainstrucao + #435, #3967
  static Telainstrucao + #436, #3967
  static Telainstrucao + #437, #3967
  static Telainstrucao + #438, #3967
  static Telainstrucao + #439, #95

  ;Linha 11
  static Telainstrucao + #440, #95
  static Telainstrucao + #441, #3967
  static Telainstrucao + #442, #3967
  static Telainstrucao + #443, #3967
  static Telainstrucao + #444, #3967
  static Telainstrucao + #445, #3967
  static Telainstrucao + #446, #3967
  static Telainstrucao + #447, #3967
  static Telainstrucao + #448, #3967
  static Telainstrucao + #449, #3967
  static Telainstrucao + #450, #3967
  static Telainstrucao + #451, #3967
  static Telainstrucao + #452, #3967
  static Telainstrucao + #453, #3967
  static Telainstrucao + #454, #3967
  static Telainstrucao + #455, #3967
  static Telainstrucao + #456, #3967
  static Telainstrucao + #457, #3967
  static Telainstrucao + #458, #3967
  static Telainstrucao + #459, #3967
  static Telainstrucao + #460, #3967
  static Telainstrucao + #461, #3967
  static Telainstrucao + #462, #3967
  static Telainstrucao + #463, #3967
  static Telainstrucao + #464, #3967
  static Telainstrucao + #465, #3967
  static Telainstrucao + #466, #3967
  static Telainstrucao + #467, #3967
  static Telainstrucao + #468, #3967
  static Telainstrucao + #469, #3967
  static Telainstrucao + #470, #3967
  static Telainstrucao + #471, #3967
  static Telainstrucao + #472, #3967
  static Telainstrucao + #473, #3967
  static Telainstrucao + #474, #3967
  static Telainstrucao + #475, #3967
  static Telainstrucao + #476, #3967
  static Telainstrucao + #477, #3967
  static Telainstrucao + #478, #3967
  static Telainstrucao + #479, #95

  ;Linha 12
  static Telainstrucao + #480, #95
  static Telainstrucao + #481, #3967
  static Telainstrucao + #482, #68
  static Telainstrucao + #483, #73
  static Telainstrucao + #484, #82
  static Telainstrucao + #485, #69
  static Telainstrucao + #486, #73
  static Telainstrucao + #487, #84
  static Telainstrucao + #488, #65
  static Telainstrucao + #489, #58
  static Telainstrucao + #490, #3967
  static Telainstrucao + #491, #3967
  static Telainstrucao + #492, #3967
  static Telainstrucao + #493, #3967
  static Telainstrucao + #494, #574
  static Telainstrucao + #495, #3967
  static Telainstrucao + #496, #3967
  static Telainstrucao + #497, #3967
  static Telainstrucao + #498, #3967
  static Telainstrucao + #499, #3967
  static Telainstrucao + #500, #3967
  static Telainstrucao + #501, #3967
  static Telainstrucao + #502, #68
  static Telainstrucao + #503, #73
  static Telainstrucao + #504, #82
  static Telainstrucao + #505, #69
  static Telainstrucao + #506, #73
  static Telainstrucao + #507, #84
  static Telainstrucao + #508, #65
  static Telainstrucao + #509, #58
  static Telainstrucao + #510, #3967
  static Telainstrucao + #511, #3967
  static Telainstrucao + #512, #3967
  static Telainstrucao + #513, #3967
  static Telainstrucao + #514, #580
  static Telainstrucao + #515, #3967
  static Telainstrucao + #516, #3967
  static Telainstrucao + #517, #3967
  static Telainstrucao + #518, #3967
  static Telainstrucao + #519, #95

  ;Linha 13
  static Telainstrucao + #520, #95
  static Telainstrucao + #521, #3967
  static Telainstrucao + #522, #69
  static Telainstrucao + #523, #83
  static Telainstrucao + #524, #81
  static Telainstrucao + #525, #85
  static Telainstrucao + #526, #69
  static Telainstrucao + #527, #82
  static Telainstrucao + #528, #68
  static Telainstrucao + #529, #65
  static Telainstrucao + #530, #58
  static Telainstrucao + #531, #3967
  static Telainstrucao + #532, #3967
  static Telainstrucao + #533, #3967
  static Telainstrucao + #534, #572
  static Telainstrucao + #535, #3967
  static Telainstrucao + #536, #3967
  static Telainstrucao + #537, #3967
  static Telainstrucao + #538, #3967
  static Telainstrucao + #539, #3967
  static Telainstrucao + #540, #3967
  static Telainstrucao + #541, #3967
  static Telainstrucao + #542, #69
  static Telainstrucao + #543, #83
  static Telainstrucao + #544, #81
  static Telainstrucao + #545, #85
  static Telainstrucao + #546, #69
  static Telainstrucao + #547, #82
  static Telainstrucao + #548, #68
  static Telainstrucao + #549, #65
  static Telainstrucao + #550, #58
  static Telainstrucao + #551, #3967
  static Telainstrucao + #552, #3967
  static Telainstrucao + #553, #3967
  static Telainstrucao + #554, #577
  static Telainstrucao + #555, #3967
  static Telainstrucao + #556, #3967
  static Telainstrucao + #557, #3967
  static Telainstrucao + #558, #3967
  static Telainstrucao + #559, #95

  ;Linha 14
  static Telainstrucao + #560, #95
  static Telainstrucao + #561, #3967
  static Telainstrucao + #562, #80
  static Telainstrucao + #563, #85
  static Telainstrucao + #564, #76
  static Telainstrucao + #565, #65
  static Telainstrucao + #566, #82
  static Telainstrucao + #567, #58
  static Telainstrucao + #568, #3967
  static Telainstrucao + #569, #3967
  static Telainstrucao + #570, #3967
  static Telainstrucao + #571, #3967
  static Telainstrucao + #572, #3967
  static Telainstrucao + #573, #3967
  static Telainstrucao + #574, #517
  static Telainstrucao + #575, #3967
  static Telainstrucao + #576, #3967
  static Telainstrucao + #577, #3967
  static Telainstrucao + #578, #3967
  static Telainstrucao + #579, #3967
  static Telainstrucao + #580, #3967
  static Telainstrucao + #581, #3967
  static Telainstrucao + #582, #80
  static Telainstrucao + #583, #85
  static Telainstrucao + #584, #76
  static Telainstrucao + #585, #65
  static Telainstrucao + #586, #82
  static Telainstrucao + #587, #58
  static Telainstrucao + #588, #3967
  static Telainstrucao + #589, #3967
  static Telainstrucao + #590, #3967
  static Telainstrucao + #591, #3967
  static Telainstrucao + #592, #3967
  static Telainstrucao + #593, #3967
  static Telainstrucao + #594, #599
  static Telainstrucao + #595, #3967
  static Telainstrucao + #596, #3967
  static Telainstrucao + #597, #3967
  static Telainstrucao + #598, #3967
  static Telainstrucao + #599, #95

  ;Linha 15
  static Telainstrucao + #600, #95
  static Telainstrucao + #601, #3967
  static Telainstrucao + #602, #3967
  static Telainstrucao + #603, #3967
  static Telainstrucao + #604, #3967
  static Telainstrucao + #605, #3967
  static Telainstrucao + #606, #3967
  static Telainstrucao + #607, #3967
  static Telainstrucao + #608, #3967
  static Telainstrucao + #609, #3967
  static Telainstrucao + #610, #3967
  static Telainstrucao + #611, #3967
  static Telainstrucao + #612, #3967
  static Telainstrucao + #613, #3967
  static Telainstrucao + #614, #3967
  static Telainstrucao + #615, #3967
  static Telainstrucao + #616, #3967
  static Telainstrucao + #617, #3967
  static Telainstrucao + #618, #3967
  static Telainstrucao + #619, #3967
  static Telainstrucao + #620, #3967
  static Telainstrucao + #621, #3967
  static Telainstrucao + #622, #3967
  static Telainstrucao + #623, #3967
  static Telainstrucao + #624, #3967
  static Telainstrucao + #625, #3967
  static Telainstrucao + #626, #3967
  static Telainstrucao + #627, #3967
  static Telainstrucao + #628, #3967
  static Telainstrucao + #629, #3967
  static Telainstrucao + #630, #3967
  static Telainstrucao + #631, #3967
  static Telainstrucao + #632, #3967
  static Telainstrucao + #633, #3967
  static Telainstrucao + #634, #3967
  static Telainstrucao + #635, #3967
  static Telainstrucao + #636, #3967
  static Telainstrucao + #637, #3967
  static Telainstrucao + #638, #3967
  static Telainstrucao + #639, #95

  ;Linha 16
  static Telainstrucao + #640, #95
  static Telainstrucao + #641, #3967
  static Telainstrucao + #642, #3967
  static Telainstrucao + #643, #3967
  static Telainstrucao + #644, #3967
  static Telainstrucao + #645, #3967
  static Telainstrucao + #646, #3967
  static Telainstrucao + #647, #3967
  static Telainstrucao + #648, #3967
  static Telainstrucao + #649, #3967
  static Telainstrucao + #650, #3967
  static Telainstrucao + #651, #3967
  static Telainstrucao + #652, #3967
  static Telainstrucao + #653, #3967
  static Telainstrucao + #654, #3967
  static Telainstrucao + #655, #3967
  static Telainstrucao + #656, #3967
  static Telainstrucao + #657, #3967
  static Telainstrucao + #658, #3967
  static Telainstrucao + #659, #3967
  static Telainstrucao + #660, #3967
  static Telainstrucao + #661, #3967
  static Telainstrucao + #662, #3967
  static Telainstrucao + #663, #3967
  static Telainstrucao + #664, #3967
  static Telainstrucao + #665, #3967
  static Telainstrucao + #666, #3967
  static Telainstrucao + #667, #3967
  static Telainstrucao + #668, #3967
  static Telainstrucao + #669, #3967
  static Telainstrucao + #670, #3967
  static Telainstrucao + #671, #3967
  static Telainstrucao + #672, #3967
  static Telainstrucao + #673, #3967
  static Telainstrucao + #674, #3967
  static Telainstrucao + #675, #3967
  static Telainstrucao + #676, #3967
  static Telainstrucao + #677, #3967
  static Telainstrucao + #678, #3967
  static Telainstrucao + #679, #95

  ;Linha 17
  static Telainstrucao + #680, #95
  static Telainstrucao + #681, #3967
  static Telainstrucao + #682, #3967
  static Telainstrucao + #683, #3967
  static Telainstrucao + #684, #3967
  static Telainstrucao + #685, #3967
  static Telainstrucao + #686, #3967
  static Telainstrucao + #687, #3967
  static Telainstrucao + #688, #3967
  static Telainstrucao + #689, #3967
  static Telainstrucao + #690, #3967
  static Telainstrucao + #691, #3967
  static Telainstrucao + #692, #3967
  static Telainstrucao + #693, #3967
  static Telainstrucao + #694, #3967
  static Telainstrucao + #695, #3967
  static Telainstrucao + #696, #3967
  static Telainstrucao + #697, #3967
  static Telainstrucao + #698, #3967
  static Telainstrucao + #699, #3967
  static Telainstrucao + #700, #3967
  static Telainstrucao + #701, #3967
  static Telainstrucao + #702, #3967
  static Telainstrucao + #703, #3967
  static Telainstrucao + #704, #3967
  static Telainstrucao + #705, #3967
  static Telainstrucao + #706, #3967
  static Telainstrucao + #707, #3967
  static Telainstrucao + #708, #3967
  static Telainstrucao + #709, #3967
  static Telainstrucao + #710, #3967
  static Telainstrucao + #711, #3967
  static Telainstrucao + #712, #3967
  static Telainstrucao + #713, #3967
  static Telainstrucao + #714, #3967
  static Telainstrucao + #715, #3967
  static Telainstrucao + #716, #3967
  static Telainstrucao + #717, #3967
  static Telainstrucao + #718, #3967
  static Telainstrucao + #719, #95

  ;Linha 18
  static Telainstrucao + #720, #95
  static Telainstrucao + #721, #3967
  static Telainstrucao + #722, #3967
  static Telainstrucao + #723, #3967
  static Telainstrucao + #724, #3967
  static Telainstrucao + #725, #3967
  static Telainstrucao + #726, #3967
  static Telainstrucao + #727, #3967
  static Telainstrucao + #728, #3967
  static Telainstrucao + #729, #3967
  static Telainstrucao + #730, #3967
  static Telainstrucao + #731, #3967
  static Telainstrucao + #732, #3967
  static Telainstrucao + #733, #3967
  static Telainstrucao + #734, #3967
  static Telainstrucao + #735, #3967
  static Telainstrucao + #736, #3967
  static Telainstrucao + #737, #3967
  static Telainstrucao + #738, #3967
  static Telainstrucao + #739, #3967
  static Telainstrucao + #740, #3967
  static Telainstrucao + #741, #3967
  static Telainstrucao + #742, #3967
  static Telainstrucao + #743, #3967
  static Telainstrucao + #744, #3967
  static Telainstrucao + #745, #3967
  static Telainstrucao + #746, #3967
  static Telainstrucao + #747, #3967
  static Telainstrucao + #748, #3967
  static Telainstrucao + #749, #3967
  static Telainstrucao + #750, #3967
  static Telainstrucao + #751, #3967
  static Telainstrucao + #752, #3967
  static Telainstrucao + #753, #3967
  static Telainstrucao + #754, #3967
  static Telainstrucao + #755, #3967
  static Telainstrucao + #756, #3967
  static Telainstrucao + #757, #3967
  static Telainstrucao + #758, #3967
  static Telainstrucao + #759, #95

  ;Linha 19
  static Telainstrucao + #760, #95
  static Telainstrucao + #761, #3967
  static Telainstrucao + #762, #3967
  static Telainstrucao + #763, #3967
  static Telainstrucao + #764, #3967
  static Telainstrucao + #765, #3967
  static Telainstrucao + #766, #3967
  static Telainstrucao + #767, #3967
  static Telainstrucao + #768, #3967
  static Telainstrucao + #769, #3967
  static Telainstrucao + #770, #3967
  static Telainstrucao + #771, #3967
  static Telainstrucao + #772, #3967
  static Telainstrucao + #773, #3967
  static Telainstrucao + #774, #3967
  static Telainstrucao + #775, #3967
  static Telainstrucao + #776, #3967
  static Telainstrucao + #777, #3967
  static Telainstrucao + #778, #3967
  static Telainstrucao + #779, #3967
  static Telainstrucao + #780, #3967
  static Telainstrucao + #781, #3967
  static Telainstrucao + #782, #3967
  static Telainstrucao + #783, #3967
  static Telainstrucao + #784, #3967
  static Telainstrucao + #785, #3967
  static Telainstrucao + #786, #3967
  static Telainstrucao + #787, #3967
  static Telainstrucao + #788, #3967
  static Telainstrucao + #789, #3967
  static Telainstrucao + #790, #3967
  static Telainstrucao + #791, #3967
  static Telainstrucao + #792, #3967
  static Telainstrucao + #793, #3967
  static Telainstrucao + #794, #3967
  static Telainstrucao + #795, #3967
  static Telainstrucao + #796, #3967
  static Telainstrucao + #797, #3967
  static Telainstrucao + #798, #3967
  static Telainstrucao + #799, #95

  ;Linha 20
  static Telainstrucao + #800, #95
  static Telainstrucao + #801, #3967
  static Telainstrucao + #802, #3967
  static Telainstrucao + #803, #3967
  static Telainstrucao + #804, #3967
  static Telainstrucao + #805, #3967
  static Telainstrucao + #806, #3967
  static Telainstrucao + #807, #3967
  static Telainstrucao + #808, #3967
  static Telainstrucao + #809, #3967
  static Telainstrucao + #810, #3967
  static Telainstrucao + #811, #3967
  static Telainstrucao + #812, #3967
  static Telainstrucao + #813, #3967
  static Telainstrucao + #814, #3967
  static Telainstrucao + #815, #3967
  static Telainstrucao + #816, #3967
  static Telainstrucao + #817, #3967
  static Telainstrucao + #818, #3967
  static Telainstrucao + #819, #3967
  static Telainstrucao + #820, #3967
  static Telainstrucao + #821, #3967
  static Telainstrucao + #822, #3967
  static Telainstrucao + #823, #3967
  static Telainstrucao + #824, #3967
  static Telainstrucao + #825, #3967
  static Telainstrucao + #826, #3967
  static Telainstrucao + #827, #3967
  static Telainstrucao + #828, #3967
  static Telainstrucao + #829, #3967
  static Telainstrucao + #830, #3967
  static Telainstrucao + #831, #3967
  static Telainstrucao + #832, #3967
  static Telainstrucao + #833, #3967
  static Telainstrucao + #834, #3967
  static Telainstrucao + #835, #3967
  static Telainstrucao + #836, #3967
  static Telainstrucao + #837, #3967
  static Telainstrucao + #838, #3967
  static Telainstrucao + #839, #95

  ;Linha 21
  static Telainstrucao + #840, #95
  static Telainstrucao + #841, #3967
  static Telainstrucao + #842, #3967
  static Telainstrucao + #843, #3967
  static Telainstrucao + #844, #3967
  static Telainstrucao + #845, #3967
  static Telainstrucao + #846, #3967
  static Telainstrucao + #847, #3967
  static Telainstrucao + #848, #3967
  static Telainstrucao + #849, #3967
  static Telainstrucao + #850, #3967
  static Telainstrucao + #851, #3967
  static Telainstrucao + #852, #3967
  static Telainstrucao + #853, #3967
  static Telainstrucao + #854, #3967
  static Telainstrucao + #855, #3967
  static Telainstrucao + #856, #3967
  static Telainstrucao + #857, #3967
  static Telainstrucao + #858, #3967
  static Telainstrucao + #859, #3967
  static Telainstrucao + #860, #3967
  static Telainstrucao + #861, #3967
  static Telainstrucao + #862, #3967
  static Telainstrucao + #863, #3967
  static Telainstrucao + #864, #3967
  static Telainstrucao + #865, #3967
  static Telainstrucao + #866, #3967
  static Telainstrucao + #867, #3967
  static Telainstrucao + #868, #3967
  static Telainstrucao + #869, #3967
  static Telainstrucao + #870, #3967
  static Telainstrucao + #871, #3967
  static Telainstrucao + #872, #3967
  static Telainstrucao + #873, #3967
  static Telainstrucao + #874, #3967
  static Telainstrucao + #875, #3967
  static Telainstrucao + #876, #3967
  static Telainstrucao + #877, #3967
  static Telainstrucao + #878, #3967
  static Telainstrucao + #879, #95

  ;Linha 22
  static Telainstrucao + #880, #95
  static Telainstrucao + #881, #3967
  static Telainstrucao + #882, #3967
  static Telainstrucao + #883, #3967
  static Telainstrucao + #884, #3967
  static Telainstrucao + #885, #3967
  static Telainstrucao + #886, #3967
  static Telainstrucao + #887, #3967
  static Telainstrucao + #888, #3967
  static Telainstrucao + #889, #3967
  static Telainstrucao + #890, #3967
  static Telainstrucao + #891, #3967
  static Telainstrucao + #892, #3967
  static Telainstrucao + #893, #3967
  static Telainstrucao + #894, #3967
  static Telainstrucao + #895, #3967
  static Telainstrucao + #896, #3967
  static Telainstrucao + #897, #3967
  static Telainstrucao + #898, #3967
  static Telainstrucao + #899, #3967
  static Telainstrucao + #900, #3967
  static Telainstrucao + #901, #3967
  static Telainstrucao + #902, #3967
  static Telainstrucao + #903, #3967
  static Telainstrucao + #904, #3967
  static Telainstrucao + #905, #3967
  static Telainstrucao + #906, #3967
  static Telainstrucao + #907, #3967
  static Telainstrucao + #908, #3967
  static Telainstrucao + #909, #3967
  static Telainstrucao + #910, #3967
  static Telainstrucao + #911, #3967
  static Telainstrucao + #912, #3967
  static Telainstrucao + #913, #3967
  static Telainstrucao + #914, #3967
  static Telainstrucao + #915, #3967
  static Telainstrucao + #916, #3967
  static Telainstrucao + #917, #3967
  static Telainstrucao + #918, #3967
  static Telainstrucao + #919, #95

  ;Linha 23
  static Telainstrucao + #920, #95
  static Telainstrucao + #921, #3967
  static Telainstrucao + #922, #3967
  static Telainstrucao + #923, #3967
  static Telainstrucao + #924, #3967
  static Telainstrucao + #925, #3967
  static Telainstrucao + #926, #3967
  static Telainstrucao + #927, #3967
  static Telainstrucao + #928, #3967
  static Telainstrucao + #929, #3967
  static Telainstrucao + #930, #3967
  static Telainstrucao + #931, #3967
  static Telainstrucao + #932, #3967
  static Telainstrucao + #933, #3967
  static Telainstrucao + #934, #3967
  static Telainstrucao + #935, #3967
  static Telainstrucao + #936, #3967
  static Telainstrucao + #937, #3967
  static Telainstrucao + #938, #3967
  static Telainstrucao + #939, #3967
  static Telainstrucao + #940, #3967
  static Telainstrucao + #941, #3967
  static Telainstrucao + #942, #3967
  static Telainstrucao + #943, #3967
  static Telainstrucao + #944, #3967
  static Telainstrucao + #945, #3967
  static Telainstrucao + #946, #3967
  static Telainstrucao + #947, #3967
  static Telainstrucao + #948, #3967
  static Telainstrucao + #949, #3967
  static Telainstrucao + #950, #3967
  static Telainstrucao + #951, #3967
  static Telainstrucao + #952, #3967
  static Telainstrucao + #953, #3967
  static Telainstrucao + #954, #3967
  static Telainstrucao + #955, #3967
  static Telainstrucao + #956, #3967
  static Telainstrucao + #957, #3967
  static Telainstrucao + #958, #3967
  static Telainstrucao + #959, #95

  ;Linha 24
  static Telainstrucao + #960, #95
  static Telainstrucao + #961, #3967
  static Telainstrucao + #962, #3967
  static Telainstrucao + #963, #3967
  static Telainstrucao + #964, #3967
  static Telainstrucao + #965, #3967
  static Telainstrucao + #966, #3967
  static Telainstrucao + #967, #3967
  static Telainstrucao + #968, #3967
  static Telainstrucao + #969, #3967
  static Telainstrucao + #970, #3967
  static Telainstrucao + #971, #3967
  static Telainstrucao + #972, #3967
  static Telainstrucao + #973, #3967
  static Telainstrucao + #974, #3967
  static Telainstrucao + #975, #3967
  static Telainstrucao + #976, #3967
  static Telainstrucao + #977, #3967
  static Telainstrucao + #978, #3967
  static Telainstrucao + #979, #3967
  static Telainstrucao + #980, #3967
  static Telainstrucao + #981, #3967
  static Telainstrucao + #982, #3967
  static Telainstrucao + #983, #3967
  static Telainstrucao + #984, #3967
  static Telainstrucao + #985, #3967
  static Telainstrucao + #986, #3967
  static Telainstrucao + #987, #3967
  static Telainstrucao + #988, #3967
  static Telainstrucao + #989, #3967
  static Telainstrucao + #990, #3967
  static Telainstrucao + #991, #3967
  static Telainstrucao + #992, #3967
  static Telainstrucao + #993, #3967
  static Telainstrucao + #994, #3967
  static Telainstrucao + #995, #3967
  static Telainstrucao + #996, #3967
  static Telainstrucao + #997, #3967
  static Telainstrucao + #998, #3967
  static Telainstrucao + #999, #95

  ;Linha 25
  static Telainstrucao + #1000, #95
  static Telainstrucao + #1001, #3967
  static Telainstrucao + #1002, #3967
  static Telainstrucao + #1003, #3967
  static Telainstrucao + #1004, #3967
  static Telainstrucao + #1005, #3967
  static Telainstrucao + #1006, #3967
  static Telainstrucao + #1007, #3967
  static Telainstrucao + #1008, #3967
  static Telainstrucao + #1009, #3967
  static Telainstrucao + #1010, #3967
  static Telainstrucao + #1011, #3967
  static Telainstrucao + #1012, #3967
  static Telainstrucao + #1013, #3967
  static Telainstrucao + #1014, #3967
  static Telainstrucao + #1015, #3967
  static Telainstrucao + #1016, #3967
  static Telainstrucao + #1017, #3967
  static Telainstrucao + #1018, #3967
  static Telainstrucao + #1019, #3967
  static Telainstrucao + #1020, #3967
  static Telainstrucao + #1021, #3967
  static Telainstrucao + #1022, #3967
  static Telainstrucao + #1023, #3967
  static Telainstrucao + #1024, #3967
  static Telainstrucao + #1025, #3967
  static Telainstrucao + #1026, #3967
  static Telainstrucao + #1027, #3967
  static Telainstrucao + #1028, #3967
  static Telainstrucao + #1029, #3967
  static Telainstrucao + #1030, #3967
  static Telainstrucao + #1031, #3967
  static Telainstrucao + #1032, #3967
  static Telainstrucao + #1033, #3967
  static Telainstrucao + #1034, #3967
  static Telainstrucao + #1035, #3967
  static Telainstrucao + #1036, #3967
  static Telainstrucao + #1037, #3967
  static Telainstrucao + #1038, #3967
  static Telainstrucao + #1039, #95

  ;Linha 26
  static Telainstrucao + #1040, #95
  static Telainstrucao + #1041, #3967
  static Telainstrucao + #1042, #3967
  static Telainstrucao + #1043, #3967
  static Telainstrucao + #1044, #3967
  static Telainstrucao + #1045, #3967
  static Telainstrucao + #1046, #3967
  static Telainstrucao + #1047, #3967
  static Telainstrucao + #1048, #3967
  static Telainstrucao + #1049, #3967
  static Telainstrucao + #1050, #3967
  static Telainstrucao + #1051, #3967
  static Telainstrucao + #1052, #637
  static Telainstrucao + #1053, #3967
  static Telainstrucao + #1054, #598
  static Telainstrucao + #1055, #591
  static Telainstrucao + #1056, #588
  static Telainstrucao + #1057, #596
  static Telainstrucao + #1058, #577
  static Telainstrucao + #1059, #594
  static Telainstrucao + #1060, #3967
  static Telainstrucao + #1061, #590
  static Telainstrucao + #1062, #591
  static Telainstrucao + #1063, #3967
  static Telainstrucao + #1064, #589
  static Telainstrucao + #1065, #581
  static Telainstrucao + #1066, #590
  static Telainstrucao + #1067, #597
  static Telainstrucao + #1068, #3967
  static Telainstrucao + #1069, #3967
  static Telainstrucao + #1070, #3967
  static Telainstrucao + #1071, #3967
  static Telainstrucao + #1072, #3967
  static Telainstrucao + #1073, #3967
  static Telainstrucao + #1074, #3967
  static Telainstrucao + #1075, #3967
  static Telainstrucao + #1076, #3967
  static Telainstrucao + #1077, #3967
  static Telainstrucao + #1078, #3967
  static Telainstrucao + #1079, #95

  ;Linha 27
  static Telainstrucao + #1080, #95
  static Telainstrucao + #1081, #3967
  static Telainstrucao + #1082, #3967
  static Telainstrucao + #1083, #3967
  static Telainstrucao + #1084, #3967
  static Telainstrucao + #1085, #3967
  static Telainstrucao + #1086, #3967
  static Telainstrucao + #1087, #3967
  static Telainstrucao + #1088, #3967
  static Telainstrucao + #1089, #3967
  static Telainstrucao + #1090, #3967
  static Telainstrucao + #1091, #3967
  static Telainstrucao + #1092, #3967
  static Telainstrucao + #1093, #3967
  static Telainstrucao + #1094, #3967
  static Telainstrucao + #1095, #3967
  static Telainstrucao + #1096, #3967
  static Telainstrucao + #1097, #3967
  static Telainstrucao + #1098, #3967
  static Telainstrucao + #1099, #3967
  static Telainstrucao + #1100, #3967
  static Telainstrucao + #1101, #3967
  static Telainstrucao + #1102, #3967
  static Telainstrucao + #1103, #3967
  static Telainstrucao + #1104, #3967
  static Telainstrucao + #1105, #3967
  static Telainstrucao + #1106, #3967
  static Telainstrucao + #1107, #3967
  static Telainstrucao + #1108, #3967
  static Telainstrucao + #1109, #3967
  static Telainstrucao + #1110, #3967
  static Telainstrucao + #1111, #3967
  static Telainstrucao + #1112, #3967
  static Telainstrucao + #1113, #3967
  static Telainstrucao + #1114, #3967
  static Telainstrucao + #1115, #3967
  static Telainstrucao + #1116, #3967
  static Telainstrucao + #1117, #3967
  static Telainstrucao + #1118, #3967
  static Telainstrucao + #1119, #95

  ;Linha 28
  static Telainstrucao + #1120, #95
  static Telainstrucao + #1121, #95
  static Telainstrucao + #1122, #3967
  static Telainstrucao + #1123, #3967
  static Telainstrucao + #1124, #3967
  static Telainstrucao + #1125, #3967
  static Telainstrucao + #1126, #3967
  static Telainstrucao + #1127, #3967
  static Telainstrucao + #1128, #3967
  static Telainstrucao + #1129, #3967
  static Telainstrucao + #1130, #3967
  static Telainstrucao + #1131, #3967
  static Telainstrucao + #1132, #3967
  static Telainstrucao + #1133, #3967
  static Telainstrucao + #1134, #3967
  static Telainstrucao + #1135, #3967
  static Telainstrucao + #1136, #3967
  static Telainstrucao + #1137, #3967
  static Telainstrucao + #1138, #3967
  static Telainstrucao + #1139, #3967
  static Telainstrucao + #1140, #3967
  static Telainstrucao + #1141, #3967
  static Telainstrucao + #1142, #3967
  static Telainstrucao + #1143, #3967
  static Telainstrucao + #1144, #3967
  static Telainstrucao + #1145, #3967
  static Telainstrucao + #1146, #3967
  static Telainstrucao + #1147, #3967
  static Telainstrucao + #1148, #3967
  static Telainstrucao + #1149, #3967
  static Telainstrucao + #1150, #3967
  static Telainstrucao + #1151, #3967
  static Telainstrucao + #1152, #3967
  static Telainstrucao + #1153, #3967
  static Telainstrucao + #1154, #3967
  static Telainstrucao + #1155, #3967
  static Telainstrucao + #1156, #3967
  static Telainstrucao + #1157, #3967
  static Telainstrucao + #1158, #95
  static Telainstrucao + #1159, #95

  ;Linha 29
  static Telainstrucao + #1160, #95
  static Telainstrucao + #1161, #95
  static Telainstrucao + #1162, #95
  static Telainstrucao + #1163, #95
  static Telainstrucao + #1164, #95
  static Telainstrucao + #1165, #95
  static Telainstrucao + #1166, #95
  static Telainstrucao + #1167, #95
  static Telainstrucao + #1168, #95
  static Telainstrucao + #1169, #95
  static Telainstrucao + #1170, #95
  static Telainstrucao + #1171, #95
  static Telainstrucao + #1172, #95
  static Telainstrucao + #1173, #95
  static Telainstrucao + #1174, #95
  static Telainstrucao + #1175, #95
  static Telainstrucao + #1176, #95
  static Telainstrucao + #1177, #95
  static Telainstrucao + #1178, #95
  static Telainstrucao + #1179, #95
  static Telainstrucao + #1180, #95
  static Telainstrucao + #1181, #95
  static Telainstrucao + #1182, #95
  static Telainstrucao + #1183, #95
  static Telainstrucao + #1184, #95
  static Telainstrucao + #1185, #95
  static Telainstrucao + #1186, #95
  static Telainstrucao + #1187, #95
  static Telainstrucao + #1188, #95
  static Telainstrucao + #1189, #95
  static Telainstrucao + #1190, #95
  static Telainstrucao + #1191, #95
  static Telainstrucao + #1192, #95
  static Telainstrucao + #1193, #95
  static Telainstrucao + #1194, #95
  static Telainstrucao + #1195, #95
  static Telainstrucao + #1196, #95
  static Telainstrucao + #1197, #95
  static Telainstrucao + #1198, #95
  static Telainstrucao + #1199, #95
