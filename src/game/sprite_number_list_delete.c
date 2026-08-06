#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Provide the late-emitted deleting destructor for the sprite-number group's
 * node-list type.  The compiler placed it after unrelated presentation code.
 */
typedef struct SpriteNodeList { void **vtable;void *tail,*head;s32 count; } SpriteNodeList;
#ifdef __cplusplus
extern "C" { extern void *data_020d660c; extern void func_02022ac8(void *); }
#endif

/* Install the list vtable, clear/free its nodes, free self, and return its old address. */
SpriteNodeList *func_020233a0(SpriteNodeList *self)
{self->vtable=(void **)data_020d660c;func_02022ac8(self);Heap_Free(self);return self;}
