; Matching retail form; see src/game/actor_descriptor_batch_wrappers.c.
.text
.extern data_020df500
.extern func_0203af24
    .global func_0203b38c
    .type func_0203b38c, @function
func_0203b38c: ; 0x0203b38c
    ldr ip, .L_0203b398
    mov r3, #0x1
    bx ip
.L_0203b398: .word func_0203af24
    .size func_0203b38c, . - func_0203b38c

    .global func_0203b39c
    .type func_0203b39c, @function
func_0203b39c: ; 0x0203b39c
    ldr ip, .L_0203b3a8
    mov r3, #0x2
    bx ip
.L_0203b3a8: .word func_0203af24
    .size func_0203b39c, . - func_0203b39c

    .global func_0203b3ac
    .type func_0203b3ac, @function
func_0203b3ac: ; 0x0203b3ac
    ldr r1, .L_0203b3b8
    str r0, [r1, #0x0]
    bx lr
.L_0203b3b8: .word data_020df500
    .size func_0203b3ac, . - func_0203b3ac

    .global func_0203b3bc
    .type func_0203b3bc, @function
func_0203b3bc: ; 0x0203b3bc
    ldr r1, .L_0203b3c8
    str r0, [r1, #0x4]
    bx lr
.L_0203b3c8: .word data_020df500
    .size func_0203b3bc, . - func_0203b3bc


