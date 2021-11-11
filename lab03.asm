# lab03.asm - Recursive palindrome string tester
#   coded in  MIPS assembly using MARS
# for MYΥ-505 - Computer Architecture, Fall 2021
# Department of Computer Science and Engineering, University of Ioannina
# Instructor: Aris Efthymiou

.globl pdrome

###############################################################################
.data
anna:  .asciiz "anna"
bobob: .asciiz "bobob"

###############################################################################
.text
  la    $a0, anna
  addi  $a1, $zero, 4
  jal   pdrome
  add   $s0, $v0, $zero  # keep the return value

  la    $a0, bobob
  addi  $a1, $zero, 5
  jal   pdrome
  add   $s1, $v0, $zero  # keep the return value
  # both s1 and s0 must be 1 here

  addiu   $v0, $zero, 10    # system service 10 is exit
  syscall                   # we are outa here.


pdrome:
###############################################################################
# Write you code here.
# Any code above the label swapArray is not executed by the tester! 
###############################################################################

addi $sp, $sp, -8 #katanomh ths mnhmhs se stoiba
sw $ra, 0($sp) #apothikeuei thn dieuthunsh epistrofhs
sw $a0, 4($sp) #apothikeuei thn timh orismatos

lw $a0, 4($sp) #load argument
add $t1, $a0, $zero #apothikeuei thn timh tou ston t1

li $t2, 1 #orizei ton t2 se 1
li $v0, 1 #proetoimazei thn timh epistrofhs (return value)
srl $t3, $a1, 1 #ypologizei to mhkos tou string kai to diairei me to 2
addi $t3, $t3, 1 #se periptosh pou einai zygos o arithmos prosthetei akomh ena 

loop:
beq $t2,$t3 exit #otan o counter ftanei sth mesh tou string - exit
lb $t4, 0($a0) #t4 = first char

sub $t5, $a1, $t2 #afairei ton counter apo to mhkos tou string
add $t6, $t5, $t1 #add index apo to telos tou string mexri thn arxh tou address
lb $t7, 0($t6) #t7 = last char

beq $t4, $t7, continue #an oi harakthres einai oi idioi synexise
li $v0, 0 #an oxi return 0
j exit

continue:
addi $a0, $a0, 1 #metopise ton pointer sto string ena keno pros ta deksia
addi $t2, $t2, 1 #counter =counter + 1
j loop

exit:

lw $ra, 0($sp) #load return address
addi $sp, $sp, 8 #free stack
	

###############################################################################
# End of your code.
###############################################################################
  jr $ra

