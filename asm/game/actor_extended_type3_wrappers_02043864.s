; Matching retail form; see src/game/actor_extended_type3_wrappers.c.
.text
.extern Heap_Free
.extern func_02005030
.extern func_02005058
.extern func_0203e494
.extern func_0203f5c4
.extern func_020400a4
.extern func_02040334
.extern func_020435f4
.extern func_020befec
.global func_02043864
.type func_02043864, @function
func_02043864: ; 0x02043864
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203e494
    mov r0, r4
    ldmia sp!, {r4, pc}

.size func_02043864, . - func_02043864

.global func_02043878
.type func_02043878, @function
func_02043878: ; 0x02043878
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203e494
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}

.size func_02043878, . - func_02043878

.global func_02043894
.type func_02043894, @function
func_02043894: ; 0x02043894
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_020400a4
    movs r4, r0
    beq .L_020438b8
    mov r0, r5
    bl func_020435f4
    add r1, r5, #0x200
    strh r0, [r1, #0x9a]
.L_020438b8:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}

.size func_02043894, . - func_02043894

.global func_020438c0
.type func_020438c0, @function
func_020438c0: ; 0x020438c0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_02040334
    movs r4, r0
    beq .L_020438e4
    mov r0, r5
    bl func_020435f4
    add r1, r5, #0x200
    strh r0, [r1, #0x9a]
.L_020438e4:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}

.size func_020438c0, . - func_020438c0

.global func_020438ec
.type func_020438ec, @function
func_020438ec: ; 0x020438ec
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x0
    bl func_02005030
    add r1, sp, #0x0
    mov r0, r4
    bl func_0203f5c4
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x98]
    cmp r0, #0x0
    bne .L_02043930
    ldr r0, [r4, #0x40]
    mov r1, #0x3
    bl func_020befec
    str r0, [r4, #0x40]
    b .L_02043948
.L_02043930:
    cmp r0, #0x1
    bne .L_02043948
    ldr r0, [r4, #0x3c]
    mov r1, #0x3
    bl func_020befec
    str r0, [r4, #0x3c]
.L_02043948:
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.size func_020438ec, . - func_020438ec
