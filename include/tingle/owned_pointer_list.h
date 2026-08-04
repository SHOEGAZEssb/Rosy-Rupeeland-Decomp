#ifndef TINGLE_OWNED_POINTER_LIST_H
#define TINGLE_OWNED_POINTER_LIST_H

#include "tingle/types.h"

typedef struct OwnedPointerList OwnedPointerList;

typedef struct OwnedPointerListVTable {
    OwnedPointerList *(*destroy)(OwnedPointerList *list);
    OwnedPointerList *(*destroyAndFree)(OwnedPointerList *list);
} OwnedPointerListVTable;

typedef struct OwnedPointerListNode {
    struct OwnedPointerListNode *next;
} OwnedPointerListNode;

struct OwnedPointerList {
    const OwnedPointerListVTable *vtable;
    OwnedPointerListNode *head;
    OwnedPointerListNode *tail;
    u32 count;
};

extern OwnedPointerListVTable data_020d3ca0;

#ifdef __cplusplus
extern "C" {
#endif

OwnedPointerList *func_02001d10(OwnedPointerList *list);
OwnedPointerList *func_02001d30(OwnedPointerList *list);
void func_02001d50(OwnedPointerList *list);
OwnedPointerList *func_02001d90(OwnedPointerList *list);

#ifdef __cplusplus
}
#endif

#endif
