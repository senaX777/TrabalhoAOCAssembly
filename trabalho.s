.data
    msg1: .asciiz "digite um numero entre 2 e 50000: "
    msg2: .asciiz "\nprimeiro primo anterior: "
    msg3: .asciiz "\nprimeiro primo posterior: "
    msg4: .asciiz "nao existe primo anterior"
.text
main:
    li $t4, 0
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    ble $t0, 1, main
    bgt $t0, 50000, main
    beq $t0, 2, s_ant
    sub $t1, $t0, 1
ant:
    li $t2, 2
ver_ant:
    bge $t2, $t1, primo_ant
    rem $t3, $t1, $t2
    beq $t3, $t4, prox_ant
    add $t2, $t2, 1
    j ver_ant
prox_ant:
    sub $t1, $t1, 1
    j ant
primo_ant:
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    j procurar_dps
s_ant:
    li $v0, 4
    la $a0, msg4
    syscall
    j procurar_dps
procurar_dps:
    addi $t1, $t0, 1
dps:
    li $t2, 2
ver_dps:
    bge $t2, $t1, primo_dps
    rem $t3, $t1, $t2
    beq $t3, $t4, prox_dps
    addi $t2, $t2, 1
    j ver_dps
prox_dps:
    addi $t1, $t1, 1
    j dps
primo_dps:
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 10
    syscall