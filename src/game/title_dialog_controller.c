
/* Portable reconstruction of the shared sprite-font dialog constructor at
 * 0x02092cc0.  It retains its archive resources and owns two renderer groups. */
#include "tingle/types.h"
extern void *memset(void *destination, int value, u32 size);

extern u8 data_020f25c4[];
extern const u16 data_020f25a4[];
extern void *data_020f4e18;
extern void *gGameWork;
extern void *gSoundContext;
extern void *func_02071ea4(void *state);
extern void func_02071ee0(void *state, void *archive, u32 character_id,
                         u32 palette_id, u32 screen_id);
extern void *func_020742cc(void *owner);
extern void func_02074110(void *group);
extern void GraphicsSpriteGroup_Clear(void *group);
extern void *func_02073ffc(void *group, const void *source, s32 attach);
extern void func_02072b68(void *sprite, u32 animation);
extern void func_02071f38(void *resource_set);
extern void Sound_Play(void *context, s32 archive, s32 member);
extern void func_0207419c(void *group);
extern void func_02071eb8(void *resource_set);
extern void Heap_Free(void *allocation);
extern void *GraphicsSpriteRenderer_SetFontResource(void *renderer,
                                                     void *replacement);
extern s32 GraphicsSpriteRenderer_MeasureText(void *renderer,
                                              const u16 *text, s32 spacing,
                                              s32 lineSpacing);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *group);
extern void GraphicsSpriteCanvas_FillRect(void *canvas, s32 left, s32 top,
                                          s32 right, s32 bottom, s32 mode);
extern s32 GraphicsSpriteRenderer_DrawCharacter(void *renderer,
                                                u32 characterCode,
                                                u32 destinationX,
                                                u32 destinationY, u32 mode);

void *func_02092cc0(void *object, void *font, void *text_resource)
{
    u8 *bytes = (u8 *)object;
    void *primary_group;
    void *sprite;
    u32 index;

    memset(bytes, 0, 0xec);
    *(void **)bytes = data_020f25c4;
    func_02071ea4(bytes + 0x14);
    func_02071ea4(bytes + 0x20);
    *(void **)(bytes + 0x04) = font;
    primary_group = func_020742cc(font);
    *(void **)(bytes + 0x08) = primary_group;
    *(void **)(bytes + 0x0c) = func_020742cc(font);
    func_02074110(primary_group);
    func_02071ee0(bytes + 0x14, data_020f4e18, 0x3298, 0x3299, 0x329a);
    sprite = func_02073ffc(primary_group, bytes + 0x14, 2);
    *(void **)(bytes + 0x10) = sprite;
    func_02072b68(sprite, 0x18);
    *(u16 *)((u8 *)sprite + 0x24) |= 2u;
    *(void **)(bytes + 0x2c) = text_resource;
    for (index = 0; index < 8; ++index) {
        *(u32 *)(bytes + 0x44 + index * 4) = 0;
    }
    *(void **)(bytes + 0x60) = (u8 *)gGameWork + 0x10;
    *(u32 *)(bytes + 0xac) = 0x100;
    *(u32 *)(bytes + 0xb0) = 0xc0;
    *(u32 *)(bytes + 0xb8) = 6;
    *(s32 *)(bytes + 0xc0) = -2;
    *(u32 *)(bytes + 0xc4) = 4;
    *(u32 *)(bytes + 0xc8) = 8;
    *(u32 *)(bytes + 0xcc) = 0x14;
    *(u32 *)(bytes + 0xd0) = 0x0e;
    return object;
}

/* Assign one of the seven external text rows (retail 0x02092f88). */
void func_02092f88(void *object, s32 row, void *text)
{
    if (row >= 0 && row < 7) {
        *(void **)((u8 *)object + 0x44 + (u32)row * 4) = text;
    }
}

/* Recompute the retail horizontal text origin (0x02092F28). */
void func_02092f28(void *object)
{
    u8 *bytes = (u8 *)object;
    s32 origin;

    if ((*(u32 *)(bytes + 0x38) & 0x400U) != 0) {
        s32 spacing = *(s32 *)(bytes + 0xb8);
        s32 direction = *(s32 *)(bytes + 0xb4);
        s32 width;

        if (direction > 0)
            spacing = -direction;
        width = GraphicsSpriteRenderer_MeasureText(
            *(void **)(bytes + 0x04), *(const u16 **)(bytes + 0x3c),
            spacing, *(s32 *)(bytes + 0xbc));
        origin = *(s32 *)(bytes + 0xa4) +
                 ((*(s32 *)(bytes + 0xac) +
                   (s32)((u32)*(s32 *)(bytes + 0xac) >> 31)) >> 1) -
                 ((width + (s32)((u32)width >> 31)) >> 1);
    } else {
        origin = *(s32 *)(bytes + 0xa4);
    }
    *(s32 *)(bytes + 0xdc) = origin;
}

/*
 * Install a dialog string and its retail layout mode (0x02092E9C).  Text and
 * font resources remain borrowed; the controller resets its own cursor and
 * timing state and refreshes the recovered sprite renderer immediately.
 */
void func_02092e9c(void *object, const void *text, s32 mode)
{
    u8 *bytes = (u8 *)object;

    *(const void **)(bytes + 0x3c) = text;
    *(u32 *)(bytes + 0x40) = 0;
    *(s32 *)(bytes + 0x30) = mode;
    *(u32 *)(bytes + 0xe0) = *(u32 *)(bytes + 0xa8);
    *(u32 *)(bytes + 0xd8) = 0;
    *(u32 *)(bytes + 0x34) = 1;
    *(u32 *)(bytes + 0x38) = 0;
    func_02074110(*(void **)(bytes + 0x08));
    if ((mode & 1) != 0)
        *(u32 *)(bytes + 0x38) |= 0x80;
    if ((mode & 2) != 0)
        *(u32 *)(bytes + 0x38) |= 0x400;
    if ((mode & 4) != 0)
        *(u32 *)(bytes + 0x38) |= 0x1000;
    GraphicsSpriteRenderer_SetFontResource(*(void **)(bytes + 0x04),
                                            *(void **)(bytes + 0x2c));
    func_02092f28(object);
}

/*
 * Execute the ordinary-text, line-control, and input-gated page-wait portion
 * of the shared dialog VM at 0x02093360. Input halfword 1 uses bit 1 to reveal
 * the current page immediately and bit 0 to dismiss the animated wait marker.
 * Control codes EE02 and EE0B enter that wait state; they differ only in the
 * retained flag bit used by callers. The recovered timing, external-string,
 * drawing-mode, and sound controls preserve the retail cursor and return
 * stack, including row 7's player-name pointer at object offset 0x60.
 */
s32 func_02093360(void *object, const void *input)
{
    u8 *bytes = (u8 *)object;
    u32 *flags = (u32 *)(bytes + 0x38);
    const u16 *inputState = (const u16 *)input;
    const u16 *cursor;

    *flags &= ~(0x200U | 0x2000U);
    GraphicsSpriteGroup_AdvanceAnimations(*(void **)(bytes + 0x08));
    GraphicsSpriteRenderer_SetFontResource(*(void **)(bytes + 0x04),
                                            *(void **)(bytes + 0x2c));

    for (;;) {
        s32 state = *(s32 *)(bytes + 0x34);
        u16 character;

        if (state == 0) {
            *flags = (*flags & ~1U) | 1U;
            return (s32)*flags;
        }
        if (state == 1) {
            *(s32 *)(bytes + 0x34) = 2;
            state = 2;
        }
        if (state == 3) {
            if (*(s32 *)(bytes + 0xd8) > 0) {
                --*(s32 *)(bytes + 0xd8);
                return (s32)*flags;
            }
            *(s32 *)((u8 *)*(void **)(bytes + 0x08) + 0x20) = 1;
            if (inputState == 0 || (inputState[1] & 1U) != 0) {
                *flags &= ~2U;
                func_02074110(*(void **)(bytes + 0x08));
                *(s32 *)(bytes + 0x34) = 2;
                continue;
            }
            return (s32)*flags;
        }
        if (state != 2)
            return (s32)*flags;

        if ((*flags & 0x80U) == 0) {
            if ((*flags & 0x800U) == 0 &&
                (inputState == 0 || (inputState[1] & 2U) != 0)) {
                *(s32 *)(bytes + 0xd8) = 0;
                *flags |= 0x80U;
                if ((*flags & 0x100U) != 0)
                    *flags |= 0x2000U;
            } else if (*(s32 *)(bytes + 0xd8) > 0) {
                --*(s32 *)(bytes + 0xd8);
                return (s32)*flags;
            }
        }
        *flags &= ~0x100U;
        cursor = *(const u16 **)(bytes + 0x3c);
        character = *cursor++;
        *(const u16 **)(bytes + 0x3c) = cursor;
        if (character == 0) {
            const u16 *returnCursor = *(const u16 **)(bytes + 0x40);
            if (returnCursor != 0) {
                *(const u16 **)(bytes + 0x3c) = returnCursor;
                *(const u16 **)(bytes + 0x40) = 0;
            } else {
                *(s32 *)(bytes + 0xd8) = 0;
                *(s32 *)(bytes + 0x34) = 0;
            }
            continue;
        }

        if (character == 0xee00) {
            func_02092f28(object);
            *(s32 *)(bytes + 0xe0) += *(s32 *)(bytes + 0xc0) + 0x10;
            *(s32 *)(bytes + 0xd8) = *(s32 *)(bytes + 0xc8);
            continue;
        }
        if (character >= 0xee00 && character <= 0xee14) {
            /* Resource-record expansion controls remain cursor-aligned until
             * their four dedicated formatting helpers are recovered. */
            switch (character) {
            case 0xee01:
                GraphicsSpriteGroup_Clear(*(void **)(bytes + 0x0c));
                func_02071f38(bytes + 0x20);
                GraphicsSpriteCanvas_FillRect(
                    *(void **)(bytes + 0x04),
                    *(s32 *)(bytes + 0xa4), *(s32 *)(bytes + 0xa8),
                    *(s32 *)(bytes + 0xa4) + *(s32 *)(bytes + 0xac),
                    *(s32 *)(bytes + 0xa8) + *(s32 *)(bytes + 0xb0),
                    *(s32 *)(bytes + 0xd4));
                func_02092e9c(object, cursor, *(s32 *)(bytes + 0x30));
                *(s32 *)(bytes + 0xd8) = *(s32 *)(bytes + 0xcc);
                *flags |= 0x100U;
                break;
            case 0xee02:
            case 0xee0b:
                *flags &= ~0x80U;
                *(s32 *)(bytes + 0xd8) = 0x1e;
                *flags |= 2U;
                *(u16 *)((u8 *)*(void **)(bytes + 0x10) + 0x2c) =
                    (u16)(*(s32 *)(bytes + 0xa4) +
                          *(s32 *)(bytes + 0xac) - 4);
                *(u16 *)((u8 *)*(void **)(bytes + 0x10) + 0x2e) =
                    (u16)(*(s32 *)(bytes + 0xa8) +
                          *(s32 *)(bytes + 0xb0) - 8);
                *(s32 *)(bytes + 0x34) = 3;
                func_02072b68(*(void **)(bytes + 0x10), 0x18);
                if (character != 0xee02)
                    *flags |= 4U;
                break;
            case 0xee03:
            case 0xee04:
                *flags |= 0x80U;
                break;
            case 0xee05:
                *(s32 *)(bytes + 0xd8) = *cursor++;
                *(const u16 **)(bytes + 0x3c) = cursor;
                if ((*flags & 0x80U) != 0)
                    *(s32 *)(bytes + 0xd8) = 0;
                break;
            case 0xee06:
                *(s32 *)(bytes + 0xc4) = *cursor++;
                *(const u16 **)(bytes + 0x3c) = cursor;
                break;
            case 0xee07: {
                u16 row = *cursor++;
                *(const u16 **)(bytes + 0x40) = cursor;
                *(const u16 **)(bytes + 0x3c) =
                    *(const u16 **)(bytes + 0x44 + (u32)row * 4);
                break;
            }
            case 0xee08: {
                u16 mode = *cursor++;
                *(const u16 **)(bytes + 0x3c) = cursor;
                *(s32 *)(bytes + 0xd0) = mode;
                *(u16 *)((u8 *)gGameWork + 0x1d2) = mode;
                break;
            }
            case 0xee09: case 0xee0a: case 0xee0c: case 0xee0d:
            case 0xee0f: case 0xee12:
                *(const u16 **)(bytes + 0x3c) = cursor + 1;
                break;
            case 0xee0e:
                *(u32 *)(bytes + 0xe8) = *cursor++;
                *(const u16 **)(bytes + 0x3c) = cursor;
                *flags |= 0x200U;
                break;
            case 0xee10:
                *flags = (*flags & ~0x80U) | 0x800U;
                break;
            case 0xee11:
                *flags &= ~0x800U;
                break;
            case 0xee13: {
                u16 packed = data_020f25a4[*cursor++];
                *(const u16 **)(bytes + 0x3c) = cursor;
                Sound_Play(gSoundContext, (s32)(packed >> 7),
                           (s32)(packed & 0x7f));
                break;
            }
            case 0xee14:
                *flags &= ~0x1000U;
                break;
            default:
                break;
            }
            continue;
        }

        {
            if ((*flags & 0x1000U) != 0) {
                u16 packed = data_020f25a4[0];
                Sound_Play(gSoundContext, (s32)(packed >> 7),
                           (s32)(packed & 0x7f));
                *flags &= ~0x1000U;
            }
            s32 width = GraphicsSpriteRenderer_DrawCharacter(
                *(void **)(bytes + 0x04), character,
                (u32)*(s32 *)(bytes + 0xdc),
                (u32)*(s32 *)(bytes + 0xe0),
                (u32)*(s32 *)(bytes + 0xd0));
            s32 fixedAdvance = *(s32 *)(bytes + 0xb4);

            if (width >= 0) {
                if (fixedAdvance > 0)
                    *(s32 *)(bytes + 0xdc) += fixedAdvance;
                else if (width > 0)
                    *(s32 *)(bytes + 0xdc) +=
                        width + *(s32 *)(bytes + 0xbc);
                else
                    *(s32 *)(bytes + 0xdc) +=
                        *(s32 *)(bytes + 0xb8) + *(s32 *)(bytes + 0xbc);
            }
            if ((*flags & 0x80U) == 0) {
                *(s32 *)(bytes + 0xd8) = *(s32 *)(bytes + 0xc4);
                return (s32)*flags;
            }
        }
    }
}

/*
 * Reset the controller after a message closes (retail 0x02093998). The two
 * owned sprite groups and the secondary resource triplet are cleared, while
 * the controller and its borrowed renderer remain alive for reuse.
 */
void func_02093998(void *object)
{
    u8 *bytes = (u8 *)object;

    GraphicsSpriteGroup_Clear(*(void **)(bytes + 0x0c));
    func_02071f38(bytes + 0x20);
    func_02074110(*(void **)(bytes + 0x08));
    *(s32 *)(bytes + 0xd8) = 0;
    *(s32 *)(bytes + 0x34) = 0;
}

/*
 * Clear the controller's configured text rectangle (retail 0x020939D8).
 * The renderer is borrowed from the controller; rectangle coordinates are
 * formed from the stored origin and extent, and the configured fill mode is
 * forwarded unchanged to the sprite canvas.
 */
void func_020939d8(void *object)
{
    u8 *bytes = (u8 *)object;

    GraphicsSpriteCanvas_FillRect(
        *(void **)(bytes + 0x04),
        *(s32 *)(bytes + 0xa4), *(s32 *)(bytes + 0xa8),
        *(s32 *)(bytes + 0xa4) + *(s32 *)(bytes + 0xac),
        *(s32 *)(bytes + 0xa8) + *(s32 *)(bytes + 0xb0),
        *(s32 *)(bytes + 0xd4));
}

/* Release the two owned sprite groups and resource triplets while preserving
 * caller-owned controller storage (retail 0x02092E1C). */
void *func_02092e1c(void *object)
{
    u8 *bytes = (u8 *)object;

    *(void **)bytes = data_020f25c4;
    func_0207419c(*(void **)(bytes + 0x08));
    func_0207419c(*(void **)(bytes + 0x0c));
    func_02071eb8(bytes + 0x20);
    func_02071eb8(bytes + 0x14);
    return object;
}

/* Heap-owned deleting destructor (retail 0x02092E58). */
void *func_02092e58(void *object)
{
    func_02092e1c(object);
    Heap_Free(object);
    return object;
}
