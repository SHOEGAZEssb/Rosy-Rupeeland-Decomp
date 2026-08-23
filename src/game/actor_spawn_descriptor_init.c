#include "tingle/types.h"

/* Initialize the recovered 0x62-byte descriptor used to spawn runtime actors. */

/*
 * Store the 22 caller-supplied values into descriptor fields +0x00..+0x3c,
 * including the borrowed actor-script pointer at +0x2c, and narrow the recovered
 * halfword and byte fields exactly as shown. Initialize the remaining runtime
 * fields to constants: bounds -16/-49/16/7, clear word
 * +0x48, set halfwords +0x4c/+0x4e/+0x52 to -1, clear +0x50/+0x54/+0x58,
 * set signed bytes +0x5c/+0x5d to -12/-40, byte +0x5e to 12, and clear
 * +0x5f/+0x60. Return no value. No allocation or hardware effect occurs; the
 * destination must provide at least 0x62 writable bytes.
 */
void ActorSpawnDescriptor_Init(
    void *destination, u16 field00, u16 field02, s32 field04,
    s32 field08, s32 field0c, u8 field10, u8 field11,
    u16 field22, u16 field24, u16 field26, u8 field12, u8 field13,
    s32 field28, const s8 *script_2c, s32 field34, s32 field30, s32 field38,
    u16 field3c, u8 field16, u8 field17, u8 field14, u8 field15)
{
    u8 *out = (u8 *)destination;
    *(u16 *)(out + 0x00) = field00;
    *(u16 *)(out + 0x02) = field02;
    *(s32 *)(out + 0x04) = field04;
    *(s32 *)(out + 0x08) = field08;
    *(s32 *)(out + 0x0c) = field0c;
    out[0x10] = field10;
    out[0x11] = field11;
    *(u16 *)(out + 0x22) = field22;
    *(u16 *)(out + 0x24) = field24;
    *(u16 *)(out + 0x26) = field26;
    out[0x12] = field12;
    out[0x13] = field13;
    *(s32 *)(out + 0x28) = field28;
    *(const s8 **)(out + 0x2c) = script_2c;
    *(s32 *)(out + 0x34) = field34;
    *(s32 *)(out + 0x30) = field30;
    *(s32 *)(out + 0x38) = field38;
    *(u16 *)(out + 0x3c) = field3c;
    *(u16 *)(out + 0x3e) = 0;
    out[0x16] = field16;
    out[0x17] = field17;
    out[0x14] = field14;
    out[0x15] = field15;
    *(s16 *)(out + 0x1a) = -16;
    *(s16 *)(out + 0x1c) = -49;
    *(s16 *)(out + 0x1e) = 16;
    *(s16 *)(out + 0x20) = 7;
    *(s32 *)(out + 0x48) = 0;
    *(s16 *)(out + 0x4c) = -1;
    *(s16 *)(out + 0x4e) = -1;
    *(s16 *)(out + 0x50) = 0;
    *(s16 *)(out + 0x52) = -1;
    *(s32 *)(out + 0x54) = 0;
    *(s32 *)(out + 0x58) = 0;
    out[0x5c] = (u8)-12;
    out[0x5d] = (u8)-40;
    out[0x5e] = 12;
    out[0x5f] = 0;
    *(u16 *)(out + 0x60) = 0;
}
