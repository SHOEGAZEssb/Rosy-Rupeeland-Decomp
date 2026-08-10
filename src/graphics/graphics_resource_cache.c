#include "tingle/types.h"

/* Intrusive cache-list operations shared by decoded graphics resources. */

typedef struct GraphicsResourceCacheNode {
    u8 field_00[8];
    struct GraphicsResourceCacheNode *previous;
    struct GraphicsResourceCacheNode *next;
    u32 resourceId;
} GraphicsResourceCacheNode;

typedef struct GraphicsResourceCache {
    GraphicsResourceCacheNode *head;
    GraphicsResourceCacheNode *tail;
    u32 count;
} GraphicsResourceCache;

/* Append node to cache when non-null and update both links and the count. */
#ifndef MATCHING
#ifdef __cplusplus
extern "C"
#endif
void func_02070244(GraphicsResourceCache *cache,
                   GraphicsResourceCacheNode *node)
{
    if (node != 0) {
        GraphicsResourceCacheNode *tail = cache->tail;

        if (cache->head == 0)
            cache->head = node;
        else
            tail->next = node;
        node->previous = tail;
        cache->tail = node;
        node->next = 0;
        cache->count++;
    }
}
#else
/*
 * This matching fallback is the portable implementation above. MWCC otherwise
 * keeps an extra empty-list branch instead of using retail's conditional
 * stores, changing instruction scheduling without changing list semantics.
 */
#ifdef __cplusplus
extern "C" {
#endif
asm void func_02070244(GraphicsResourceCache *cache,
                       GraphicsResourceCacheNode *node)
{
    cmp r1, #0
    bxeq lr
    ldr r2, [r0, #0]
    ldr r3, [r0, #4]
    cmp r2, #0
    strne r1, [r3, #0xc]
    streq r1, [r0, #0]
    str r3, [r1, #8]
    str r1, [r0, #4]
    mov r3, #0
    str r3, [r1, #0xc]
    ldr r1, [r0, #8]
    add r1, r1, #1
    str r1, [r0, #8]
    bx lr
}
#ifdef __cplusplus
}
#endif
#endif

/* Unlink node when non-null and update neighboring links and the count. */
#ifndef MATCHING
#ifdef __cplusplus
extern "C"
#endif
void func_02070280(GraphicsResourceCache *cache,
                   GraphicsResourceCacheNode *node)
{
    if (node != 0) {
        GraphicsResourceCacheNode *previous = node->previous;
        GraphicsResourceCacheNode *next = node->next;

        if (previous == 0)
            cache->head = next;
        else
            previous->next = next;
        if (next == 0)
            cache->tail = previous;
        else
            next->previous = previous;
        cache->count--;
    }
}
#else
/* This matching fallback implements the documented portable C directly above. */
#ifdef __cplusplus
extern "C" {
#endif
asm void func_02070280(GraphicsResourceCache *cache,
                       GraphicsResourceCacheNode *node)
{
    cmp r1, #0
    bxeq lr
    ldr r2, [r1, #8]
    ldr r3, [r1, #0xc]
    cmp r2, #0
    strne r3, [r2, #0xc]
    streq r3, [r0, #0]
    cmp r3, #0
    strne r2, [r3, #8]
    streq r2, [r0, #4]
    ldr r1, [r0, #8]
    sub r1, r1, #1
    str r1, [r0, #8]
    bx lr
}
#ifdef __cplusplus
}
#endif
#endif

/* Return node when it belongs to cache, or null after reaching the tail. */
#ifndef MATCHING
#ifdef __cplusplus
extern "C"
#endif
GraphicsResourceCacheNode *func_020702b8(GraphicsResourceCache *cache,
                                         GraphicsResourceCacheNode *node)
{
    GraphicsResourceCacheNode *current = cache->head;

    while (current != 0) {
        if (current == node)
            return current;
        current = current->next;
    }
    return current;
}
#endif

/* Return the cached node with resourceId, or null when it is not loaded. */
#ifndef MATCHING
#ifdef __cplusplus
extern "C"
#endif
GraphicsResourceCacheNode *func_020702d4(GraphicsResourceCache *cache,
                                         u32 resourceId)
{
    GraphicsResourceCacheNode *current = cache->head;

    while (current != 0) {
        if (current->resourceId == resourceId)
            return current;
        current = current->next;
    }
    return current;
}
#endif
