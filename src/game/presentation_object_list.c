
/* Recovered intrusive-list operations used by presentation/effect owners.
 * Nodes are caller-owned; the list only maintains links and count. */
#include "tingle/types.h"

void func_02095274(void *list, void *node)
{
    u8 *list_bytes = (u8 *)list;
    u8 *node_bytes = (u8 *)node;
    void *tail;

    if (node == 0) {
        return;
    }

    tail = *(void **)(list_bytes + 0x08);
    if (*(void **)(list_bytes + 0x04) != 0) {
        *(void **)((u8 *)tail + 0x08) = node;
    } else {
        *(void **)(list_bytes + 0x04) = node;
    }
    *(void **)(node_bytes + 0x04) = tail;
    *(void **)(node_bytes + 0x08) = 0;
    *(void **)(list_bytes + 0x08) = node;
    ++*(u32 *)(list_bytes + 0x0c);
}

void func_020952b4(void *list, void *node)
{
    u8 *list_bytes = (u8 *)list;
    u8 *node_bytes = (u8 *)node;
    void *previous;
    void *next;

    if (node == 0) {
        return;
    }

    previous = *(void **)(node_bytes + 0x04);
    next = *(void **)(node_bytes + 0x08);
    if (previous != 0) {
        *(void **)((u8 *)previous + 0x08) = next;
    } else {
        *(void **)(list_bytes + 0x04) = next;
    }
    if (next != 0) {
        *(void **)((u8 *)next + 0x04) = previous;
    } else {
        *(void **)(list_bytes + 0x08) = previous;
    }
    *(void **)(node_bytes + 0x04) = 0;
    *(void **)(node_bytes + 0x08) = 0;
    --*(u32 *)(list_bytes + 0x0c);
}

/* Destroy all list members through their deleting destructor. */
void func_02095308(void *list)
{
    u8 *list_bytes = (u8 *)list;
    void *node = *(void **)(list_bytes + 0x04);

    while (node != 0) {
        void *next = *(void **)((u8 *)node + 0x08);
        void (**vtable)(void *) = *(void (***)(void *))node;
        func_020952b4(list, node);
        vtable[1](node);
        node = next;
    }
    *(void **)(list_bytes + 0x04) = 0;
    *(void **)(list_bytes + 0x08) = 0;
    *(u32 *)(list_bytes + 0x0c) = 0;
}

/* Update each member and delete completed, auto-owned presentations. */
void func_02095360(void *list)
{
    void *node = *(void **)((u8 *)list + 0x04);

    while (node != 0) {
        void *next = *(void **)((u8 *)node + 0x08);
        s32 (**vtable)(void *) = *(s32 (***)(void *))node;
        if (vtable[2](node) != 0 && *(u32 *)((u8 *)node + 0x88) != 0) {
            func_020952b4(list, node);
            ((void (*)(void *))vtable[1])(node);
        }
        node = next;
    }
}


