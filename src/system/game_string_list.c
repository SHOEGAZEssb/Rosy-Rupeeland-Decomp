#include "tingle/game_string_list.h"
#include "tingle/heap.h"

/*
 * Heap-backed doubly linked list specialization for GameString values. Nodes
 * own copied strings, while the list tracks head, tail, and element count.
 */

extern u32 data_020d41b4[];
extern u8 data_020d41c0[];
extern u32 data_020d41ec[];

typedef GameString *(*GameStringVirtualFunction)(GameString *self);

/*
 * Install the base-list vtable and clear the head pointer. The recovered base
 * constructor leaves the tail and count fields untouched and returns self.
 */
GameStringList *func_02006108(GameStringList *self)
{
    self->vtable = data_020d41b4;
    self->head = 0;
    return self;
}

/* Base-list destruction hook: change no state and return self. */
GameStringList *func_02006120(GameStringList *self)
{
    return self;
}

/* Free the base-list object itself and return its original address. */
GameStringList *func_02006124(GameStringList *self)
{
    Heap_Free(self);
    return self;
}

/*
 * Recovered no-op virtual hook associated with this list template's metadata.
 * Its exact semantic role is not yet confirmed; it returns its input unchanged.
 */
void *func_02006138(void *self)
{
    return self;
}

/*
 * Recovered null-returning virtual hook associated with the same metadata. It
 * accepts an unused object pointer, changes no state, and returns null.
 */
void *func_0200613c(void *self)
{
    (void)self;
    return 0;
}

/* Install the GameString-list vtable, clear all nodes, and return self. */
GameStringList *func_02006144(GameStringList *self)
{
    self->vtable = data_020d41ec;
    func_02006164(self);
    return self;
}

/*
 * Destroy every owned GameString and node from head to tail, then clear head,
 * tail, and count. Each value's first virtual hook runs before its explicit
 * GameString destructor, matching the recovered C++ deletion sequence.
 */
void func_02006164(GameStringList *self)
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
GameStringListNode *func_020061c0(GameStringList *self,
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
GameStringList *func_02006240(GameStringList *self)
{
    self->vtable = data_020d41ec;
    func_02006164(self);
    Heap_Free(self);
    return self;
}
