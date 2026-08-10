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

extern OwnedPointerListVTable gOwnedPointerListVTable;

#ifdef __cplusplus
extern "C" {
#endif

OwnedPointerList *OwnedPointerList_Init(OwnedPointerList *list);
OwnedPointerList *OwnedPointerList_Destroy(OwnedPointerList *list);
void OwnedPointerList_Clear(OwnedPointerList *list);
OwnedPointerList *OwnedPointerList_DestroyAndFree(OwnedPointerList *list);

#ifdef __cplusplus
}
#endif

#endif
