;WORKING CODE 
[org 0x0100]
jmp start
column_shape: db 15, 0

start_game: db '   PRESS ENTER TO START GAME   ', 0
start_game_length: dw 31 
level : db 0 
name: db ' PROPERTY OF AREEB & ADEENA ',0
instruction1: db 'Press a for easy level ',0
instruction2: db 'Press b for medium level ',0
instruction3: db 'Press c for hard level ',0

    l1:db '  ######   ##     ##   ########       ######     ##     ##   ##     ##',0
    l2:db ' ##        ##     ##   ##      ##   ##      ##   ##   ##     ##     ##',0
    l3:db '  ######   ##     ##   ##       ##  ##      ##   ## ##       ##     ##',0
    l4:db '       ##  ##     ##   ##      ##   ##      ##   ##   ##     ##     ##',0
    l5:db '  ######    #######    ########       ######     ##     ##    ####### ',0

sudoko: db 'WELCOME TO SUDOKO',0
mistakes: db 'Mistakes: /3',0
t: db 'Timer: ',0
score: db 'Score:',0
eraseflag: db 0
notesDI: dw 0,0,0,0,0,0,0,0,0,0
notesVals: db  0,0,0,0,0,0,0,0,0,0

line1:db ' ######    #####  ###    ### #######      ######  ###   ### #######  ######  ',0
line2:db' ##       ##   ## ####   #### ##          ##   ##  ##   ##  ##       ##   ##',0
line3:db' ##  ###  ####### ## ## ## ## #####       ##   ##  ##   ##  #####    ###### ',0
line4:db' ##   ##  ##   ## ##  ###  ## ##          ##   ##  ##   ##  ##       ##   ##',0
line5:db'  ######  ##   ## ##       ## #######      ######   #####   #######  ##   ##',0
line6:db'                                                                                ',0
line7:db 'Final Score:',0
line8:db'Time Survived:',0

vline1: db '##     ## ##########    ####### ##########   ######    ######   ##        ##',0
vline2: db ' ##   ##      ##      ##            ##     ##      ##  ##   ##   ##      ## ',0
vline3: db '  ## ##       ##      ##            ##     ##      ##  ######     ##    ##  ',0
vline4: db '   ###        ##      ##            ##     ##      ##  ##   ##       ##     ',0
vline5: db '    #     ##########    #######     ##       ######    ##   ##       ##     ',0
vline6:db'                                                                                ',0
vline7:db ' Final Score:',0
vline8:db' Time Survived:',0
movesrequired: db 40
moves: db 0
shape1:db 0x0f,0

answerBoard:  db 5,7,4,1,3,8,2,6,9
              db 1,2,9,7,5,6,3,4,8
              db 8,6,3,4,2,9,1,7,5
              db 7,4,8,3,6,5,9,1,2
              db 9,1,2,8,4,7,5,3,6
              db 3,5,6,2,9,1,4,8,7
              db 6,3,1,9,7,2,8,5,4
              db 2,8,5,6,1,4,7,9,3
              db 4,9,7,5,8,3,6,2,1

sudoko_boardE:db 5,0,4,1,0,0,2,0,9
              db 1,2,9,0,5,6,3,0,0
              db 8,6,0,0,2,9,1,7,0
              db 0,4,0,3,6,5,0,1,2
              db 0,1,2,0,4,7,0,3,6
              db 3,5,0,2,9,0,4,0,7
              db 6,3,1,0,7,0,8,0,4
              db 2,8,0,6,1,4,0,9,0
              db 0,9,7,5,8,0,6,0,0


sudoko_boardM:db 0,0,4,1,0,0,0,0,9
              db 1,2,9,0,5,6,3,0,0
              db 8,6,0,0,2,9,1,7,0
              db 0,4,0,3,0,5,0,1,2
              db 0,1,0,0,0,7,0,3,0
              db 3,5,0,2,9,0,4,0,0
              db 6,0,1,0,7,0,8,0,4
              db 2,8,0,0,1,4,0,9,0
              db 0,9,7,5,8,0,0,0,0

sudoko_boardH:db 0,0,4,0,0,0,0,0,9
              db 1,0,9,0,5,0,3,0,0
              db 8,6,0,0,2,9,1,0,0
              db 0,4,0,3,0,5,0,1,0
              db 0,1,0,0,0,0,0,3,0
              db 3,0,0,0,9,0,4,0,0
              db 0,0,1,0,7,0,8,0,4
              db 2,0,0,0,1,4,0,9,0
              db 0,9,7,5,0,0,0,0,0

countforNumbersM: db 2, 4, 5, 4, 5, 6, 5, 5, 3
countforNumbersH: db 3, 7, 5, 4, 6, 8, 7, 7, 3
countforNumbersE: db 2, 2, 4, 3, 4, 2, 4, 5, 3
savescore: dw 0
savemins: dw 0
savesecs: dw 0
savehrs: dw 0
savemsecs: db 0
undo_text: db 'Press e to erase a move ',0
game_text db 'Press g to make a move ',0
notes_text db 'Press n for notes',0
ntext:db 'Press z to erase all notes ',0
hrs:    dw 0
min:    dw 0
s:      dw 0
ms:     dw 0
ticks:  dw   0
seconds: dw   0
minutes: dw   0
rows: db '0'
cols: db '0'
mrows: db '0'
mcolumns: db '0'
numberEntered: db '0'
moveFlag: db '0'
boolforboardnumber: db 0
CountMistake: db 0
scorecount: db 0
valueCalculated: db 0
timerEnabled db 0 ; 0 = timer is displayed, 1 = timer is not displayed
winbool: db 0
gameoverbool:db 0





startclrscr:
    push ES
    push AX
    push DI
    mov ax, 0xb800   
    mov es, ax 
    mov cx, 4000        
    mov di, 0             
    mov al, 0x20       
    mov ah, 0x04       
 startclear_loop:
    mov [es:di], ax 
    add di, 2  
    loop startclear_loop
    pop DI
    pop AX
    pop ES
    ret


print_Starttext11:
    push bp
    mov bp, sp
    push es
    push ax
    push di
    push si
    mov ax, 0xb800
    mov es, ax
    mov ax, [bp+4]          ; DI position (row/col calculation)
    mov di, [bp+6]          ; Get the calculated DI
    mov si, [bp+8]          ; Load string pointer

 print_Startloop11:
    mov al, [si]     
    cmp al, 0               
    je done_Startprinting11
    test di, 2
    jz even_Startposition
    mov ah, 0x0F
    jmp write_to_Startscreen

 even_Startposition:
    mov ah, 0x07

 write_to_Startscreen:
    mov [es:di], ax
    add di, 2 
    call Startdelay 
    inc si 
    loop print_Startloop11 
 done_Startprinting11:
    pop si
    pop di
    pop ax
    pop es
    pop bp
    ret



print_column_shape:
    push ES
    push ax
    push di
    push si
    push cx
    mov ax, 0xb800
    mov es, ax
    xor ax, ax
    mov ah, 0x81 
    mov cx,15
    mov di,10
    l:
      call print_full_column
      add di,20
      loop l
    pop cx
    pop si
    pop di
    pop ax
    pop ES
    ret


print_full_column:
    push si
    push cx
    push ax
    push es
    push di
    mov ax,0xb800
    mov es,ax
    mov si, column_shape
    mov cx, 25  
    mov ah,0x81
  print_loop5:
    mov al, [si]            
    mov [es:di], ax         
    add di, 160             
    loop print_loop5         
    pop di
    pop es
    pop ax
    pop cx
    pop si
    ret


print_Starttext:
    push bp
    mov bp,sp
    push es
    push ax
    push di
    push si
    mov ax, 0xb800         
    mov es, ax
    mov ax,[bp+4]
    mov di,[bp+6]
    mov si,[bp+8]
 print_Startloop:
    mov al, [si]             
    cmp al, 0               
    je done_Startprinting
    mov [es:di], ax         
    add di, 2                
    
   call Startdelay              ; introduce delay for animation effect
   inc si                    ; move to the next character in the string
   loop print_Startloop            ; repeat until cx is exhausted
 done_Startprinting:
    pop si
    pop di
    pop ax
    pop es
    pop bp
    ret

set:
    push ax
    push es
    push di
    push cx
    mov ax, 0xb800
    mov es, ax
    mov di, 0
    mov ax, 0x0E0f  
    mov cx, 2000
    cld
    rep stosw
    pop cx
    pop di
    pop es
    pop ax
    ret

Startdelay:
    push cx
    mov cx, 0x6FFF
    delay_loop:
    dec cx
    jnz delay_loop
    pop cx 
    ret


; Function to generate a beep sound
beep:
    mov ah, 0x0E       ; BIOS function to write character and beep
    mov al, 07h        ; ASCII code for beep (BEL)
    int 10h
    ret

    win:
    mov byte [winbool],1
    pusha
    mov byte [timerEnabled], 1
    call clrscr3
    call border
    mov si, vline7
    push si
    mov di, 2460
    push di
    mov ah, 0x02
    mov al, 0   
    push ax     
    call print_text1

    mov si, vline8
    push si
    mov di, 2776
    push di
    mov ah, 0x02
    mov al, 0   
    push ax     
    call print_text1
    push 2646
    mov ax,[savescore]
    push ax
    call printnum

    mov ax,[savemsecs]
    push ax
    mov ax,[savesecs]
    push ax
    mov ax,[savemins]
    push ax
    mov ax,[savehrs]
    push ax
    add di,28
    push di
    call printTime

    mov si, shape1
    push si
    mov di, 560
    push di
    mov ah, 0x85
    mov al,0   
    push ax     
    call print_text1
    
    mov si, shape1
    push si
    mov di, 840
    push di
    mov ah, 0x85
    mov al,0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 900
    push di
    mov ah, 0x85
    mov al,0   
    push ax     
    call print_text1
    
    mov si, shape1
    push si
    mov di, 2280
    push di
    mov ah, 0x85
    mov al,0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 18580
    push di
    mov ah, 0x85
    mov al,0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 872
    push di
    mov ah, 0x85
    mov al,0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 780
    push di
    mov ah, 0x85
    mov al,0   
    push ax     
    call print_text1
    
    mov si, shape1
    push si
    mov di, 1100
    push di
    mov ah, 0x85
    mov al,0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 640
    push di
    mov ah, 0x85
    mov al,0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 796
    push di
    mov ah, 0x85
    mov al,0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 948
    push di
    mov ah, 0x85
    mov al,0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 326
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 472
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 530
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 720
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 916
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 990
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2300
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2340
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2406
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2552
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2610
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2680
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2724
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di,2876
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2950
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 3150
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 3240
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

 ;lowers

    mov si, shape1
    push si
    mov di, 2246
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2396
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2440
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2460
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2500
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 1540
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2570
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2650
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2750
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2840
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2886
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2960
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 3060
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 3190
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 3250
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 3310
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 3270
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1


 ;more up 


    mov si, shape1
    push si
    mov di, 328
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 380
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 250
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 580
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 650
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 760
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2250
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2396
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2440
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2460
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2500
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2540
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2570
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2650
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2750
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2840
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2886
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 2960
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 3060
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 3190
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 3250
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 3310
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1

    mov si, shape1
    push si
    mov di, 3270
    push di
    mov ah, 0x85
    mov al, 0   
    push ax     
    call print_text1


  call border

    mov si, vline1
    push si
    mov di, 1284
    push di
    mov ah, 0x0E
    mov al,0   
    push ax     
    call print_text11
  
    mov si, vline2
    push si
    mov di, 1444
    push di
    mov ah, 0x0E
    mov al,0   
    push ax     
    call print_text11
  
    mov si, vline3
    push si
    mov di, 1604
    push di
    mov ah, 0x0E
    mov al,0   
    push ax     
    call print_text11

    mov si, vline4
    push si
    mov di,  1764
    push di
    mov ah, 0x0E
    mov al,0   
    push ax    
    call print_text11
   
    mov si, vline5
    push si
    mov di, 1924
    push di
    mov ah, 0x0E
    mov al,0   
    push ax     
    call print_text11
     
    
    mov si, vline1
    push si
    mov di, 1284
    push di
    mov ah, 0x02
    mov al,0   
    push ax     
    call print_text2
  

    mov si, vline2
    push si
    mov di,  1444
    push di
    mov ah, 0x02
    mov al,0   
    push ax     
    call print_text2
  
    mov si, vline3
    push si
    mov di, 1604
    push di
    mov ah, 0x02
    mov al,0   
    push ax     
    call print_text2
   

    mov si, vline4
    push si
    mov di,  1764
    push di
    mov ah, 0x02
    mov al,0   
    push ax    
    call print_text2
   
    mov si, vline5
    push si
    mov di, 1924
    push di
    mov ah, 0x02
    mov al,0   
    push ax     
    call print_text2
    popa
    ret

print_text2:
    push bp
    mov bp,sp
    push es
    push ax
    push di
    push si
    mov ax, 0xb800         
    mov es, ax
    mov ax,[bp+4]
    mov di,[bp+6]
    mov si,[bp+8]
 print_loop2:
    mov al, [si]             
    cmp al, 0               
    je done_printing2
    mov [es:di], ax         
    add di, 2                
    call delay2      
    inc si           
    loop print_loop2 
 done_printing2:
    pop si
    pop di
    pop ax
    pop es
    pop bp
    ret

print_text1:
    push bp
    mov bp,sp
    push es
    push ax
    push di
    push si
    mov ax, 0xb800         
    mov es, ax
    mov ax,[bp+4]
    mov di,[bp+6]
    mov si,[bp+8]
 print_loop1:
    mov al, [si]             
    cmp al, 0               
    je done_printing1
    mov [es:di], ax         
    add di, 2                
    inc si                  
    jmp print_loop1
 done_printing1:
    pop si
    pop di
    pop ax
    pop es
    pop bp
    ret

clrscr:
    push ES
    push AX
    push DI
    mov ax, 0xb800      
    mov es, ax
    mov cx, 4000      
    mov di, 0       
    mov al, 0x20    
    mov ah, 0x71   
 clear_loop:
    mov [es:di], ax
    add di, 2      
    loop clear_loop
    pop DI
    pop AX
    pop ES
    ret

EraseAllNotes:
    push ax
    push bx
    push si
    push cx

   mov ax, 0xb800
   mov es, ax
   mov si, 0
   mov cx, 10
   mov si, notesDI
   mov ax, 0x7120
   loopSpace:
   mov di, [si]
   mov [es:di], ax
   add si, 2
   loop loopSpace   


    mov si, 0
    mov cx, 10
    mov si, notesDI
    mov bx, notesVals

    eraseLoop:
        mov word[si], 0
         mov byte[bx], 0
        add bx, 1
        add si, 2
        loop eraseLoop


    pop cx
    pop si
    pop bx
    pop ax
    ret


clrscr2:
    
    push es
    push ax
    push di
    push cx
    mov ax, 0xb800         ; Video memory base
    mov es, ax
    xor di, di             ; Ensure DI starts at 0
    mov cx, 2000           ; 80 * 25 = 2000 (number of characters on the screen)
    mov al, 0x20           ; Space character
    mov ah, 0x07           ; Standard attribute (white text on black background)
 clear_loop2:
    mov [es:di], ax        ; Write space with attribute
    add di, 2              ; Move to next character position
    loop clear_loop2
    pop cx
    pop di
    pop ax
    pop es
    ret

clrscr3:
    push ES
    push AX
    push DI
    mov ax, 0xb800       
    mov es, ax
    mov cx, 2000     
    mov di, 0         
    mov al, 0x20   
    mov ah, 0x02      
 clear_loop3:
    mov [es:di], ax   
    add di, 2          
    loop clear_loop3
    pop DI
    pop AX
    pop ES
    ret

draw_char:
   pusha
    mov bx, 0xB800     
    mov es, bx         
    mov di, dx        
    shl di, 1        
    mov word [es:di],0x042A
    popa
    ret

delay2:
    push cx
    mov cx, 0xfffe 
 delay_loop2:
    
    loop delay_loop2
    pop cx
    ret

border:
    pusha
    mov ax,0xb800
    mov es,ax
    xor di,di
    mov cx,80
    mov ah,0x04
    mov al,0xDB
    borderloop:
    mov [es:di],ax
    add di,2
    loop borderloop

    mov di,0
    mov cx,25
    borderloop2:
    mov [es:di],ax
    add di,160
    loop borderloop2

    mov cx,80
    mov di,3840
    borderloop3:
    mov [es:di],ax
    add di,2
    loop borderloop3

    mov di,158
    mov cx,25
    borderloop4:
    mov [es:di],ax
    add di,160
    loop borderloop4
    popa
    ret

print_text11:
    push bp
    mov bp, sp
    push es
    push ax
    push di
    push si
    mov ax, 0xb800          
    mov es, ax
    mov ax, [bp+4]          
    mov di, [bp+6]          
    mov si, [bp+8]          

 print_loop11:
    mov al, [si]            
    cmp al, 0               
    je done_printing11

    test di, 2             
    jz even_position        

    
    mov ah, 0x04            
    jmp write_to_screen

 even_position:
   
    mov ah, 0x84            

 write_to_screen:
    mov [es:di], ax        
    add di, 2               
    inc si                 
    jmp print_loop11        

 done_printing11:
    pop si
    pop di
    pop ax
    pop es
    pop bp
    ret 6

gameOver:
    mov byte [gameoverbool],1
    pusha
    mov byte [timerEnabled], 1 ; Disable the timer display
    call clrscr2
    call delay2
 
    mov si, line1
    push si
    mov di,  1124
    push di
    mov ah, 0x0E
    mov al,0   
    push ax     
    call print_text11

    mov si, line2
   push si
    mov di,  1284  
    push di
    mov ah, 0x0E
    mov al,0   
    push ax     
    call print_text11

    mov si, line3
    push si
    mov di,  1444 
    push di
    mov ah, 0x0E
    mov al,0   
    push ax     
    call print_text11

    mov si, line4
    push si
    mov di,  1604
    push di
    mov ah, 0x0E
    mov al,0   
    push ax    
    call print_text11

    mov si, line5
    push si
    mov di,  1764
    push di
    mov ah, 0x0E
    mov al,0   
    push ax     
    call print_text11

    mov bx, 4

    mov cx,1120       
    shl cx, 0

    mov si, line6
    mov di, bx
    add di, 800 
    add di,cx           
    push si
    push di
    push ax
    call print_text

    mov si, line7
    mov di, 62
    add di, 960  
    add di,cx          
    push si
    push di
    mov ah,0x04
    push ax
    call print_text
    
    mov si, line8
    mov di, 60
    add di, 1120 
    add di,cx          
    push si
    push di
    push ax
    call print_text
    call border
    push 2166
    mov ax,[savescore]
    push ax
    call printnum

    mov ax,[savemsecs]
    push ax
    mov ax,[savesecs]
    push ax
    mov ax,[savemins]
    push ax
    mov ax,[savehrs]
    push ax
    add di,28
    push di
    call printTime

    mov dx, 0              
    mov cx, 2000          
 main_loop2:
    call draw_char    
    call delay2         
    inc dx           
    cmp dx, cx         
    jne main_loop2    
    popa
    ret 

    printNumSingleDigit:     
    push bp 
    mov  bp, sp 
    push es 
    push ax 
    push bx 
    push cx 
    push dx 
    push di 

    mov ax, 0xb800
    mov es, ax
    xor ax, ax
    mov di, [bp+6]      
    mov ax, [bp+4]     
    mov  bl, 10 
    div  bl             
    add  ah, 0x30       
    mov  dl, ah  
    cmp dl, 48
    jne spaceskip 
    mov dl,32
    spaceskip:
      mov  dh, 0x71   
      mov  [es:di], dx                       
    
    pop  di 
    pop  dx 
    pop  cx 
    pop  bx 
    pop  ax 
    pop  es 
    pop  bp 
    ret  4


printValues:
    push bp 
    mov  bp, sp 
    push es 
    push ax 
    push bx 
    push cx 
    push dx 
    push di 

    mov ax, 0xB800   
    mov es, ax

    mov di, [bp+4]          ; Row number
    mov cx, [bp+6]         ; Column number
    mov bx, 80          ; Number of columns per row
    mul bx              ; Row * 80
    add di, cx          ; Add column
    shl di, 1           
    mov bx,[bp+8]        ; number
    push di
    push bx
    call printNumSingleDigit
    
    mov ah, 0x07        
    mov [es:di], ax     

    pop  di 
    pop  dx 
    pop  cx 
    pop  bx 
    pop  ax 
    pop  es 
    pop  bp 
    ret  8

Updatevalues:
    push ax
    push bx 
    mov ax, 0
    mov bx, 0
    mov al, [moveFlag]
    sub al, 0x30
    cmp al, 1       ;is move valid or not
    je ValidMove
    cmp al,0
    jne exit 
notValidMove:
    call beep
    mov al, [CountMistake]
    inc al
    mov byte [CountMistake], al
    mov bl, [numberEntered]
    sub bl, 0x30          ; Convert ASCII to numeric
    sub bl, 1             ; bl = numberEntered - 1
    mov ax, 0
    cmp byte [boolforboardnumber],0x31
    je exit

    mov ax, 0
    cmp byte [level], 'a'
    je CountForEasy

    cmp byte [level], 'b'
    je CountForMedium

    cmp byte [level], 'c'
    je CountForHard

CountForEasy:
    mov al, [countforNumbersE + bx]
    sub al, 1             ; Decrement the count for that number
    mov byte [countforNumbersE + bx], al
    jmp exit
CountForMedium:
    mov al, [countforNumbersM + bx]
    sub al, 1             ; Decrement the count for that number
    mov byte [countforNumbersM + bx], al
    jmp exit
CountForHard:
    mov al, [countforNumbersH + bx]
    sub al, 1             ; Decrement the count for that number
    mov byte [countforNumbersH + bx], al
    jmp exit

ValidMove:
    mov bl, [numberEntered]
    sub bl, 0x30
    sub bl, 1
    mov ax, 0
    cmp byte [level], 'a'
    je CountForEasy1

    cmp byte [level], 'b'
    je CountForMedium1

    cmp byte [level], 'c'
    je CountForHard1

CountForEasy1:
    mov al, [countforNumbersE + bx]
    sub al, 1             ; Decrement the count for that number
    mov byte [countforNumbersE + bx], al
    jmp StoringCount
CountForMedium1:
    mov al, [countforNumbersM + bx]
    sub al, 1             ; Decrement the count for that number
    mov byte [countforNumbersM + bx], al
    jmp StoringCount
CountForHard1:
    mov al, [countforNumbersH + bx]
    sub al, 1             ; Decrement the count for that number
    mov byte [countforNumbersH + bx], al
    jmp StoringCount

StoringCount:
    mov al, [scorecount]
    add al, 2
    mov byte[scorecount], al
 exit:
    pop bx
    pop ax
    ret

printstr:   
    push bp
            mov bp, sp
            pusha
            push es
            mov ax, 0xb800
            mov es, ax
            mov di, [bp+4]              ; Location
            mov ax, [bp+6]              ; Number
            mov bx, 10
            mov cx, 0
 next_digit:  mov dx, 0
            div bx
            add dl, 0x30
            push dx
            inc cx
            cmp ax, 0
            jnz next_digit
            cmp cx, 1
            jnz next_pos
            mov al,'0'
            cmp byte [winbool],1
            je print1
            cmp byte [gameoverbool],1
            jne print
            print1:
            mov ah,0x04
            jmp print3 
            print:
            mov ah,0x71
            print3:
            mov  [es:di], ax
            add di, 2
 next_pos:    pop dx
            cmp byte [winbool],1
            je printit3
            cmp byte [gameoverbool],1
            jne printit 
            printit3:
            mov dh,0x04
            jmp printit2
            printit:
            mov dh, 0x71
            printit2:
            mov [es:di], dx
            add di, 2
            loop next_pos
            pop es
            popa
            pop bp
            ret 4


;Print the entire time (HRS:MIN:S) at a specific location
printTime:  
    push bp
            mov bp, sp
            push ax
            push es
            push di

            mov ax, 0xB800
            mov es, ax
            mov di, [bp+4]              ; Location
            push word [bp+6]            ; Hours
            add di, 2
            push di
            call printstr
            add di, 2
            mov al,':'
            cmp byte [winbool],1
            je colon
            cmp byte [gameoverbool],1
            jne colon2
            colon:
            mov ah,0x04
            jmp colon3
            colon2:
            mov ah,0x71
            colon3:
            mov  [es:di], ax
            push word [bp+8]            ; Minutes
            add di, 4
            push di
            call printstr
            add di, 4
            mov al,':'
            cmp byte [winbool],1
            je colon4
            cmp byte [gameoverbool],1
            jne colon5
            colon4:
            mov ah,0x04
            jmp colon6
            colon5:
            mov ah,0x71
            colon6:
            mov [es:di], ax
            push word [bp+10]           ; Seconds
            add di, 2
            push di
            call printstr
            pop di
            pop es
            pop ax
            pop bp
            ret 10


;Stopwatch timer functionality
stopWatch:
    pusha
    push es
        mov bx,[cs:hrs]
 mov [savehrs],bx
 mov bx,[cs:min]
 mov [savemins],bx
  mov bx,[cs:ms]
 mov [savemsecs],bx
  mov bx,[cs:s]
 mov [savesecs],bx
    mov al, [timerEnabled]
    cmp al, 1
    je skip_display ; Skip the timer display 


 dis:
    push word [cs:ms]
    push word [cs:s]
    push word [cs:min]
    push word [cs:hrs]
    push 1100
    call printTime

 skip_display:
    add word [cs:ms], 55
    cmp word [cs:ms], 1000
    jle modCheck
    mov word [cs:ms], 0
    inc word [cs:s]
    cmp word [cs:s], 60
    jnz modCheck
    mov word [cs:s], 0
    inc word [cs:min]
    cmp word [cs:min], 60
    jnz modCheck
    mov word [cs:min], 0
    inc word [cs:hrs]

 modCheck:

    mov al, 0x20
    out 0x20, al

    pop es
    popa
    iret

; subroutine to print a two digit
printnum:     
    push bp 
    mov  bp, sp 
    push es 
    push ax 
    push bx 
    push cx 
    push dx 
    push di 
    push si
              mov di, [bp + 6]        ; get display position
              mov  ax, [bp+4]         ; get number to print
              mov  bl, 10 
              div  bl                 ; divide by 10
              
              add  al, 0x30          ; convert tens place to ASCII
              add  ah, 0x30          ; convert ones place to ASCII
              
              mov  dl, al            ; first store tens digit
              cmp byte [winbool],1
              je nexta
              cmp byte [gameoverbool],1
              jne nextb
              nexta:
              mov dh,0x04
              jmp nextc
              nextb:
              mov  dh, 0x71          ; normal attribute
              nextc:
              mov  [es:di], dx        
              add  di, 2             
              
              mov  dl, ah            ; then store ones digit
              mov  [es:di], dx       
              pop si
              pop  di 
              pop  dx 
              pop  cx 
              pop  bx 
              pop  ax 
              pop  es 
              pop  bp 
              ret  4


print_spaces:
    push ES
    push AX
    push DI
    push cx
    mov ax,0xb800
    mov es,ax
    mov di,484
    mov ax,0x7120
    mov [es:di], ax 
    add di,8
    mov [es:di], ax
    add di,24
    mov [es:di], ax
    mov cx,4
row1clear:
    mov [es:di], ax
    add di,8
    loop row1clear
    mov di,1148
    mov [es:di], ax
    add di,32
    mov cx,2
row2clear:
    mov [es:di], ax
    add di,8
    loop row2clear
    mov di,1764
    mov [es:di], ax
    add di,16
    mov cx,2
row3clear:
    mov [es:di], ax
    add di,8
    loop row3clear
    add di,32
    mov [es:di], ax
    mov di,2404
    mov cx,4
row4clear:
    mov [es:di], ax
    add di,16
    loop row4clear
    mov di,3044
    mov [es:di], ax
    add di,16
    mov cx,3
row5clear:
    mov [es:di], ax
    add di,8
    loop row5clear
    add di,8
    mov cx,2
row5clear2:
    mov [es:di], ax
    add di,16
    loop row5clear2
    mov di,3684
    add di,16
    mov cx,2
row6clear:
    mov [es:di], ax
    add di,24
    loop row6clear
    mov cx,2
    sub di,24
    add di,16
row6clear2:
    mov [es:di], ax
    add di,8
    loop row6clear2  
    mov di,4324
    add di,8
    mov cx,4
row7clear:
    mov [es:di], ax
    add di,16
    loop row7clear
    mov di,4964
    add di,16
    mov cx,2
row8clear:
    mov [es:di], ax
    add di,8
    loop row8clear
    mov cx,2
    add di,16
row8clear2:
    mov [es:di], ax
    add di,16
    loop row8clear2
    mov di,5604
    mov [es:di], ax
    mov cx,4
    add di,40
row9clear:
    mov [es:di], ax
    add di,8
    loop row9clear
    pop cx
    pop DI
    pop AX
    pop ES
    ret



notesmovement:
    push ax
    push bx
    push dx
    push si
    xor bx, bx
    mov bl, [rows]
    sub bl, 0x30
    sub bl , 1
    mov ax, 0
    mov al, 9
    mul bl

    mov si, ax
    
    xor bx, bx
    mov bl, [cols]
    sub bl, 0x30
    sub bl, 1
    xor ax,ax
    cmp byte [level], 'a'
    je EasyNotes

    cmp byte [level], 'b'
    je MediumNotes
    
    cmp byte [level], 'c'
    je HardNotes
    

    EasyNotes:
    mov al, [sudoko_boardE+si+bx]
    jmp movingOn

    MediumNotes:
    mov al, [sudoko_boardM+si+bx]
    jmp movingOn

    HardNotes:
    mov al, [sudoko_boardH+si+bx]
    jmp movingOn

    movingOn:
    cmp al, 0
    jne e

    xor ax,ax
    xor bx,bx
    mov ax,640
    mov bx, [rows]
    mov bh, 0
    sub bx, 0x30
    sub bx, 1
    mul bx

    mov di, 484
    add di, ax
    mov bx, 0
    mov ax, 0
    mov al, 8
    mov bl, [cols]
    sub bl, 0x30
    sub bl, 1
    mul bl

    add di, ax

    xor ax, ax
    mov al, [numberEntered]
    sub al, 0x30
    cmp al, 1
    je notesfor1
    cmp al, 2
    je notesfor2
    cmp al, 3
    je notesfor3
    cmp al, 4
    je notesfor4
    cmp al, 5
    je notesfor5
    cmp al, 6
    je notesfor6
    cmp al, 7
    je notesfor7
    cmp al, 8
    je notesfor8
    cmp al, 9
    je notesfor9

notesfor1:
    sub di, 162
    jmp PrintNote

notesfor2:
    sub di, 160
    jmp PrintNote

notesfor3:
    sub di,158
    jmp PrintNote

notesfor4:
    sub di,2
    jmp PrintNote

notesfor5:
    jmp PrintNote

notesfor6:
    add di,2
    jmp PrintNote

notesfor7:
    add di,158
    jmp PrintNote

notesfor8:
    add di,160
    jmp PrintNote

notesfor9:
    add di,162
    jmp PrintNote

PrintNote:
    xor si,si
    mov si,notesDI
    mov cx,10
    xor bx,bx
    indexing:
        cmp byte[si],0
        je foundatDI
        add si,2
        inc bx
        loop indexing

foundatDI:
    mov [si],di
    mov al,[numberEntered]
    sub al,0x30
    mov byte [notesVals+bx],al

e:  
    pop si
    pop dx
    pop bx
    pop ax
    ret



erasemovement:
    push ax
    push bx
    push dx
    push si

    xor bx, bx
    mov bl, [rows]
    sub bl, 0x30
    sub bl , 1
    mov ax, 0
    mov al, 9
    mul bl

    mov si, ax
    
    xor bx, bx
    mov bl, [cols]
    sub bl, 0x30
    sub bl, 1

    mov al, byte[level]
    cmp al, 'a'
    je checkEasy
    cmp al, 'b'
    je checkMedium
    cmp al, 'c'
    je checkHard
checkEasy:
    mov al, [sudoko_boardE+si+bx]
    cmp al,0
    je exitFunction2
    mov byte [eraseflag],al
    mov al,0
    mov [sudoko_boardE+si+bx],al
    mov al,[eraseflag]
    sub al,1
    mov ah,0
    mov bx,ax
    mov al,[countforNumbersE+bx]
    add ax,1
    mov [countforNumbersE+bx],al
    jmp exitFunction2
checkMedium:
    mov al, [sudoko_boardM+si+bx]
    cmp al,0
    je exitFunction2
    mov byte [eraseflag],al
    mov al,0
    mov [sudoko_boardM+si+bx],al
    mov al,[eraseflag]
    sub al,1
    mov ah,0
    mov bx,ax
    mov al,[countforNumbersM+bx]
    add ax,1
    mov [countforNumbersM+bx],al
    jmp exitFunction2
checkHard:
    mov al, [sudoko_boardH+si+bx]
    cmp al,0
    je exitFunction2
    mov byte [eraseflag],al
    mov al,0
    mov [sudoko_boardH+si+bx],al
    mov al,[eraseflag]
    sub al,1
    mov ah,0
    mov bx,ax
    mov al,[countforNumbersH+bx]
    add ax,1
    mov [countforNumbersH+bx],al
    jmp exitFunction2
exitFunction2:
    pop si
    pop dx
    pop bx
    pop ax
    ret

isValidMove:
    push ax
    push bx
    push dx
    push si

    xor bx, bx
    mov bl, [rows]
    sub bl, 0x30
    sub bl , 1
    mov ax, 0
    mov al, 9
    mul bl

    mov si, ax
    
    xor bx, bx
    mov bl, [cols]
    sub bl, 0x30
    sub bl, 1

    mov al, [answerBoard+si+bx]
    mov byte [valueCalculated], al

    cmp byte[level], 'a'
    je EasyMode

    cmp byte[level], 'b'
    je MediumMode

    cmp byte[level], 'c'
    je HardMode

    EasyMode:
    mov al, [sudoko_boardE+si+bx]
    cmp al, 0
    jne nomove

    xor ax, ax
    mov al, [numberEntered]
    sub al, 0x30
    mov dl, al
    mov [sudoko_boardE+si+bx],dl
    jmp selectLoop
    
    MediumMode:
    mov al, [sudoko_boardM+si+bx]
    cmp al, 0
    jne nomove

    xor ax, ax
    mov al, [numberEntered]
    sub al, 0x30
    mov dl, al
    mov [sudoko_boardM+si+bx],dl
    jmp selectLoop
   
    HardMode:
    mov al, [sudoko_boardH+si+bx]
    cmp al, 0
    jne nomove

    xor ax, ax
    mov al, [numberEntered]
    sub al, 0x30
    mov dl, al
    mov [sudoko_boardH+si+bx],dl
    jmp selectLoop

selectLoop:
    mov ah, byte [valueCalculated]
    cmp ah, al
    jne setZero
    mov byte[moveFlag], '1'
    jmp exitFunction
    setZero:
    mov byte[moveFlag], '0'
    jmp exitFunction
nomove:
    mov byte[moveFlag],'2'
    exitFunction:
    pop si
    pop dx
    pop bx
    pop ax
    ret

scrollup:
    push bp
    mov bp, sp
    push ax
    push cx
    push si
    push di
    push es
    push ds
    cld
    xor si, si
    mov ax, 0xb800
    mov es, ax
    mov ds, ax
    mov di, 12000
    mov cx, 2000
    rep movsw
    mov cx,2000
    mov di,0
    mov si, 4000
    rep movsw
    pop ds
    pop es
    pop di
    pop si
    pop cx
    pop ax
    pop bp
    ret 

scrolldown:
    push bp
    mov bp, sp
    push ax
    push cx
    push si
    push di
    push es
    push ds
    mov ax, 2000
    shl ax, 1
    mov si, 3998
    ;add si, ax
    mov cx, 2000
    shr ax,1
    sub cx, ax
    mov ax, 0xb800
    mov es, ax
    mov ds, ax
    mov di, 7998
    std
    rep movsw
    mov cx,2000
    mov di,3998
    mov si,15998
    rep movsw
    pop ds
    pop es
    pop di
    pop si
    pop cx
    pop ax
    pop bp
    ret

; Subroutine to print text at a specific location
print_text:
    push bp
    mov bp,sp
    push es
    push ax
    push di
    push si
    mov ax, 0xb800         
    mov es, ax
    mov ax,[bp+4]
    mov di,[bp+6]
    mov si,[bp+8]
print_loop:
    mov al, [si]             
    cmp al, 0               
    je done_printing
    mov [es:di], ax         
    add di, 2                
    inc si                  
    jmp print_loop

done_printing:
    pop si
    pop di
    pop ax
    pop es
    pop bp
    ret

upperBoundary:
    push bp
    mov bp,sp
    push ES
    push AX
    push DI
    push CX
    push DX
    mov ax, 0xb800         
    mov es, ax
    mov cx, 8     
    mov di, [bp+4]              
    mov al, 0xC9           
    mov ah, 0x71          
    mov [es:di], ax 
    add di,2
    mov dx,3
    loop1: 
    mov al, 0xCD; 205-
    mov ah,0x71
    mov [es:di], ax
    add di,2
    mov al, 0xCD; 205-
    mov ah,0x71
    mov [es:di], ax
    add di,2
    mov al, 0xCD; 205-
    mov ah,0x71
    mov [es:di], ax
    add di,2
    mov al, 203; 203
    mov ah,0x71
    mov [es:di], ax
    add di,2
   loop loop1
   loop2:
    mov al, 0xCD; 205-
    mov ah,0x71
    mov [es:di], ax
    add di,2
    dec dx
    cmp dx,0
    jnz loop2
    mov al, 187; 187
    mov ah,0x71
    mov [es:di], ax
    add di,2
    pop DX
    pop CX
    pop DI
    pop AX
    pop ES 
    pop bp      
    ret  2                 
verticalLines:
    push bp
    mov bp,sp
    push ES
    push AX
    push DI
    push CX
    push DX
    mov ax, 0xb800         
    mov es, ax
    mov bx,1
loop3:
   mov al,160
    mov ah,0
    mov cx,9
    mul bx
    mov di, [bp+4]
    add di,ax
    mov ah,0x71
    mov al,186
    mov [es:di], ax
    add di,2
    mov dx,3
loop4:
   mov ah,0x71
    mov al,255
    mov [es:di], ax 
    add di,2
    mov ah,0x71
    mov al,255
    mov [es:di], ax 
    add di,2
    mov ah,0x71
    mov al,255
    mov [es:di], ax 
    add di,2
    mov al,186
    mov [es:di], ax
    add di,2
    loop loop4
    add bx, 1
    cmp bx, 4
    jl loop3
    pop DX
    pop CX
    pop DI
    pop AX
    pop ES
    pop BP       
    ret 2
horixontalLines:
    push bp
    mov bp,sp
    push ES
    push AX
    push DI
    push CX
    push DX
    mov cx,8
    mov ax, 0xb800         
    mov es, ax
    mov di, [bp+4]
    mov ah,0x71
    mov al,204
    mov [es:di], ax 
    add di,2 
    mov dx,3
    loop5: 
    mov al, 0xCD; 205-
    mov ah,0x71
    mov [es:di], ax
    add di,2
    mov al, 205; 205-
    mov ah,0x71
    mov [es:di], ax
    add di,2
    mov al, 0xCD; 205-
    mov ah,0x71
    mov [es:di], ax
    add di,2
    mov al, 206; 203
    mov ah,0x71
    mov [es:di], ax
    add di,2
   loop loop5
   loop6:
    mov al, 0xCD; 205-
    mov ah,0x71
    mov [es:di], ax
    add di,2
    dec dx
    cmp dx,0
    jnz loop6
    mov al, 185; 185
    mov ah,0x71
    mov [es:di], ax
    add di,2
    pop DX
    pop CX
    pop DI
    pop AX
    pop ES
    pop BP       ; Write bottom-right corner
    ret 2
lowerBoundary:
    push bp
    mov bp,sp
    push ES
    push AX
    push DI
    push CX
    push DX
    mov ax, 0xb800         
    mov es, ax
    mov cx, 8     
    mov di, [bp+4]              
    mov al, 0xC8           
    mov ah, 0x71          
    mov [es:di], ax 
    add di,2
    mov dx,3
    lowerloop1: 
    mov al, 0xCD; 205-
    mov ah,0x71
    mov [es:di], ax
    add di,2
    mov al, 0xCD; 205-
    mov ah,0x71
    mov [es:di], ax
    add di,2
    mov al, 0xCD; 205-
    mov ah,0x71
    mov [es:di], ax
    add di,2
    mov al, 202; 202
    mov ah,0x71
    mov [es:di], ax
    add di,2
   loop lowerloop1
   lowerloop2:
    mov al, 0xCD; 205-
    mov ah,0x71
    mov [es:di], ax
    add di,2
    dec dx
    cmp dx,0
    jnz lowerloop2
    mov al, 188; 188
    mov ah,0x71
    mov [es:di], ax
    add di,2
    pop DX
    pop CX
    pop DI
    pop AX
    pop ES       
    pop bp
    ret 2       

lowernumbers:
    push es
    push di
    push ax
    push cx
    mov ax,0xb800
    mov es,ax
    mov ah,0x17
    mov si,6724
    mov di,si
    mov al,0x31
    mov cx,9

    mov ah,0x17
    mov di,si
    add di,320
    mov al,0x31
    mov cx,9
 cardsb:
    mov [es:di],ax
    inc al
    add di,8
    loop cardsb
    pop cx
    pop ax
    pop di
    pop es 
    ret

;fillboard
InitialiseBoard:
    push bp
    mov bp, sp
    sub sp, 2
    push es
    push di
    push ax
    push si
    push cx
    push dx
    push bx

    mov ax, 0xb800
    mov es, ax
    xor ax, ax
    mov word [bp - 2], 9
    mov di, 484
    mov bx, 0
    cmp byte [level], 'a'
    je easyLevel

    cmp byte [level], 'b'
    je mediumLevel
    
    cmp byte [level], 'c'
    je hardLevel 

    easyLevel:
        mov si, sudoko_boardE
        jmp OuterloopFilling
    mediumLevel:
        mov si, sudoko_boardM
        jmp OuterloopFilling
    hardLevel:
        mov si, sudoko_boardH
        jmp OuterloopFilling

    OuterloopFilling:
        mov dx, di ;stores di initial val
        mov cx, 9
        innerloopFilling:
            push di
            add di, 8
            mov al, [si+ bx]
            push ax
            call printNumSingleDigit
            inc bx
            loop innerloopFilling
        mov di, dx
        add di, 640
        sub word [bp - 2], 1
        cmp word [bp - 2], 0
        jne OuterloopFilling
    
    xor si,si
    mov cx,10
    xor bx,bx
    mov si,notesDI
    mov ax, 0xb800
    mov es, ax
    mov ax,0
check1:
    cmp word[si],0
    je exit3
    mov di,[si]
    mov al,[notesVals+bx] 
    add ax,0x30
    mov ah, 0x72
    mov [es:di],ax
    inc bx
    add si,2 
    loop check1

exit3:
    pop bx
    pop dx
    pop cx
    pop si
    pop ax
    pop di
    pop es
    mov sp, bp
    pop bp
    ret


counterTiles:
    push es
    push di
    push ax
    push si
    push cx
    push dx
    push bx

    mov ax, 0xb800
    mov es, ax
    xor ax, ax
    mov di, 6724
    mov bx, 0
    mov cx, 9
    cmp byte [level], 'a'
    je setFillingTilesCount1

    cmp byte [level], 'b'
    je setFillingTilesCount2
    
    cmp byte [level], 'c'
    je setFillingTilesCount3

    setFillingTilesCount1:
        mov si, countforNumbersE
        jmp Filling

    setFillingTilesCount2:
        mov si, countforNumbersM
        jmp Filling

    setFillingTilesCount3:
        mov si, countforNumbersH
        jmp Filling

Filling:
    push di
    add di, 8
    mov al, [si + bx]
    push ax
    call printNumSingleDigit
    inc bx
    loop Filling
      

    pop bx
    pop dx
    pop cx
    pop si
    pop ax
    pop di
    pop es
    ret  
checkwin:
    pusha
    mov bx, 0
      mov cx, 9
      cmp byte[level], 'a'
je NotLoseEasy

cmp byte[level], 'b'
je NotLoseEasy2

cmp byte[level], 'c'
je NotLoseEasy3

NotLoseEasy:
    mov si, countforNumbersE
    jmp myLoop

NotLoseEasy2:
    mov si, countforNumbersM
    jmp myLoop

NotLoseEasy3:
    mov si, countforNumbersH
    jmp myLoop
      myLoop:
      mov al, [si+bx]
      cmp al, 0
      jne skipit
      add bx, 1
      loop myLoop

   mov byte[winbool], 1 
    call win
   skipit:
    popa
    ret

start:

    call startclrscr
    call print_column_shape  

    mov si, name
    push si
    mov di,3886
    push di
    mov ah, 0x07
    mov al,0   
    push ax     
    call print_Starttext

    mov si, instruction1
    push si
    mov di,2768
    push di
    mov ah, 0x97
    mov al,0   
    push ax     
    call print_Starttext

    mov si, instruction2
    push si
    mov di,3088
    push di
    mov ah, 0x97
    mov al,0   
    push ax     
    call print_Starttext

    mov si, instruction3
    push si
    mov di,3408
    push di
    mov ah, 0x97
    mov al,0   
    push ax     
    call print_Starttext

    mov si, l1
    push si
    mov di, 1450
    push di
    mov ah, 0x0E
    mov al,0   
    push ax     
    call print_Starttext11
  

    mov si, l2
    push si
    mov di,1610
    push di
    mov ah, 0x0E
    mov al,0   
    push ax     
    call print_Starttext11
  
    mov si, l3
    push si
    mov di, 1770
    push di
    mov ah, 0x0E
    mov al,0   
    push ax     
    call print_Starttext11
   

    mov si, l4
    push si
    mov di, 1930
    push di
    mov ah, 0x0E
    mov al,0   
    push ax    
    call print_Starttext11
   
    mov si, l5
    push si
    mov di, 2090
    push di
    mov ah, 0x0E
    mov al,0   
    push ax     
    call print_Starttext11

    mov si, l1
    push si
    mov di, 1450
    push di
    mov ah, 0x09
    mov al,0   
    push ax     
    call print_Starttext
  

    mov si, l2
    push si
    mov di, 1610
    push di
    mov ah, 0x09
    mov al,0   
    push ax     
    call print_Starttext
  
    mov si, l3
    push si
    mov di, 1770
    push di
    mov ah, 0x09
    mov al,0   
    push ax     
    call print_Starttext
   

    mov si, l4
    push si
    mov di, 1930
    push di
    mov ah, 0x09
    mov al,0   
    push ax    
    call print_Starttext
   
    mov si, l5
    push si
    mov di, 2090
    push di
    mov ah, 0x09
    mov al,0   
    push ax     
    call print_Starttext

    ; xor dx, dx
    ; mov ah, 0
    ; int 16h
    ; mov dl, al
    ; mov bl, ah
    ; cmp bl, 0x2    ;easy
    ; je main_loop
    ; cmp bl, 0x3  ;medium
    ; je main_loop
    ; cmp bl, 0x4   ;hard
    ; je main_loop


main_loop:

    mov ax, 0xb800
    mov es, ax

    mov di,1058
    push di
    mov ax,0
    mov al, byte [CountMistake]
    cmp al, 3          ; Check if CountMistake equals 3
    
    je gameOver        ; If yes, jump to gameOver
    push ax
    call printNumSingleDigit
    mov di, 1566
    push di
    mov ax, 0
    mov al,[scorecount]
    push ax
    call printnum


    ; mov ax, 0
    ; int 16h  
    ; cmp ah, 0x1C
    ; je printGame  
    xor dx, dx
    mov ax, 0
    int 16h
    mov dl, al
    mov bl, ah
    cmp ah, 0x1E    ;easy
    je printGame
    cmp ah, 0x30  ;medium
    je printGame
    cmp ah, 0x2E   ;hard
    je printGame
   cmp ah, 0X2C
    je eraseAll
    cmp ah, 0x50                
    je scrolluplogic  
    cmp ah, 0x48
    je scrolldownlogic 
    cmp ah, 0x31  
    je inputNotes
    cmp ah, 0x22    
    je inputNumber 
    cmp ah,  0x12
    je inputerase

    jmp main_loop




printGame:
   call clrscr
    ; Hook the timer interrupt
    mov ax, 0
    mov es, ax
    cli                      ; Disable interrupts
    mov word [es:8*4], stopWatch  ; Set timer interrupt vector to stopWatch
    mov word [es:8*4+2], cs       ; Set the code segment for the interrupt
    sti                      ; Enable interrupts

    mov [level], dl

    mov si, sudoko
    push si
    mov di,  420  ;row 0, center  80 columns
    push di
    mov ah, 0x71
    mov al,0   
    push ax     
    call print_text
    
    mov si, mistakes
    push si
    mov di, 1040     
    push di
    mov ah, 0x71
    push ax             
    call print_text

    mov si, mistakes
    push si
    mov di, 5040     
    push di
    mov ah, 0x71
    push ax             
    call print_text
    
    mov si, t
    push si
    mov di, 1088  ;row 1, column 70 
    push di
    mov ah, 0x71        
    push ax
    call print_text

    mov si, t
    push si
    mov di,5088 
    push di
    mov ah, 0x71        
    push ax
    call print_text

    mov si, score
    push si
    mov di, 1552   ;row 1, column 70 
    push di
    mov ah, 0x71        
    push ax
    call print_text
    
    mov si, score
    push si
    mov di, 5552   ;row 1, column 70 
    push di
    mov ah, 0x71        
    push ax
    call print_text

    mov si, game_text
    push si
    mov di, 2488 ;  2050(row 12, column 65)
    push di
    mov ah, 0x71
    push ax             
    call print_text
  
    mov si, notes_text
    push si
    mov di,2648 ; 2370(row 14, column 65)
    push di
    mov ah, 0x71 
    push ax     
    call print_text

    mov si, undo_text
    push si
    mov di, 2808  ;  2050(row 12, column 65)
    push di
    mov ah, 0x71
    push ax             
    call print_text

    mov si, ntext
    push si
    mov di, 2968  ;  2050(row 12, column 65)
    push di
    mov ah, 0x71
    push ax             
    call print_text
;;gridd
    mov di,160
    push di
    call upperBoundary
    mov di, 160
    push di
    call verticalLines
    mov di, 800
    push di
    call horixontalLines
     mov di, 800
    push di
    call verticalLines
    mov di, 1440
    push di
    call horixontalLines
     mov di, 1440
    push di
    call verticalLines
    mov di, 2080
    push di
    call horixontalLines
    mov di, 2080
    push di
    call verticalLines
    mov di, 2720
    push di
    call horixontalLines
    mov di, 2720
    push di
    call verticalLines
    mov di, 3360
    push di
    call horixontalLines
    mov di, 3360
    push di

 call verticalLines
    mov di, 4000
    push di
    call horixontalLines
    mov di, 4000
    push di

    call verticalLines
    mov di, 4640
    push di
    call horixontalLines
    mov di, 4640
    push di

    call verticalLines
    mov di, 5280
    push di
    call horixontalLines
     mov di, 5280
    push di

    call verticalLines
    mov di,5920
    push di
    call lowerBoundary

    mov ax,6560
    push ax
    call upperBoundary

    mov di, 6560
    push di
    call verticalLines
    mov di, 7200
    push di
    call horixontalLines
    mov di, 7200
    push di
    call lowerBoundary  
    ;call numbers
    ;call print_board
    call lowernumbers
    call InitialiseBoard
    call counterTiles
    ;call print_spaces
   jmp main_loop




eraseAll:
 
   call EraseAllNotes
   ; ;call scrolluplogic
   ; ;call scrolldownlogic

    call InitialiseBoard

   jmp main_loop

inputNotes:
mov ax,0
int 16h
mov [rows], al
mov ax, 0
int 16h
mov [cols], al
mov ax, 0
int 16h
mov [numberEntered], al
call notesmovement
call InitialiseBoard
jmp main_loop

inputerase:
mov ax,0
int 16h
mov [rows], al
mov ax, 0
int 16h
mov [cols], al
call erasemovement
call counterTiles
call InitialiseBoard
jmp main_loop

inputNumber:
mov ax,0
int 16h
mov [rows], al
mov ax, 0
int 16h
mov [cols], al
mov ax, 0
int 16h
mov [numberEntered], al
call isValidMove
call Updatevalues
call counterTiles
call EraseAllNotes
call InitialiseBoard
mov al,[scorecount]
mov [savescore],al
mov byte [boolforboardnumber],0
call checkwin
jmp main_loop

scrolldownlogic:
    call scrolldown 
    call InitialiseBoard                ; Perform scrolling
    jmp main_loop

 scrolluplogic:
   
    call scrollup                   
    jmp main_loop

end:
    mov ax, 0x4c00
   int 21h