# Percorrer um vetor m(2)...m(100),verificar se m(0) está no vetor,gravar 1 em m(1)
li $t4,0 #responsável por gravar 1 em m(1) ou 0 caso contrário
addi $t2,$gp,8 #ponteiro apontando para a terceira posição do vetor,isto é,apontando para m(2)
lw $t0,0($gp) #corresponde a m(0) que é o elemento que estamos procurando

loop:
    lw $t1,0($t2) #m(2)
    beq $t5,99,fim #roda o loop ate m(100)
    beq $t0,$t1,achou #se m(0) está no vetor, entao pula pra achou
    addi $t2,$t2,4 #incremento de quatro bits para o ponteiro,isto é,ponteiro aponta para a próxima posição do vetor 
    addi $t5,$t5,1 #contador que guarda quantas posiçoes foram percorridas no vetor, quando chegar na posição 100(m(100)) o programa termina
    jal loop
achou: 
    li $t4,1 # se m(0) está no vetor, é gravado 1
fim: 
    sw $t4,4($gp) # grava 1 se m(0) está no vetor e 0 caso contrário
 
