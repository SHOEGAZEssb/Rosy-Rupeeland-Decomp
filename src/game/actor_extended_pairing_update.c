#include "tingle/types.h"

/*
 * Recovered cross-type actor pairing pass. It links unpaired actors from two
 * fixed-capacity runtime lists according to the type mapping table.
 */
extern s16 data_02105728;
extern s16 data_0210572a;
extern void *data_0210572c[];
extern void *data_0210574c[];
extern const s16 data_020e70c0[];

/*
 * For every unpaired actor in data_0210572c, map its +0x4e type through
 * data_020e70c0 and select the first unpaired data_0210574c actor whose +0x4e
 * type equals that result. Store the selected actor at +0x298 and invoke its
 * vtable callback at +0x1d4 with the newly linked actor as the second input.
 * Negative mappings and actors already linked at +0x298 are skipped. Returns
 * no value; actor link state and callback-visible engine state may change.
 */
void func_02043c24(void)
{
    s32 destinationIndex;

    for (destinationIndex = 0; destinationIndex < data_0210572a; ++destinationIndex) {
        u8 *destination = (u8 *)data_0210572c[destinationIndex];
        s32 mappedType;
        s32 sourceIndex;

        if (*(void **)(destination + 0x298) != 0)
            continue;
        mappedType = data_020e70c0[*(u16 *)(destination + 0x4e)];
        if (mappedType < 0)
            continue;

        for (sourceIndex = 0; sourceIndex < data_02105728; ++sourceIndex) {
            u8 *source = (u8 *)data_0210574c[sourceIndex];
            if (*(void **)(source + 0x298) != 0
                || *(u16 *)(source + 0x4e) != mappedType) {
                continue;
            }
            *(void **)(destination + 0x298) = source;
            (*(void (**)(void *, void *))(*(u8 **)source + 0x1d4))(source, destination);
            break;
        }
    }
}
