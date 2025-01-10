include \masm32\include\masm32rt.inc

.data
    f dd 0
    s dd 1
    count dd 2
    n dd ?
    temp dd 0

.code
start:
    print chr$("Name: Nguyen Hoai An", 13, 10, 13, 10, "FIBONACCI PROGRAM", 13, 10, "Press N numbers to generate: ", 13, 10)
    mov n, sval(input("      N = "))

    mov eax, n

    cmp eax, 0
    je invalid

    print chr$("Fibonacci: ", 13, 10, "      ")
    print str$(f)
    
    mov eax, n
    cmp eax, 1
    je close
    print chr$(", ")
    print str$(s)

    program:
        mov eax, count
        cmp eax, n
        je close

        mov eax, f
        add eax, s
        mov temp, eax
        
        print chr$(", ")
        print str$(temp)


        inc count
        mov eax, s
        mov f, eax
        mov eax, temp
        mov s, eax

        jmp program
    invalid:
        print chr$("Input invalid", 13, 10)
        mov eax, input("Press enter to retry: ")
        print chr$(13, 10, 13, 10)
        jmp start
    close:
        exit
end start
