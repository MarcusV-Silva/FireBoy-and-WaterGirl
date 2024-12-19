# Fireboy and Watergirl


## Autores

Andre Jacob Suaide

Felipe Aparecido da Silva

[Gustavo Carvalho Araujo](https://www.linkedin.com/in/guaraujoc/)

Henrique de Oliveira Araujo

Marcus Vinicius da Silva

Oliver Kenzo Kobayashi

[Rodrigo Rodrigues de Castro](https://github.com/rodrigorcz)

Viktor Sergio Ferreira

Vitor Augusto Paiva de Brito

Yazid Alamou Bouari


## Descrição

&nbsp;&nbsp;&nbsp;&nbsp;Este repositório contém a implementação do jogo Fireboy e Watergirl em Assembly para o processador do Instituto de Ciências Matemáticas e de Computação de São Carlos (ICMC). Para o seu simular o jogo em sua máquina, siga as intruções do repositório do [Processador do ICMC](https://github.com/simoesusp/Processador-ICMC/blob/master/Install_Packages/) de acordo com o sistema operacional da sua máquina.

## Inicializando o jogo

&nbsp;&nbsp;&nbsp;&nbsp;Para inicializar o jogo, copie e cole o arquivo (sim) e (montador) gerado nas intruções do [Processador do ICMC](https://github.com/simoesusp/Processador-ICMC/blob/master/Install_Packages/) e os substitua na pasta do jogo. Logo após utilize os seguintes comandos para montar e rodar a simulação do jogo:

```
./montador Jogo.asm Jogo.mif
./sim Jogo.mif charmap.mif
```

## Comandos

&nbsp;&nbsp;&nbsp;&nbsp;O jogo possui dois personagens e são controlados pelas setas do teclado e pelas teclas WASD.

&nbsp;&nbsp;&nbsp;&nbsp;Para o personagem do Fireboy temos as ações:

&nbsp;&nbsp;&nbsp;&nbsp;W - Pular

&nbsp;&nbsp;&nbsp;&nbsp;A - Andar para a esquerda

&nbsp;&nbsp;&nbsp;&nbsp;S - Agachar

&nbsp;&nbsp;&nbsp;&nbsp;D - Andar para a direita


&nbsp;&nbsp;&nbsp;&nbsp;Para o personagem da Watergirl temos as ações:

&nbsp;&nbsp;&nbsp;&nbsp;^ - Pular

&nbsp;&nbsp;&nbsp;&nbsp;< - Andar para a esquerda

&nbsp;&nbsp;&nbsp;&nbsp;> - Andar para a direita

&nbsp;&nbsp;&nbsp;&nbsp;V - Agachar

## Objetivo

&nbsp;&nbsp;&nbsp;&nbsp;O objetivo do jogo é explorar o mapa para encontrar a chave, desbloquear a porta e progredir para o próximo nível. No entanto, há um desafio adicional: o jogador controlando o Fireboy deve evitar a água, enquanto o jogador controlando a Watergirl precisa esquivar-se da lava espalhada pelo cenário. Se um dos jogadores tocar em uma área proibida para seu respectivo personagem, a fase será reiniciada para uma nova tentativa.

## Requerimentos de compilação

&nbsp;&nbsp;&nbsp;&nbsp;Para compilar o código no simulador, é necessário ter um computador com Windows, Linux ou MacOS de sistema operacional e seguir as instruções do [Processador do ICMC](https://github.com/simoesusp/Processador-ICMC/blob/master/Install_Packages/) para gerar os executáveis (sim) e (montador).

## Contribuições

&nbsp;&nbsp;&nbsp;&nbsp;Este projeto está sendo desenvolvido como método avaliativo da disciplina SSC0902 - Organização e Arquitetura de Computadores, na Universidade de São Paulo. Portanto, enquanto estiver em desenvolvimento, as contribuições ficam limitadas aos integrantes do grupo da disciplina. Porém, ao finalizar o projeto, ele estará aberto para qualquer melhoria sugerida.

## Licença

&nbsp;&nbsp;&nbsp;&nbsp;Este programa está sobre a licença [MIT License](https://opensource.org/licenses/MIT).
