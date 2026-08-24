#include "tingle/game_string_list.h"
#include "tingle/frame_task.h"
#include "tingle/heap.h"

/*
 * Heap-backed doubly linked list specialization for GameString values. Nodes
 * own copied strings, while the list tracks head, tail, and element count.
 */

extern u8 data_020d41c0[];
extern u32 data_020d41ec[];

typedef GameString *(*GameStringVirtualFunction)(GameString *self);

/*
 * Install the retail CTask vtable and clear its registration pointer. Derived
 * frame tasks overwrite the vtable after this shared base construction.
 */
FrameTask *FrameTask_Construct(FrameTask *self)
{
    self->vtable = &gFrameTaskVTable;
    self->registration = 0;
    return self;
}

/* Virtual CTask destruction hook: change no state and return self. */
FrameTask *FrameTask_Destroy(FrameTask *self)
{
    return self;
}

/* Free the heap-owned task and return its original address. */
FrameTask *FrameTask_DestroyAndFree(FrameTask *self)
{
    Heap_Free(self);
    return self;
}

/*
 * Base-destructor variant called explicitly by derived task destructors. CTask
 * owns no resources, so it returns its input unchanged.
 */
FrameTask *FrameTask_DestroyBase(FrameTask *self)
{
    return self;
}

/*
 * Default CTask update slot. It accepts an unused task, changes no state, and
 * returns zero so the frame scheduler keeps the task alive.
 */
s32 FrameTask_UpdateNoop(FrameTask *self)
{
    (void)self;
    return 0;
}

/* Install the GameString-list vtable, clear all nodes, and return self. */
GameStringList *GameStringList_Destroy(GameStringList *self)
{
    self->vtable = data_020d41ec;
    GameStringList_Clear(self);
    return self;
}

/*
 * Destroy every owned GameString and node from head to tail, then clear head,
 * tail, and count. Each value's first virtual hook runs before its explicit
 * GameString destructor, matching the recovered C++ deletion sequence.
 */
void GameStringList_Clear(GameStringList *self)
{
    GameStringListNode *node = self->head;

    while (node != 0) {
        GameStringListNode *next = node->next;
        ((const GameStringVirtualFunction *)node->value.vtable)[0](
            &node->value);
        if (node != 0) {
            GameString_Destroy(&node->value);
            Heap_Free(node);
        }
        node = next;
    }

    self->head = 0;
    self->tail = 0;
    self->count = 0;
}

/*
 * Allocate a NODE-tagged list element, copy value into it, append it at the
 * tail, increment count, and return the new node. Retail assumes allocation
 * succeeds when linking into a nonempty list; that unchecked behavior is kept.
 */
GameStringListNode *GameStringList_Append(GameStringList *self,
                                 const GameString *value)
{
    GameStringListNode *node =
        (GameStringListNode *)Heap_Alloc(sizeof(GameStringListNode),
                                        (const char *)data_020d41c0, 4,
                                        &gHeapContext);

    if (node != 0) {
        node->next = 0;
        node->previous = 0;
        GameString_Init(&node->value);
        GameString_AssignCopy(&node->value, value);
    }

    if (self->tail != 0) {
        self->tail->next = node;
        node->previous = self->tail;
    } else {
        self->head = node;
    }
    self->tail = node;
    self->count++;
    return node;
}

/*
 * Install the specialized vtable, clear the list, free the object itself, and
 * return its original address.
 */
GameStringList *GameStringList_DestroyAndFree(GameStringList *self)
{
    self->vtable = data_020d41ec;
    GameStringList_Clear(self);
    Heap_Free(self);
    return self;
}
