#include "tingle/types.h"

/*
 * Recovered frame update for the fixed actor-interaction registries. Objects
 * are borrowed; each live entry receives its vtable +0x1c update callback.
 */

extern u32 data_021057cc[4];
extern u32 data_021057dc[3];
extern u32 data_021057e8[3];
extern u32 data_02105804[16];

#define UPDATE_OBJECT(address) do {                                      \
    void *object = (void *)(address);                                    \
    if (object != 0) {                                                   \
        void (*update)(void *) =                                         \
            *(void (**)(void *))(*(u8 **)object + 0x1c);                 \
        update(object);                                                  \
    }                                                                    \
} while (0)

/* Update every live object in retail priority order; returns no value. */
void func_0205557c(void)
{
    s32 index;

    UPDATE_OBJECT(data_021057cc[2]);
    UPDATE_OBJECT(data_021057cc[3]);
    UPDATE_OBJECT(data_021057cc[0]);
    UPDATE_OBJECT(data_021057cc[1]);
    for (index = 0; index < 3; ++index)
        UPDATE_OBJECT(data_021057dc[index]);
    for (index = 0; index < 3; ++index)
        UPDATE_OBJECT(data_021057e8[index]);
    for (index = 0; index < 16; ++index)
        UPDATE_OBJECT(data_02105804[index]);
}

#undef UPDATE_OBJECT
