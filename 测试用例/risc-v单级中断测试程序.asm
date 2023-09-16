.text

addi sp, zero, 2000   #�ڴ��ջ��ʼ��?

#############################################################
#����Ʋ���?,����addi,andi,slli,srli,srai,or,ori,nor,ecall  LED������Ʒ�ʽ������ʾ����?
#############################################################

.text
START:

addi s0,zero,1 
slli s3, s0, 31      # s3=0x80000000
srai s3, s3, 31      # s3=0xFFFFFFFF   
add s0,zero,zero   # s0=0         
addi s2,zero,12 

addi s6,zero,8  #����Ƽ���?	
zmd_loop:

addi s0, s0, 1    #������һ������Ƶ���?
andi s0, s0, 15  

#######################################
addi t0,zero,8    
addi t1,zero,1
left:

slli s3, s3, 4   #���������?
or s3, s3, s0

add    a0,zero,s3       # display s3
addi   a7,zero,34         # system call for LED display 
ecall                 # display 

sub t0,t0,t1
bne t0,zero,left
#######################################

addi s0, s0, 1   #������һ������Ƶ���?
addi t6,zero,15
and s0, s0, t6
slli s0, s0, 28     

addi t0,zero,8
addi t1,zero,1

zmd_right:

srli s3, s3, 4  #���������?
or s3, s3, s0

add    a0,zero,s3       # display s3
addi   a7,zero,34         # system call for LED display 
ecall                 # display 

sub t0,t0,t1
bne t0,zero,zmd_right
srli s0, s0, 28  
#######################################

sub s6,s6,t1
beq s6,zero, exit
j zmd_loop

exit:

add t0,zero,zero
xori t0,t0,-1      #test nor  ori
slli t0,t0,16
ori t0,t0,-1

add   a0,zero,t0       # display t0
addi   a7,zero,34         # system call for LED display 
ecall                 # display 

j START   # loop forever



InteruptProgram1:
###########################################################
#  exceptoin 1
#  ʹ��?s6? s5?s4?s3?s0?a0?a7
###########################################################

sw a7, 0(sp)         #inter 1#
addi sp, sp, 4
sw a0, 0(sp)
addi sp, sp, 4
sw s0, 0(sp)
addi sp, sp, 4
sw s3, 0(sp)
addi sp, sp, 4
sw s4, 0(sp)
addi sp, sp, 4
sw s5, 0(sp)
addi sp, sp, 4
sw s6, 0(sp)
addi sp, sp, 4

#################  �жϷ���

addi s6,zero,1      #�������ʾ���֣�? ��ͬ�жϺ���ʾ��ͬ��ֵ���ֱ�����Ϊ1,2,3
addi s4,zero,3      #ѭ��������ʼֵ   
addi s5,zero,1      #�������ۼ�ֵ


IntLoop1:
add s0,zero,s6   

IntLeftShift1:       


slli s0, s0, 4  
or s3,s0,s4
add    a0,zero,s3       #display s0
addi   a7,zero,34       #display hex
ecall               

bne s0, zero, IntLeftShift1
sub s4,s4,s5            #ѭ�������ݼ�
bne s4, zero, IntLoop1

################# �ָ��ֳ�

addi sp, sp, -4        
lw s6, 0(sp)
addi sp, sp, -4
lw s5, 0(sp)
addi sp, sp, -4
lw s4, 0(sp)
addi sp, sp, -4
lw s3, 0(sp)
addi sp, sp, -4
lw s0, 0(sp)
addi sp, sp, -4
lw a0, 0(sp)
addi sp, sp, -4
lw a7, 0(sp)

################  �жϷ���

uret              #ͬ�����жϣ�mepc-->pc



InteruptProgram2:
#############################################################################################
#  exceptoin 2
#  ʹ��?s6? s5?s4?s3?s0?a0?a7
#############################################################################################


################# �����ֳ�

sw a7, 0(sp)         #inter 2#
addi sp, sp, 4
sw a0, 0(sp)
addi sp, sp, 4
sw s0, 0(sp)
addi sp, sp, 4
sw s3, 0(sp)
addi sp, sp, 4
sw s4, 0(sp)
addi sp, sp, 4
sw s5, 0(sp)
addi sp, sp, 4
sw s6, 0(sp)
addi sp, sp, 4

################# �жϷ���

addi s6,zero,2       #�������ʾ���֣�? ��ͬ�жϺ���ʾ��ͬ��ֵ���ֱ�����Ϊ1,2,3
addi s4,zero,3       #ѭ��������ʼֵ   
addi s5,zero,1       #�������ۼ�ֵ


IntLoop2:
add s0,zero,s6   

IntLeftShift2:       


slli s0, s0, 4  
or s3,s0,s4
add    a0,zero,s3       #display s0
addi   a7,zero,34       #display hex
ecall                  

bne s0, zero, IntLeftShift2
sub s4,s4,s5           #ѭ�������ݼ�
bne s4, zero, IntLoop2

################# �ָ��ֳ�

addi sp, sp, -4
lw s6, 0(sp)
addi sp, sp, -4
lw s5, 0(sp)
addi sp, sp, -4
lw s4, 0(sp)
addi sp, sp, -4
lw s3, 0(sp)
addi sp, sp, -4
lw s0, 0(sp)
addi sp, sp, -4
lw a0, 0(sp)
addi sp, sp, -4
lw a7, 0(sp)


################  �жϷ���
uret              #ͬ�����жϣ�mepc-->pc


InteruptProgram3:
#############################################################################################
#  exceptoin 3
#  ʹ��?s6? s5?s4?s3?s0?a0?a7
#############################################################################################

################# �����ֳ�

sw a7, 0(sp)    #inter 3#
addi sp, sp, 4
sw a0, 0(sp)
addi sp, sp, 4
sw s0, 0(sp)
addi sp, sp, 4
sw s3, 0(sp)
addi sp, sp, 4
sw s4, 0(sp)
addi sp, sp, 4
sw s5, 0(sp)
addi sp, sp, 4
sw s6, 0(sp)
addi sp, sp, 4

################# �жϷ���

addi s6,zero,3       #�������ʾ���֣�? ��ͬ�жϺ���ʾ��ͬ��ֵ���ֱ�����Ϊ1,2,3
addi s4,zero,3       #ѭ��������ʼֵ   
addi s5,zero,1       #�������ۼ�ֵ

IntLoop:
add s0,zero,s6   

IntLeftShift:       

slli s0, s0, 4  
or s3,s0,s4
add    a0,zero,s3       #display s0
addi   a7,zero,34       # display hex
ecall                 

bne s0, zero, IntLeftShift
sub s4,s4,s5           #ѭ�������ݼ�
bne s4, zero, IntLoop


################# �ָ��ֳ�

addi sp, sp, -4
lw s6, 0(sp)
addi sp, sp, -4
lw s5, 0(sp)
addi sp, sp, -4
lw s4, 0(sp)
addi sp, sp, -4
lw s3, 0(sp)
addi sp, sp, -4
lw s0, 0(sp)
addi sp, sp, -4
lw a0, 0(sp)
addi sp, sp, -4
lw a7, 0(sp)


################  �жϷ���
uret              #ͬ�����жϣ�mepc-->pc
