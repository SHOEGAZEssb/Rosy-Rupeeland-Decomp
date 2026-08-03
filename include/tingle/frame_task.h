#ifndef TINGLE_FRAME_TASK_H
#define TINGLE_FRAME_TASK_H

#include "tingle/types.h"

typedef struct FrameTask FrameTask;
typedef struct FrameTaskNode FrameTaskNode;

typedef struct FrameTaskVTable {
    FrameTask *(*destroy)(FrameTask *task);
    FrameTask *(*destroyAndFree)(FrameTask *task);
    int (*update)(FrameTask *task);
} FrameTaskVTable;

struct FrameTask {
    FrameTaskVTable *vtable;
};

struct FrameTaskNode {
    FrameTaskNode *next;
    FrameTaskNode *previous;
    FrameTask *task;
};

typedef struct FrameTaskList {
    void *vtable;
    FrameTaskNode *head;
    FrameTaskNode *tail;
    s32 count;
} FrameTaskList;

typedef struct FrameTaskTags {
    char append[8];
    char prepend[8];
} FrameTaskTags;

typedef char FrameTaskNodeSizeCheck[sizeof(FrameTaskNode) == 0xC ? 1 : -1];
typedef char FrameTaskListSizeCheck[sizeof(FrameTaskList) == 0x10 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern FrameTaskTags gFrameTaskTags;
extern FrameTaskList gFrameTaskList;

FrameTaskNode *FrameTaskList_Add(FrameTask *task, int append);
FrameTaskNode *FrameTaskNode_Init(FrameTaskNode *node, FrameTask **task);
void FrameTaskList_DestroyNode(FrameTaskNode *node);
void FrameTaskList_Remove(FrameTaskList *list, FrameTaskNode *node);
void FrameTaskList_Update(void);

#ifdef __cplusplus
}
#endif

#endif
