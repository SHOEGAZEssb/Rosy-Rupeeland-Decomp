.text
.extern VecFx32Object_InitCopy
; Matching fallback for the portable implementation in src/game/runtime_modal_scene.c.

.global func_0209de34
func_0209de34:
    ldr ip, .L_0209de40
    add r1, r1, #0x24
    bx ip
.L_0209de40: .word VecFx32Object_InitCopy
.size func_0209de34, . - func_0209de34
