
# Palindrome detection in MIPS assembly using MARS
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 
     
main:
        la         $s1, mesg         # get address of mesg to $s1
        addu       $s2, $s1,   $zero # $s2=$s1
loop:
addiu       $s3,$s3,   1      #counter for letters of the word
        addiu      $s2, $s2,   1     # $s2=$s1 + 1
        lbu        $t0, 0($s2)       # get next character
        bne        $t0, $zero, loop  # repeat if char not '\0'
        # end of loop here
        addiu      $s2, $s2,  -1     # Adjust $s2 to point to last char

        ########################################################################
        andi  $t0,  $s3,  0x1
        beq   $t0,  $zero,    label1
        addiu $s3,$s3,   -1
        	
label1:
	lb  $t1, 0($s1)
	lb  $t2, 0($s2)  
 
loop1:
	beq    $s3 ,$zero,exitloop1
	bne	$t1,$t2 , exitloop2
	addiu    $s1, $s1,  1
	addiu    $s2 ,$s2, -1
	lb  $t1, 0($s1)
	lb  $t2, 0($s2)
	addiu       $s3,$s3 ,   -2
	j loop1	
exitloop1:
exitloop2:
	bne $s3, $zero ,else
	la $a0, tr
	j skip
else:
	la $a0, fa
skip:
	addiu $v0, $zero, 4 
	syscall
        ########################################################################
        
exit: 
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.
        
###############################################################################

        .data
mesg:   .asciiz "racecar"

tr:  .asciiz  "0"
fa:  .asciiz  "1"  
