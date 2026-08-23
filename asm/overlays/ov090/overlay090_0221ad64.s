.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_sprite_replace.c.
.extern Heap_Alloc
.extern data_ov090_0221cc00
.extern AnimationResource_Init
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern GraphicsSpriteState_ReleaseFromGroup
.extern GraphicsSpriteGroup_CreateState
.extern gHeapContext

.global func_ov090_0221ad64
func_ov090_0221ad64:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r0, [r4, #0x200]
    mov r7, r1
    mov r6, r2
    mov r5, r3
    cmp r0, #0x0
    beq .L_0221ad88
    bl GraphicsSpriteState_ReleaseFromGroup
.L_0221ad88:
    ldr r0, [r4, #0x204]
    cmp r0, #0x0
    beq .L_0221ada0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0221ada0:
    mvn r0, #0x0
    cmp r7, r0
    beq .L_0221ae04
    ldr r1, .L_0221ae14
    ldr r3, .L_0221ae18
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0221add8
    mov r1, r7
    mov r2, r6
    mov r3, r5
    bl AnimationResource_Init
.L_0221add8:
    mov r5, r0
    str r0, [r4, #0x204]
    mov r0, r4
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldmib r5, {r1, r2, r3}
    bl GraphicsSpriteGroup_CreateState
    str r0, [r4, #0x200]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0221ae04:
    mov r0, #0x0
    str r0, [r4, #0x200]
    str r0, [r4, #0x204]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0221ae14: .word data_ov090_0221cc00
.L_0221ae18: .word gHeapContext
.size func_ov090_0221ad64, . - func_ov090_0221ad64
