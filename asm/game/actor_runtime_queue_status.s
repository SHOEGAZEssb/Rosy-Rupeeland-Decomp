; Matching retail form; see src/game/actor_runtime_collection_queue.c for
; the documented portable implementation and recovered behavior.
.text

.global func_0200b294
func_0200b294:
    ldr r1, [r0, #0x144]
    ldr r0, [r0, #0x0]
    cmp r1, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    and r0, r0, #0x2
    orr r0, r0, r1
    bx lr
.size func_0200b294, . - func_0200b294

