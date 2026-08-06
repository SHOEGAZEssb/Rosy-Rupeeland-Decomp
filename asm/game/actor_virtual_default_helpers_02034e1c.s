; Matching retail form; see src/game/actor_virtual_default_helpers.c.
.text
.extern func_02005030

    .global func_02034e1c
    .type func_02034e1c, @function
func_02034e1c: ; 0x02034e1c
    ldr ip, .L_02034e28
    add r1, r1, #0x18
    bx ip
.L_02034e28: .word func_02005030
    .size func_02034e1c, . - func_02034e1c

    .global func_02034e2c

