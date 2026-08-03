#ifndef TINGLE_THREAD_H
#define TINGLE_THREAD_H

#include "tingle/types.h"

typedef struct Thread Thread;
typedef void (*ThreadEntry)(void *argument);

typedef struct ThreadVTable {
    Thread *(*destroy)(Thread *thread);
    Thread *(*destroyAndFree)(Thread *thread);
} ThreadVTable;

/* NitroSDK's OSThread is opaque here and occupies 0xc0 bytes in this build. */
struct Thread {
    ThreadVTable *vtable;
    u32 osThread[0x30];
    void *stack;
};

typedef char ThreadSizeCheck[sizeof(Thread) == 0xc8 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern ThreadVTable data_020d3f50;
extern char data_020d3f58[8];

#define gThreadVTable data_020d3f50
#define gThreadStackTag data_020d3f58

Thread *Thread_Init(Thread *thread);
Thread *Thread_Destroy(Thread *thread);
Thread *Thread_DestroyAndFree(Thread *thread);
Thread *Thread_Deinit(Thread *thread);
void Thread_Create(Thread *thread, ThreadEntry entry, void *argument,
                   u32 stackSize, u32 priority);
void Thread_Start(Thread *thread);

#ifdef __cplusplus
}
#endif

#endif
