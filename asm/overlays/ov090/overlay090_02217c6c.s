.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_actor_destructors.c.
.extern Heap_Free
.extern data_020f4e14
.extern data_ov090_0221cb10
.extern VecFx32Object_Destroy
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern func_0204d570
.extern GraphicsSpriteState_ReleaseFromGroup
.extern GraphicsSpriteGroup_ReleaseIndexedEntries
.extern GraphicsSpriteRenderer_SetTextGridPosition
.extern gDebugFont

.global func_ov090_02217c6c
func_ov090_02217c6c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02217d64
    mov r4, r0
    str r1, [r4, #0x0]
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r0, [r4, #0x200]
    cmp r0, #0x0
    beq .L_02217c98
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217c98:
    ldr r0, [r4, #0x23c]
    cmp r0, #0x0
    beq .L_02217ca8
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217ca8:
    ldr r0, [r4, #0x248]
    cmp r0, #0x0
    beq .L_02217cb8
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217cb8:
    ldr r0, [r4, #0x240]
    cmp r0, #0x0
    beq .L_02217cd0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217cd0:
    ldr r0, [r4, #0x204]
    cmp r0, #0x0
    beq .L_02217ce8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217ce8:
    ldr r0, [r4, #0x208]
    cmp r0, #0x0
    beq .L_02217d00
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217d00:
    ldr r0, [r4, #0x24c]
    cmp r0, #0x0
    beq .L_02217d18
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217d18:
    ldr r0, .L_02217d68
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    mov r3, #0x1
    ldr r0, .L_02217d6c
    str r3, [r2, #0x38]
    ldr r0, [r0, #0x0]
    mov r2, r1
    bl GraphicsSpriteRenderer_SetTextGridPosition
    add r0, r4, #0x224
    bl VecFx32Object_Destroy
    add r0, r4, #0x20c
    bl VecFx32Object_Destroy
    mov r0, r4
    bl func_0204d570
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02217d64: .word data_ov090_0221cb10
.L_02217d68: .word gDebugFont
.L_02217d6c: .word data_020f4e14
.size func_ov090_02217c6c, . - func_ov090_02217c6c
