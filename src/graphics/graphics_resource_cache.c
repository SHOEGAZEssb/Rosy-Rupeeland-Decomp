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

/* Unlink node when non-null and update neighboring links and the count. */
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

/* Return node when it belongs to cache, or null after reaching the tail. */
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
    return 0;
}

/* Return the cached node with resourceId, or null when it is not loaded. */
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
    return 0;
}
