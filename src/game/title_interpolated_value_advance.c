/* One-tick update and query dispatch for the shared signed interpolator. */
#include "tingle/types.h"

typedef struct TitleInterpolatedValue {
    void *vtable;
    s32 mode;
    s32 start;
    s32 end;
    s32 current;
    s32 duration;
    s32 elapsed;
} TitleInterpolatedValue;

extern s32 TitleInterpolatedValue_Evaluate(TitleInterpolatedValue *value, s32 mode, s32 start,
                         s32 end);

/* Advance one tick and return current value, completion, or elapsed time. */
s32 func_02091c7c(TitleInterpolatedValue *value, s32 query)
{
    s32 complete = 0;

    if (value->elapsed >= value->duration) {
        complete = 1;
    } else {
        ++value->elapsed;
        value->current =
            TitleInterpolatedValue_Evaluate(value, value->mode, value->start, value->end);
    }

    switch (query) {
    case 0:
    default:
        return 0;
    case 1:
        return value->current;
    case 2:
        return complete;
    case 3:
        return value->elapsed;
    }
}
