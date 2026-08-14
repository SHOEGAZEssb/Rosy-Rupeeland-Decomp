/*
 * Small signed-value interpolator used throughout scene presentation code.
 * Storage is caller-owned; elapsed time advances by one tick per query.
 */
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

extern u8 data_020f2580[];
extern s32 func_020919e8(s32 start, s32 end, s32 duration, s32 elapsed);
extern s32 func_02091a70(s32 start, s32 end, s32 duration, s32 elapsed);
extern s32 func_02091aa8(s32 start, s32 end, s32 duration, s32 elapsed);
extern s32 func_02091af0(s32 start, s32 end, s32 duration, s32 elapsed);
extern s32 func_02091b30(s32 start, s32 end, s32 duration, s32 elapsed);

/* Construct a stopped interpolator with the retail virtual table. */
void *func_02091b6c(TitleInterpolatedValue *value)
{
    value->vtable = data_020f2580;
    value->mode = 0;
    value->elapsed = 0;
    value->duration = 0;
    value->current = 0;
    value->end = 0;
    value->start = 0;
    return value;
}

/* Reset only the timing controls while retaining endpoints and current value. */
void func_02091b98(TitleInterpolatedValue *value, s32 duration)
{
    value->mode = 0;
    value->duration = duration;
    value->elapsed = 0;
}

/* Configure a new interpolation and reset its elapsed tick count. */
void func_02091bac(TitleInterpolatedValue *value, s32 mode, s32 start,
                   s32 end, s32 duration)
{
    value->mode = mode;
    value->current = start;
    value->start = start;
    value->end = end;
    value->duration = duration;
    value->elapsed = 0;
}

/* Evaluate one interpolation mode using the object's timing state. */
s32 func_02091bd0(TitleInterpolatedValue *value, s32 mode, s32 start, s32 end)
{
    switch (mode) {
    case 1:
        return func_02091a70(start, end, value->duration, value->elapsed);
    case 2:
        return func_020919e8(start, end, value->duration, value->elapsed);
    case 3:
        return func_02091aa8(start, end, value->duration, value->elapsed);
    case 4:
        return func_02091af0(start, end, value->duration, value->elapsed);
    case 5:
        return func_02091b30(start, end, value->duration, value->elapsed);
    default:
        return 0;
    }
}
