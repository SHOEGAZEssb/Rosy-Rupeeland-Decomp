.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_actor_destructors.c.
.extern data_020f4e14
.extern data_ov090_0221cb10
.extern VecFx32Object_Destroy
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern func_0204d570
.extern GraphicsSpriteState_ReleaseFromGroup
.extern GraphicsSpriteGroup_ReleaseIndexedEntries
.extern GraphicsSpriteRenderer_SetTextGridPosition
.extern gDebugFont

.global func_ov090_02217b70
func_ov090_02217b70:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02217c60
    mov r4, r0
    str r1, [r4, #0x0]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r0, [r4, #0x200]
    cmp r0, #0x0
    beq .L_02217b9c
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217b9c:
    ldr r0, [r4, #0x23c]
    cmp r0, #0x0
    beq .L_02217bac
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217bac:
    ldr r0, [r4, #0x248]
    cmp r0, #0x0
    beq .L_02217bbc
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217bbc:
    ldr r0, [r4, #0x240]
    cmp r0, #0x0
    beq .L_02217bd4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217bd4:
    ldr r0, [r4, #0x204]
    cmp r0, #0x0
    beq .L_02217bec
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217bec:
    ldr r0, [r4, #0x208]
    cmp r0, #0x0
    beq .L_02217c04
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217c04:
    ldr r0, [r4, #0x24c]
    cmp r0, #0x0
    beq .L_02217c1c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217c1c:
    ldr r0, .L_02217c64
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    mov r3, #0x1
    ldr r0, .L_02217c68
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
    ldmia sp!, {r4, pc}
.L_02217c60: .word data_ov090_0221cb10
.L_02217c64: .word gDebugFont
.L_02217c68: .word data_020f4e14
.size func_ov090_02217b70, . - func_ov090_02217b70
