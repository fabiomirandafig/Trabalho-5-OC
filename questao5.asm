#Calcular m[3] = m[2]/m[1] e m[4] = m[2]%m[1] resto da divisão.
lw $t0,0($gp) #m[1] de m[3]=m[2]/m[1]
lw $t1,4($gp) #m[2] de m[3]=m[2]/m[1]

# Divisao m[3] = m[2]/m[1] e resto da divisão m[4] = m[2]%m[1]
loop:
    sub $t1,$t1,$t0 # t1 = t1 - t0
    slt $t2,$t1,$zero # t2 == 1 se t1 é negativo ou zero caso contrário
    beq $t2,1,fim # se t2==1,pula pra fim e acaba a divisão
    addi $t3,$t3,1 # t3 = divisao = t3++
    jal loop 
fim: 
    add $t1, $t1, $t0 # obtendo o resto da divisão
    sw $t3,8($gp) # gravando na memoria o valor da divisao exata
    sw $t1,12($gp) #gravando na memoria o valor do resto da divisão

