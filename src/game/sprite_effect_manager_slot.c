#include "tingle/heap.h"
#include "tingle/types.h"

/* Destroy one entry in the resident 30-slot sprite-effect manager. */
typedef struct SpriteEffectManager {
    void *owner00;
    void *slots04[30];
    u32 field7c;
} SpriteEffectManager;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020a3790(void *effect);

/* The manager owns non-null slots; empty slots are accepted unchanged. */
void func_020a338c(SpriteEffectManager *manager, s32 index)
{
    void *effect = manager->slots04[index];

    if (effect == 0)
        return;
    if (effect != 0) {
        func_020a3790(effect);
        Heap_Free(effect);
    }
    manager->slots04[index] = 0;
}

#ifdef __cplusplus
}
#endif
