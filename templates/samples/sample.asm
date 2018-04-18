title   Hello World Program
; This program displays "Hello, World!"

dosseg
.model small
.stack 100h

.data
hello_message db 'Hello, World!',0dh,0ah,'$'

.code
main  proc
      mov    ax,@data
      mov    ds,ax

      mov    ah,9
      mov    dx,offset hello_message
      int    21h

      mov    ax,4C00h
      int    21h
main  endp
end   main

