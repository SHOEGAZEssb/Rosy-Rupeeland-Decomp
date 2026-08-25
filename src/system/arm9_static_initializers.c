#include "tingle/types.h"

/*
 * Recovered ARM9 static-initialization block. These compiler-generated entry
 * points construct global objects and register their shutdown destructors in
 * the retail initialization order.
 */
typedef void (*GlobalObjectRoutine)(void *);

#ifdef __cplusplus
extern "C" {
#endif
extern void __register_global_object(void *object,
                                     GlobalObjectRoutine destructor,
                                     void *record);
extern void __construct_array(void *array, u32 count, u32 elementSize,
                              GlobalObjectRoutine constructor,
                              GlobalObjectRoutine destructor);

extern void OwnedPointerList_Init(void *);
extern void OwnedPointerList_Destroy(void *);
extern void PackedTimerArray_Init(void *);
extern void PackedTimerArray_Destroy(void *);
extern void DisplayBrightnessPair_Init(void *);
extern void DisplayBrightnessPair_Destroy(void *);
extern void MainBgPaletteBuffer_Init(void *);
extern void MainBgPaletteBuffer_Destroy(void *);
extern void SubBgPaletteBuffer_Init(void *);
extern void SubBgPaletteBuffer_Destroy(void *);
extern void MainBgExtendedPaletteBuffer_Init(void *);
extern void MainBgExtendedPaletteBuffer_Destroy(void *);
extern void SubBgExtendedPaletteBuffer_Init(void *);
extern void SubBgExtendedPaletteBuffer_Destroy(void *);
extern void ActorRuntimeCollection_Init(void *);
extern void ActorRuntimeCollection_Destroy(void *);
extern void RectS16_InitComponents(void *, s32, s32, s32, s32);
extern void NoOpDestructor(void *);
extern void GraphicsBankStateSnapshot_Init(void *);
extern void GraphicsBankStateSnapshot_Destroy(void *);
extern void PackedTimerRecord_Init(void *);
extern void PackedTimerRecord_Destroy(void *);
extern void PackedTimerRecordArray_DestroyThunk(void *);
extern void PointerSlotArray19_InitAtOffset29C(void *);
extern void func_020646cc(void *);
extern void SelfLinkedSpriteConfig_Init(void *);
extern void TwoWordResourceOwner_Init(void *);
extern void func_0206f760(void *);
extern void FourWordResourceOwner_Init(void *);
extern void func_0206fbe8(void *);
extern void SelfLinkedResourceOwner_Init(void *);
extern void func_0206fdd8(void *);
extern void GraphicsSpriteState_Init(void *);
extern void GraphicsSpriteState_Destroy(void *);
extern void GraphicsSpriteState_DestroyGlobalPool(void *);
extern void RetailResourceDescriptorManager_InitNoOp(void *);
extern void RetailResourceDescriptorManager_DestroyNoOp(void *);
extern void RetailTextDatabaseManager_Init(void *);
extern void RetailTextDatabaseManager_Destroy(void *);
extern void LanguageDatabase_InitEmpty(void *);
extern void LanguageDatabase_DestroyIfLoaded(void *);
extern void RuntimeRecordTable_InitEmpty(void *);
extern void RuntimeRecordTable_DestroyIfLoaded(void *);
extern void RetailRecordDatabase_ConstructEmpty(void *);
extern void RetailRecordDatabase_Destroy(void *);
extern void ActorRuntimeFlags_Init(void *);
extern void ActorRuntimeFlags_Destroy(void *);
extern void FixedRecordArrayOwner_Init(void *);
extern void func_02098450(void *);

extern u8 gFrameTaskList[];
extern u8 gFrameTaskListDestructorRecord[];
extern u8 gPackedTimerArray[];
extern u8 gPackedTimerArrayDestructorRecord[];
extern u8 gDisplayBrightnessPair[];
extern u8 gDisplayBrightnessStorage[];
extern u8 gMainBgPaletteBuffer[];
extern u8 gMainBgPaletteBufferDestructorRecord[];
extern u8 gSubBgPaletteBuffer[];
extern u8 gSubBgPaletteBufferDestructorRecord[];
extern u8 gMainBgExtendedPaletteBuffer[];
extern u8 gMainBgExtendedPaletteBufferDestructorRecord[];
extern u8 gSubBgExtendedPaletteBuffer[];
extern u8 gSubBgExtendedPaletteBufferDestructorRecord[];
extern u8 gActorRuntimeCollection[];
extern u8 gActorRuntimeCollectionDestructorRecord[];
extern u8 gDefaultGamePhaseRegion[];
extern u8 data_021055ac[];
extern u8 data_021055c0[];
extern u8 data_021055a0[];
extern u8 data_021055dc[];
extern u8 data_021055d0[];
extern u8 data_0210588c[];
extern u8 data_02105864[];
extern u8 data_0210587c[];
extern u8 data_02105870[];
extern u8 data_021e9ad0[];
extern u8 data_021e9ac4[];
extern u8 data_021e9db8[];
extern u8 data_021e9de8[];
extern u8 data_021e9ddc[];
extern u8 data_021e9e00[];
extern u8 data_021e9df4[];
extern u8 data_021e9e1c[];
extern u8 data_021e9e10[];
extern u8 gGraphicsSpriteStates[];
extern u8 gGraphicsSpriteStatePoolDestructorRecord[];
extern u8 data_021f38fc[];
extern u8 data_021f38f0[];
extern u8 data_021f3ecc[];
extern u8 data_021f3d44[];
extern u8 gLanguageDatabase[];
extern u8 data_021f3d50[];
extern u8 data_021f3d68[];
extern u8 data_021f3d5c[];
extern u8 data_021f5138[];
extern u8 data_021f512c[];
extern u8 gActorRuntimeFlags[];
extern u8 gActorRuntimeFlagsDestructorRecord[];
extern u8 data_021f5f18[];
extern u8 data_021f5f0c[];
#ifdef __cplusplus
}
#endif

/*
 * No inputs. Construct gFrameTaskList and register OwnedPointerList_Destroy
 * with record gFrameTaskListDestructorRecord for shutdown. Global task-list lifetime state
 * changes; the routine returns no value and has no direct hardware effect.
 */
void __sinit_020c1374(void)
{
    OwnedPointerList_Init(gFrameTaskList);
    __register_global_object(gFrameTaskList, OwnedPointerList_Destroy,
                             gFrameTaskListDestructorRecord);
}

/*
 * No inputs. Construct gPackedTimerArray and register PackedTimerArray_Destroy
 * with record gPackedTimerArrayDestructorRecord. Global timer-bank lifetime state changes; no value
 * is returned and no SDK or hardware service is called directly.
 */
void __sinit_020c13a0(void)
{
    PackedTimerArray_Init(gPackedTimerArray);
    __register_global_object(gPackedTimerArray, PackedTimerArray_Destroy,
                             gPackedTimerArrayDestructorRecord);
}

/*
 * No inputs. Construct gDisplayBrightnessPair and register
 * DisplayBrightnessPair_Destroy with record gDisplayBrightnessStorage. Global
 * subsystem lifetime state changes; this routine returns no value and has no
 * direct hardware effect.
 */
void __sinit_020c13cc(void)
{
    DisplayBrightnessPair_Init(gDisplayBrightnessPair);
    __register_global_object(gDisplayBrightnessPair,
                             DisplayBrightnessPair_Destroy,
                             gDisplayBrightnessStorage);
}

/*
 * No inputs. Construct the main/sub standard and extended background-palette
 * buffers, registering each matching destructor and its adjacent lifetime
 * record. Four global buffer lifetimes change; constructors may initialize
 * presentation state, but this wrapper has no direct hardware access or return.
 */
void __sinit_020c13f8(void)
{
    MainBgPaletteBuffer_Init(gMainBgPaletteBuffer);
    __register_global_object(gMainBgPaletteBuffer, MainBgPaletteBuffer_Destroy,
                             gMainBgPaletteBufferDestructorRecord);
    SubBgPaletteBuffer_Init(gSubBgPaletteBuffer);
    __register_global_object(gSubBgPaletteBuffer, SubBgPaletteBuffer_Destroy,
                             gSubBgPaletteBufferDestructorRecord);
    MainBgExtendedPaletteBuffer_Init(gMainBgExtendedPaletteBuffer);
    __register_global_object(gMainBgExtendedPaletteBuffer,
                             MainBgExtendedPaletteBuffer_Destroy,
                             gMainBgExtendedPaletteBufferDestructorRecord);
    SubBgExtendedPaletteBuffer_Init(gSubBgExtendedPaletteBuffer);
    __register_global_object(gSubBgExtendedPaletteBuffer,
                             SubBgExtendedPaletteBuffer_Destroy,
                             gSubBgExtendedPaletteBufferDestructorRecord);
}

/*
 * No inputs. Construct gActorRuntimeCollection and register ActorRuntimeCollection_Destroy with record
 * gActorRuntimeCollectionDestructorRecord. Global object lifetime state changes; no value is returned and
 * no hardware is accessed directly.
 */
void __sinit_020c1490(void)
{
    ActorRuntimeCollection_Init(gActorRuntimeCollection);
    __register_global_object(gActorRuntimeCollection, ActorRuntimeCollection_Destroy, gActorRuntimeCollectionDestructorRecord);
}

/*
 * No inputs. Initialize gDefaultGamePhaseRegion with recovered values
 * (0,0,0x400,0x300) and data_021055c0 with five zeros, then register
 * NoOpDestructor for each using records data_021055ac/data_021055a0. Both
 * global object lifetimes change; no value or direct hardware effect occurs.
 */
void __sinit_020c14bc(void)
{
    RectS16_InitComponents(gDefaultGamePhaseRegion, 0, 0, 0x400, 0x300);
    __register_global_object(gDefaultGamePhaseRegion, NoOpDestructor, data_021055ac);
    RectS16_InitComponents(data_021055c0, 0, 0, 0, 0);
    __register_global_object(data_021055c0, NoOpDestructor, data_021055a0);
}

/*
 * No inputs. Construct data_021055dc and register GraphicsBankStateSnapshot_Destroy with record
 * data_021055d0. Global lifetime state changes; no value is returned and no
 * direct hardware access occurs.
 */
void __sinit_020c152c(void)
{
    GraphicsBankStateSnapshot_Init(data_021055dc);
    __register_global_object(data_021055dc, GraphicsBankStateSnapshot_Destroy, data_021055d0);
}

/*
 * No inputs. Construct 32 elements of size 0x10 at data_0210588c using
 * PackedTimerRecord_Init/PackedTimerRecord_Destroy and register the array destructor thunk
 * PackedTimerRecordArray_DestroyThunk with a null object and record data_02105864. Then construct
 * data_0210587c and register PackedTimerRecord_Destroy with data_02105870. Global array and
 * singleton lifetimes change; no value or direct hardware effect occurs.
 */
void __sinit_020c1558(void)
{
    __construct_array(data_0210588c, 0x20, 0x10,
                      PackedTimerRecord_Init, PackedTimerRecord_Destroy);
    __register_global_object(0, PackedTimerRecordArray_DestroyThunk, data_02105864);
    PackedTimerRecord_Init(data_0210587c);
    __register_global_object(data_0210587c, PackedTimerRecord_Destroy, data_02105870);
}

/*
 * No inputs. Construct data_021e9ad0 and register func_020646cc with record
 * data_021e9ac4. Global lifetime state changes; this routine returns no value
 * and has no direct hardware effect.
 */
void __sinit_020c15c0(void)
{
    PointerSlotArray19_InitAtOffset29C(data_021e9ad0);
    __register_global_object(data_021e9ad0, func_020646cc, data_021e9ac4);
}

/*
 * No inputs. Initialize data_021e9db8 by calling SelfLinkedSpriteConfig_Init. The retail body
 * is a tail call. Global configuration state changes; no value is returned and
 * no direct SDK or hardware effect is introduced here.
 */
void __sinit_020c15ec(void)
{
    SelfLinkedSpriteConfig_Init(data_021e9db8);
}

/*
 * No inputs. Construct data_021e9de8 and register func_0206f760 with record
 * data_021e9ddc. Global lifetime state changes; no value or direct hardware
 * effect occurs.
 */
void __sinit_020c1600(void)
{
    TwoWordResourceOwner_Init(data_021e9de8);
    __register_global_object(data_021e9de8, func_0206f760, data_021e9ddc);
}

/*
 * No inputs. Construct data_021e9e00 and register func_0206fbe8 with record
 * data_021e9df4. Global lifetime state changes; no value is returned and no
 * hardware is accessed directly.
 */
void __sinit_020c162c(void)
{
    FourWordResourceOwner_Init(data_021e9e00);
    __register_global_object(data_021e9e00, func_0206fbe8, data_021e9df4);
}

/*
 * No inputs. Construct data_021e9e1c and register func_0206fdd8 with record
 * data_021e9e10. Global lifetime state changes; no value or direct hardware
 * effect occurs.
 */
void __sinit_020c1658(void)
{
    SelfLinkedResourceOwner_Init(data_021e9e1c);
    __register_global_object(data_021e9e1c, func_0206fdd8, data_021e9e10);
}

/*
 * No inputs. Construct 384 elements of size 0x3c at gGraphicsSpriteStates
 * using GraphicsSpriteState_Init/GraphicsSpriteState_Destroy, then register
 * the GraphicsSpriteState_DestroyGlobalPool array-destructor thunk with a null
 * object and gGraphicsSpriteStatePoolDestructorRecord. Global pool lifetime
 * state changes; no value or direct hardware effect occurs.
 */
void __sinit_020c1684(void)
{
    __construct_array(gGraphicsSpriteStates, 0x180, 0x3c,
                      GraphicsSpriteState_Init, GraphicsSpriteState_Destroy);
    __register_global_object(0, GraphicsSpriteState_DestroyGlobalPool,
                             gGraphicsSpriteStatePoolDestructorRecord);
}

/*
 * No inputs. Construct data_021f38fc and register the manager's no-op
 * destructor with record data_021f38f0. Global lifetime state changes; no value
 * or direct hardware effect occurs.
 */
void __sinit_020c16cc(void)
{
    RetailResourceDescriptorManager_InitNoOp(data_021f38fc);
    __register_global_object(data_021f38fc,
                             RetailResourceDescriptorManager_DestroyNoOp,
                             data_021f38f0);
}

/*
 * No inputs. Construct three globals in retail order: data_021f3ecc,
 * gLanguageDatabase, and data_021f3d68. Register their respective destructors
 * RetailTextDatabaseManager_Destroy, LanguageDatabase_DestroyIfLoaded, and RuntimeRecordTable_DestroyIfLoaded with records
 * data_021f3d44/data_021f3d50/data_021f3d5c. Global lifetimes change; no value
 * is returned and no direct hardware effect occurs.
 */
void __sinit_020c16f8(void)
{
    RetailTextDatabaseManager_Init(data_021f3ecc);
    __register_global_object(data_021f3ecc, RetailTextDatabaseManager_Destroy, data_021f3d44);
    LanguageDatabase_InitEmpty(gLanguageDatabase);
    __register_global_object(gLanguageDatabase, LanguageDatabase_DestroyIfLoaded, data_021f3d50);
    RuntimeRecordTable_InitEmpty(data_021f3d68);
    __register_global_object(data_021f3d68, RuntimeRecordTable_DestroyIfLoaded, data_021f3d5c);
}

/*
 * No inputs. Construct data_021f5138 and register its destructor with record
 * data_021f512c. Global lifetime state changes; no value or direct hardware
 * effect occurs.
 */
void __sinit_020c176c(void)
{
    RetailRecordDatabase_ConstructEmpty(data_021f5138);
    __register_global_object(data_021f5138, RetailRecordDatabase_Destroy,
                             data_021f512c);
}

/*
 * No inputs. Clear gActorRuntimeFlags and register ActorRuntimeFlags_Destroy
 * with record gActorRuntimeFlagsDestructorRecord. Global lifetime state changes; no value is
 * returned and no hardware is accessed directly.
 */
void __sinit_020c1798(void)
{
    ActorRuntimeFlags_Init(gActorRuntimeFlags);
    __register_global_object(gActorRuntimeFlags, ActorRuntimeFlags_Destroy, gActorRuntimeFlagsDestructorRecord);
}

/*
 * No inputs. Construct data_021f5f18 and register func_02098450 with record
 * data_021f5f0c. Global lifetime state changes; no value or direct hardware
 * effect occurs.
 */
void __sinit_020c17c4(void)
{
    FixedRecordArrayOwner_Init(data_021f5f18);
    __register_global_object(data_021f5f18, func_02098450, data_021f5f0c);
}
