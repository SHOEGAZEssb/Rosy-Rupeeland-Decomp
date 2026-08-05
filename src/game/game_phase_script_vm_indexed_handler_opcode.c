#include "tingle/game_phase_script_vm.h"

/*
 * Query or invoke one entry in a recovered global handler table selected by a
 * script-provided index.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void **data_020f1678[];
extern s32 func_0208372c(s32 index);
#ifdef __cplusplus
}
#endif

/*
 * Pop handler index and mode.  Modes 1/2 push whether the indexed state equals
 * 2/1 respectively; modes 3/4 invoke function slot 1/0 of the indexed handler
 * record.  Mode 0 and unsupported modes do nothing.  Return zero.
 */
s32 func_020192f4(GamePhaseActorScriptVm *self)
{
    typedef void (*Handler)(void);
    s32 index = (s32)func_02012704(&self->base);
    s32 mode = (s32)func_02012704(&self->base);
    switch (mode) {
    case 1:
        func_020127f8(&self->base, func_0208372c(index) == 2);
        break;
    case 2:
        func_020127f8(&self->base, func_0208372c(index) == 1);
        break;
    case 3:
        ((Handler)data_020f1678[index][1])();
        break;
    case 4:
        ((Handler)data_020f1678[index][0])();
        break;
    }
    return 0;
}
