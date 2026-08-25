#include "tingle/types.h"

/* Intrusive cache-list operations shared by decoded graphics resources. */

typedef struct GraphicsResourceCacheNode {
    u8 field_00[8];
    struct GraphicsResourceCacheNode *previous;
    struct GraphicsResourceCacheNode *next;
    u32 resourceId;
} GraphicsResourceCacheNode;

typedef struct GraphicsResourceCache {
    /* Volatile preserves retail's separate head/tail loads instead of LDMIA. */
    GraphicsResourceCacheNode *volatile head;
    GraphicsResourceCacheNode *volatile tail;
    u32 count;
} GraphicsResourceCache;

/* Append node to cache when non-null and update both links and the count. */
#ifndef MATCHING
#ifdef __cplusplus
extern "C"
#endif
void GraphicsResourceCache_Append(GraphicsResourceCache *cache,
                   GraphicsResourceCacheNode *node)
{
    if (node != 0) {
        GraphicsResourceCacheNode *head = cache->head;
        GraphicsResourceCacheNode *tail = cache->tail;

        /* This polarity makes MWCC use retail's NE/EQ conditional-store order. */
        if (head != 0)
            tail->next = node;
        else
            cache->head = node;
        node->previous = tail;
        cache->tail = node;
        node->next = 0;
        cache->count++;
    }
}
#else
/*
 * This matching fallback is the portable implementation above. The volatile
 * head/tail loads and inverted conditions recover retail's conditional-store
 * shape, but MWCC still chooses r2 rather than retail's r3 for the null link.
 */
#ifdef __cplusplus
extern "C" {
#endif
asm void GraphicsResourceCache_Append(GraphicsResourceCache *cache,
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
void GraphicsResourceCache_Remove(GraphicsResourceCache *cache,
                   GraphicsResourceCacheNode *node)
{
    if (node != 0) {
        GraphicsResourceCacheNode *previous = node->previous;
        GraphicsResourceCacheNode *next = node->next;

        /* Inverted tests preserve retail's NE/EQ conditional-store ordering. */
        if (previous != 0)
            previous->next = next;
        else
            cache->head = next;
        if (next != 0)
            next->previous = previous;
        else
            cache->tail = previous;
        cache->count--;
    }
}
#else
/*
 * This matching fallback implements the documented portable C directly above;
 * MWCC keeps the next-node value in r1 rather than retail's r3.
 */
#ifdef __cplusplus
extern "C" {
#endif
asm void GraphicsResourceCache_Remove(GraphicsResourceCache *cache,
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
GraphicsResourceCacheNode *GraphicsResourceCache_FindNode(GraphicsResourceCache *cache,
                                         GraphicsResourceCacheNode *node)
{
    GraphicsResourceCacheNode *current = cache->head;

    for (;;) {
        if (current == 0)
            return current;
        if (current == node)
            return current;
        current = current->next;
    }
}
#endif

/* Return the cached node with resourceId, or null when it is not loaded. */
#ifndef MATCHING
#ifdef __cplusplus
extern "C"
#endif
GraphicsResourceCacheNode *GraphicsResourceCache_FindByResourceId(GraphicsResourceCache *cache,
                                         u32 resourceId)
{
    GraphicsResourceCacheNode *current = cache->head;

    for (;;) {
        if (current == 0)
            return current;
        if (current->resourceId == resourceId)
            return current;
        current = current->next;
    }
}
#endif
