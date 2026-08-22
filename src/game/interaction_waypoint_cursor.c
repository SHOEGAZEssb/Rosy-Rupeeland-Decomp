#include "tingle/types.h"

/*
 * Recovered cursor over 12-byte waypoint records containing two coordinates,
 * a continuation marker, and a time-like scalar.
 */

#ifdef __cplusplus
extern "C" {
#endif

s32 InteractionWaypointCursor_CountRecords(const void *self);

/*
 * Store waypoint table at cursor +0, count its records, find the record with
 * smallest squared distance from input coordinates x/y using record words
 * +0/+4, store its index at +4, and return no value. Cursor state changes;
 * arithmetic is integer and no hardware access occurs.
 */
void InteractionWaypointCursor_InitNearest(void *self,
                                           const void *waypointTable,
                                           s32 x, s32 y)
{
    u8 *cursor = (u8 *)self;
    const u8 *table = (const u8 *)waypointTable;
    s32 count;
    s32 bestIndex = 0;
    s32 bestDistance = 0x7fffffff;
    s32 i;
    *(const void **)cursor = waypointTable;
    count = InteractionWaypointCursor_CountRecords(cursor);
    for (i = 0; i < count; ++i) {
        const u8 *record = table + i * 12;
        s32 dx = x - *(const s32 *)(record + 0);
        s32 dy = y - *(const s32 *)(record + 4);
        s32 distance = dx * dx + dy * dy;
        if (distance < bestDistance) {
            bestIndex = i;
            bestDistance = distance;
        }
    }
    *(s32 *)(cursor + 4) = bestIndex;
}

/*
 * Recompute and store the nearest waypoint index for coordinates x/y using the
 * cursor's existing table. Returns no value; only cursor +4 changes.
 */
void InteractionWaypointCursor_SelectNearest(void *self, s32 x, s32 y)
{
    u8 *cursor = (u8 *)self;
    const u8 *table = *(const u8 **)cursor;
    s32 count = InteractionWaypointCursor_CountRecords(cursor);
    s32 bestIndex = 0;
    s32 bestDistance = 0x7fffffff;
    s32 i;
    for (i = 0; i < count; ++i) {
        const u8 *record = table + i * 12;
        s32 dx = x - *(const s32 *)(record + 0);
        s32 dy = y - *(const s32 *)(record + 4);
        s32 distance = dx * dx + dy * dy;
        if (distance < bestDistance) {
            bestIndex = i;
            bestDistance = distance;
        }
    }
    *(s32 *)(cursor + 4) = bestIndex;
}

/*
 * Increment cursor index +4. If the new record's halfword marker +8 is zero,
 * wrap the index to zero; marker one and all other values retain the increment.
 * Returns no meaningful value and changes only cursor state.
 */
void InteractionWaypointCursor_Advance(void *self)
{
    u8 *cursor = (u8 *)self;
    const u8 *table = *(const u8 **)cursor;
    s32 index = ++*(s32 *)(cursor + 4);
    if (*(const u16 *)(table + index * 12 + 8) == 0)
        *(s32 *)(cursor + 4) = 0;
}

/*
 * Return the current 12-byte waypoint record; no state or hardware changes
 * occur.
 */
const void *InteractionWaypointCursor_GetCurrentRecord(const void *self)
{
    const u8 *cursor = (const u8 *)self;
    return *(const u8 *const *)cursor + *(const s32 *)(cursor + 4) * 12;
}

/*
 * Return a pointer to current waypoint Y word at +4; no state or hardware
 * changes occur.
 */
const void *InteractionWaypointCursor_GetCurrentYPointer(const void *self)
{
    return (const u8 *)InteractionWaypointCursor_GetCurrentRecord(self) + 4;
}

/*
 * Return current waypoint halfword +0x0a multiplied by 60. Extended actors use
 * the result as a frame countdown; no state or hardware changes occur.
 */
s32 InteractionWaypointCursor_GetCurrentDurationFrames(const void *self)
{
    const u8 *record =
        (const u8 *)InteractionWaypointCursor_GetCurrentRecord(self);
    return *(const u16 *)(record + 0x0a) * 60;
}

/*
 * Count 12-byte records until halfword marker +8 is zero and return the count,
 * excluding that sentinel record. No state or hardware changes occur.
 */
s32 InteractionWaypointCursor_CountRecords(const void *self)
{
    const u8 *table = *(const u8 *const *)self;
    s32 count = 0;
    while (*(const u16 *)(table + count * 12 + 8) != 0)
        ++count;
    return count;
}

#ifdef __cplusplus
}
#endif
