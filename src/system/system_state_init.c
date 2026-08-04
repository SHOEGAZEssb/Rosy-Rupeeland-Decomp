#include "tingle/system.h"

/*
 * System-state defaults derived from the DS firmware owner profile. The
 * initializer clears frame/display control fields and selects a supported
 * language, while intentionally leaving the controller-state array intact.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void OS_GetOwnerInfo(void *ownerInfo);

#ifdef __cplusplus
}
#endif

typedef struct OwnerInfoBuffer {
    /* NitroSDK writes a 0x50-byte OSOwnerInfo; byte zero is the language. */
    u8 bytes[0x50];
} OwnerInfoBuffer;

/*
 * Reset the confirmed SystemState control fields, read the firmware owner
 * language, and retain languages 1..5. Zero or values above 5 fall back to 1.
 * There are no inputs or return value; OS_GetOwnerInfo supplies the only SDK
 * side effect and gSystemState receives all observable writes.
 */
void func_02002ea4(void)
{
    OwnerInfoBuffer ownerInfo;

    gSystemState.flags = 0;
    gSystemState.enabledKeyMask = 0;
    gSystemState.unknown5E = 0;
    gSystemState.unknown60 = 0;
    gSystemState.frameCounter = 0;
    gSystemState.unknown68 = 0;

    OS_GetOwnerInfo(&ownerInfo);
    gSystemState.language = ownerInfo.bytes[0];
    switch (gSystemState.language) {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
        break;
    default:
        gSystemState.language = 1;
        break;
    }
}
