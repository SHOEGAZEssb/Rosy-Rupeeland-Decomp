
/*
 * Portable reconstruction of the assembly-selected presentation command
 * interpreter at 0x02094DD4 and its scalar interpolation dependencies.  The
 * recovered command stream, object vtable, field ordering, timing, and 32-bit
 * arithmetic remain authoritative; this unit introduces no host state.
 */
#include "tingle/types.h"


typedef struct PresentationScalar {
    s32 mode;
    s32 current;
    s32 start;
    s32 target;
} PresentationScalar;

typedef struct PresentationScriptObject {
    void **vtable;
    u8 padding_04[0x08];
    PresentationScalar position[3];
    PresentationScalar rotation[3];
    PresentationScalar scale;
    s32 duration;
    s32 elapsed;
    s16 loopCount;
    u16 loopActive;
    u32 field_88;
    const u32 *script;
    s32 scriptState;
    u16 loopStart;
    u16 scriptIndex;
    u16 flags;
} PresentationScriptObject;

typedef char PresentationScriptLayoutCheck[
    sizeof(PresentationScriptObject) == 0x9c ? 1 : -1];

extern void func_020948d4(void *component, s32 value);

static s32 WrapMultiply(s32 left, s32 right)
{
    return (s32)((u32)left * (u32)right);
}

static s32 DivideSigned(s32 numerator, s32 denominator)
{
    if (denominator == 0) {
        return numerator < 0 ? 1 : -1;
    }
    if (numerator == (s32)0x80000000U && denominator == -1) {
        return (s32)0x80000000U;
    }
    return numerator / denominator;
}

/* Cubic interpolation used by scalar mode two (retail 0x020919E8). */
s32 func_020919e8(s32 start, s32 end, s32 duration, s32 elapsed)
{
    s32 first;
    s32 second;

    if (duration < 1)
        duration = 1;
    if (elapsed < 0)
        elapsed = 0;
    if (elapsed > duration)
        elapsed = duration;
    first = DivideSigned(WrapMultiply(elapsed,
                                     WrapMultiply(start - end, 2)),
                         duration);
    first = DivideSigned(WrapMultiply(elapsed, first), duration);
    first = DivideSigned(WrapMultiply(elapsed, first), duration);
    second = DivideSigned(WrapMultiply(elapsed,
                                      WrapMultiply(end - start, 3)),
                          duration);
    second = DivideSigned(WrapMultiply(elapsed, second), duration);
    return (s32)((u32)start + (u32)first + (u32)second);
}

/* Clamped signed linear interpolation (retail 0x02091A70). */
s32 func_02091a70(s32 start, s32 end, s32 duration, s32 elapsed)
{
    s32 difference;

    if (duration < 1)
        duration = 1;
    if (elapsed < 0)
        elapsed = 0;
    if (elapsed > duration)
        elapsed = duration;
    difference = DivideSigned(WrapMultiply(elapsed, end - start), duration);
    return (s32)((u32)start + (u32)difference);
}

/* Centered quadratic interpolation (retail 0x02091AA8). */
s32 func_02091aa8(s32 start, s32 end, s32 duration, s32 elapsed)
{
    s32 half;
    s32 distance;
    s32 denominator;

    if (duration < 1)
        duration = 1;
    if (elapsed < 0)
        elapsed = 0;
    if (elapsed > duration)
        elapsed = duration;
    half = duration / 2;
    distance = elapsed - half;
    denominator = WrapMultiply(half, half);
    distance = DivideSigned(
        WrapMultiply(WrapMultiply(end - start, distance), distance),
        denominator);
    return (s32)((u32)end - (u32)distance);
}

/* Quadratic ease-out interpolation (retail 0x02091AF0). */
s32 func_02091af0(s32 start, s32 end, s32 duration, s32 elapsed)
{
    s32 distance;

    if (duration < 1)
        duration = 1;
    if (elapsed < 0)
        elapsed = 0;
    if (elapsed > duration)
        elapsed = duration;
    distance = elapsed - duration;
    distance = DivideSigned(
        WrapMultiply(WrapMultiply(end - start, distance), distance),
        WrapMultiply(duration, duration));
    return (s32)((u32)end - (u32)distance);
}

/* Quadratic ease-in interpolation (retail 0x02091B30). */
s32 func_02091b30(s32 start, s32 end, s32 duration, s32 elapsed)
{
    s32 distance;

    if (duration < 1)
        duration = 1;
    if (elapsed < 0)
        elapsed = 0;
    if (elapsed > duration)
        elapsed = duration;
    distance = DivideSigned(
        WrapMultiply(WrapMultiply(end - start, elapsed), elapsed),
        WrapMultiply(duration, duration));
    return (s32)((u32)start + (u32)distance);
}

/* Select an absolute scalar transition from its current value. */
void func_020948e4(PresentationScalar *scalar, s32 mode, s32 target)
{
    scalar->mode = mode;
    scalar->start = scalar->current;
    scalar->target = target;
}

/* Select a scalar transition to an offset from its current value. */
void func_020948f8(PresentationScalar *scalar, s32 mode, s32 offset)
{
    scalar->mode = mode;
    scalar->start = scalar->current;
    scalar->target = (s32)((u32)scalar->current + (u32)offset);
}

static void UpdateScalar(PresentationScalar *scalar, s32 duration, s32 elapsed)
{
    switch (scalar->mode) {
    case 1:
        scalar->current =
            func_02091a70(scalar->start, scalar->target, duration, elapsed);
        break;
    case 2:
        scalar->current =
            func_020919e8(scalar->start, scalar->target, duration, elapsed);
        break;
    case 3:
        scalar->current =
            func_02091aa8(scalar->start, scalar->target, duration, elapsed);
        break;
    case 4:
        scalar->current =
            func_02091af0(scalar->start, scalar->target, duration, elapsed);
        break;
    case 5:
        scalar->current =
            func_02091b30(scalar->start, scalar->target, duration, elapsed);
        break;
    default:
        break;
    }
    if (elapsed >= duration)
        scalar->mode = 0;
}

/* Advance all seven scalar channels by one recovered presentation tick. */
s32 func_02094c48(PresentationScriptObject *object)
{
    s32 index;

    if (object->elapsed < object->duration) {
        ++object->elapsed;
        for (index = 0; index < 3; ++index)
            UpdateScalar(&object->position[index], object->duration,
                         object->elapsed);
        for (index = 0; index < 3; ++index)
            UpdateScalar(&object->rotation[index], object->duration,
                         object->elapsed);
        UpdateScalar(&object->scale, object->duration, object->elapsed);
        if (object->elapsed < object->duration)
            return 0;
    }
    return 1;
}

/* Install a recovered presentation command stream and optionally invoke the
 * derived start hook, preserving the reset order at retail 0x02094cf0. */
void func_02094cf0(void *object, const void *commands, s32 invoke_start)
{
    u8 *bytes = (u8 *)object;

    *(const void **)(bytes + 0x8c) = commands;
    *(u16 *)(bytes + 0x94) = 0;
    *(u16 *)(bytes + 0x96) = 0;
    *(u32 *)(bytes + 0x90) = 0;
    *(u16 *)(bytes + 0x84) = 0;
    *(u16 *)(bytes + 0x86) = 0;
    if (invoke_start != 0) {
        void (**vtable)(void *) = *(void (***)(void *))object;
        vtable[2](object);
    }
}

static void CallPresentationSync(PresentationScriptObject *object)
{
    ((void (*)(void *))object->vtable[4])(object);
}

/*
 * Interpret the retail wordcode until it yields on a timed transition or
 * reaches an exit. Return one only for the normal opcode-zero completion.
 */
s32 func_02094dd4(PresentationScriptObject *object)
{
    if (object->script == 0) {
        s32 complete = func_02094c48(object);
        CallPresentationSync(object);
        return complete;
    }

    for (;;) {
        if (object->scriptState == 0) {
            u32 opcode = object->script[object->scriptIndex++];

            switch (opcode) {
            case 0:
                object->scriptState = 1;
                break;
            case 1:
                func_020948d4(&object->position[0],
                              (s32)object->script[object->scriptIndex]);
                func_020948d4(&object->position[1],
                              (s32)object->script[object->scriptIndex + 1]);
                func_020948d4(&object->position[2],
                              (s32)object->script[object->scriptIndex + 2]);
                object->scriptIndex += 3;
                break;
            case 2:
                func_020948d4(&object->scale,
                              (s32)object->script[object->scriptIndex++]);
                break;
            case 3:
                func_020948d4(&object->rotation[0],
                              (s32)object->script[object->scriptIndex]);
                func_020948d4(&object->rotation[1],
                              (s32)object->script[object->scriptIndex + 1]);
                func_020948d4(&object->rotation[2],
                              (s32)object->script[object->scriptIndex + 2]);
                object->scriptIndex += 3;
                break;
            case 4: case 5: case 6: case 7: case 8: case 9:
            case 10: case 11: case 12: case 13: case 14: case 15:
            case 16: case 17: {
                static const u8 scalarOffsets[14] = {
                    0x0c, 0x1c, 0x2c, 0x0c, 0x1c, 0x2c, 0x6c,
                    0x6c, 0x3c, 0x4c, 0x5c, 0x3c, 0x4c, 0x5c
                };
                s32 mode = (s32)object->script[object->scriptIndex++];
                s32 value = (s32)object->script[object->scriptIndex++];
                PresentationScalar *scalar = (PresentationScalar *)(
                    (u8 *)object + scalarOffsets[opcode - 4]);

                if (opcode == 7 || opcode == 8 || opcode == 9 ||
                    opcode == 11 || opcode == 15 || opcode == 16 ||
                    opcode == 17)
                    func_020948f8(scalar, mode, value);
                else
                    func_020948e4(scalar, mode, value);
                break;
            }
            case 18:
                object->duration =
                    (s16)object->script[object->scriptIndex++];
                object->elapsed = 0;
                object->scriptState = 2;
                break;
            case 19:
                object->loopStart = object->scriptIndex;
                break;
            case 20:
                if (object->loopActive == 0) {
                    object->loopActive = 1;
                    object->loopCount =
                        (s16)object->script[object->scriptIndex];
                    object->scriptIndex = object->loopStart;
                } else if (object->loopCount <= 0) {
                    object->scriptIndex = object->loopStart;
                } else {
                    --object->loopCount;
                    if (object->loopCount == 0) {
                        object->loopActive = 0;
                        ++object->scriptIndex;
                    } else {
                        object->scriptIndex = object->loopStart;
                    }
                }
                break;
            case 21:
                object->scriptState = 3;
                break;
            case 22:
                object->flags = (u16)(object->flags |
                    (u16)object->script[object->scriptIndex++]);
                break;
            case 23:
                object->flags = (u16)(object->flags &
                    ~(u16)object->script[object->scriptIndex++]);
                break;
            case 24: {
                s16 (*dispatch)(void *, const u32 *) =
                    (s16 (*)(void *, const u32 *))object->vtable[3];
                object->scriptIndex = (u16)(object->scriptIndex +
                    dispatch(object, object->script + object->scriptIndex));
                break;
            }
            default:
                break;
            }
            continue;
        }

        if (object->scriptState == 1) {
            object->script = 0;
            CallPresentationSync(object);
            return 1;
        }
        if (object->scriptState == 2) {
            if (func_02094c48(object) != 0) {
                object->scriptState = 0;
                continue;
            }
            CallPresentationSync(object);
            return 0;
        }
        if (object->scriptState == 3) {
            CallPresentationSync(object);
            return 0;
        }
    }
}

