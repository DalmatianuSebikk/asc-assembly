.data
.text
.global main
    # proceduri
main:



et_exit:
    movl            $1, %eax
    xor             %ebx, %ebx
    int             $0x80
    