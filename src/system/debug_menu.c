#include "tingle/debug_menu.h"
#include "tingle/system.h"

/*
 * Hidden debug-menu scene recovered from the retail ARM9 binary. Constructors
 * whose roles are still unknown retain their address-derived names; the switch
 * below records only their observed allocation sizes and call relationships.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void Scene_Init(void *scene);
extern void Scene_Destroy(void *scene);
extern void *Heap_Alloc(u32 size, const char *tag, u32 alignment, void *heap);
extern void Heap_Free(void *allocation);

extern void DebugText_BeginFrame(void);
extern void DebugText_Printf(void *font, int layer, int row, void *renderer,
                             const char *format, ...);
extern void Sound_Play(void *context, int arg1, int soundId);

extern void func_020ae920(void);
extern void func_020ae934(void);
extern void DebugPhaseSelector_Init(void *scene);
extern void func_02090b64(void *scene);
extern void func_02091098(void *scene);
extern void func_020966d8(void *scene);
extern void func_020967b0(void *scene);
extern void func_020985f4(void *scene);
extern void func_02098698(void *scene);
extern void func_02098de0(void *scene);
extern void func_02098fbc(void *scene);
extern void func_0209939c(void *scene);
extern void func_02098a10(void *scene);

extern char gDebugBuildDateText[];
extern char gDebugTimezoneText[];
extern char gDebugSdkVersionFormat[];
extern char gDebugMenuScene0Tag[];
extern char gDebugMenuSceneTag[];
extern void *gDebugFont;
extern void *gDebugTextRenderer;
extern void *gHeapContext;
extern void *gSoundContext;
extern DebugMenuVTable gDebugScene6VTable;

#ifdef __cplusplus
}

class DebugMenuDeleteProxy {
public:
    virtual ~DebugMenuDeleteProxy();
};
#endif

DebugMenuVTable gDebugMenuVTable = {
    DebugMenu_Destroy,
    DebugMenu_DestroyAndFree,
    DebugMenu_Update,
};

/* Construct the scene base, install this scene's vtable, and select item zero. */
DebugMenu *DebugMenu_Init(DebugMenu *menu)
{
    Scene_Init(menu);
    menu->vtable = &gDebugMenuVTable;
    menu->selection = 0;
    return menu;
}

/* Run the base scene destructor without releasing the allocation. */
DebugMenu *DebugMenu_Destroy(DebugMenu *menu)
{
    Scene_Destroy(menu);
    return menu;
}

/* Destroy a heap-owned menu and release its allocation. */
DebugMenu *DebugMenu_DestroyAndFree(DebugMenu *menu)
{
    Scene_Destroy(menu);
    Heap_Free(menu);
    return menu;
}

/*
 * Draw build information, navigate the two-column list, and launch the scene
 * represented by the selected entry when A is pressed.
 */
int DebugMenu_Update(DebugMenu *menu)
{
    u16 pressed;
    int selection;
    void *scene;

    DebugText_BeginFrame();
    DebugText_Printf(gDebugFont, 1, 20, gDebugTextRenderer,
                     gDebugBuildDateText);
    DebugText_Printf(gDebugFont, 1, 21, gDebugTextRenderer,
                     gDebugTimezoneText);
    DebugText_Printf(gDebugFont, 1, 18, gDebugTextRenderer,
                     gDebugSdkVersionFormat, 3, 2, 0x7530);

    /* Up/down move by rows; left/right toggle the column within a row. */
    pressed = gSystemState.pads[0].pressed;
    if ((pressed & 0x40) != 0) {
        menu->selection -= 2;
        if (menu->selection < 0) {
            menu->selection += 13;
        }
        Sound_Play(gSoundContext, 0, 0);
    } else if ((pressed & 0x80) != 0) {
        menu->selection += 2;
        if (menu->selection >= 13) {
            menu->selection -= 13;
        }
        Sound_Play(gSoundContext, 0, 0);
    } else if ((pressed & 0x30) != 0) {
        if ((menu->selection & 1) != 0) {
            menu->selection--;
        } else {
            menu->selection++;
        }
        Sound_Play(gSoundContext, 0, 0);
    }

    if ((gSystemState.pads[0].pressed & 1) == 0) {
        goto done;
    }

    /* The menu destroys itself before handing control to the selected scene. */
    selection = menu->selection;
#ifdef __cplusplus
    delete reinterpret_cast<DebugMenuDeleteProxy *>(menu);
#else
    if (menu != 0) {
        menu->vtable->destroyAndFree(menu);
    }
#endif

    /* Scene meanings remain unknown, so keep the original numeric dispatch. */
    switch (selection) {
    case 0:
        func_020ae920();
        func_020ae934();
        scene = Heap_Alloc(0x4c, gDebugMenuScene0Tag, 4, &gHeapContext);
        if (scene != 0) {
            DebugPhaseSelector_Init(scene);
        }
        break;
    case 1:
        scene = Heap_Alloc(0x24, gDebugMenuSceneTag, 4, &gHeapContext);
        if (scene != 0) {
            func_02090b64(scene);
        }
        break;
    case 2:
        break;
    case 3:
        scene = Heap_Alloc(0x6c, gDebugMenuSceneTag, 4, &gHeapContext);
        if (scene != 0) {
            func_02091098(scene);
        }
        break;
    case 4:
        scene = Heap_Alloc(0x24, gDebugMenuSceneTag, 4, &gHeapContext);
        if (scene != 0) {
            func_020966d8(scene);
        }
        break;
    case 5:
        scene = Heap_Alloc(0x3c, gDebugMenuSceneTag, 4, &gHeapContext);
        if (scene != 0) {
            func_020967b0(scene);
        }
        break;
    case 6:
        func_020ae920();
        func_020ae934();
        scene = Heap_Alloc(0x24, gDebugMenuSceneTag, 4, &gHeapContext);
        if (scene != 0) {
            Scene_Init(scene);
            *(DebugMenuVTable **)scene = &gDebugScene6VTable;
        }
        break;
    case 7:
        scene = Heap_Alloc(0x24, gDebugMenuSceneTag, 4, &gHeapContext);
        if (scene != 0) {
            func_020985f4(scene);
        }
        break;
    case 8:
        scene = Heap_Alloc(0x30, gDebugMenuSceneTag, 4, &gHeapContext);
        if (scene != 0) {
            func_02098698(scene);
        }
        return 0;
    case 9:
        scene = Heap_Alloc(0x34, gDebugMenuSceneTag, 4, &gHeapContext);
        if (scene != 0) {
            func_02098de0(scene);
        }
        break;
    case 10:
        scene = Heap_Alloc(0x3c, gDebugMenuSceneTag, 4, &gHeapContext);
        if (scene != 0) {
            func_02098fbc(scene);
        }
        break;
    case 11:
        scene = Heap_Alloc(0x2c, gDebugMenuSceneTag, 4, &gHeapContext);
        if (scene != 0) {
            func_0209939c(scene);
        }
        break;
    case 12:
        scene = Heap_Alloc(0x88, gDebugMenuSceneTag, 4, &gHeapContext);
        if (scene != 0) {
            func_02098a10(scene);
        }
        break;
    }

    Sound_Play(gSoundContext, 0, 10);

done:
    return 0;
}

/* Allocate and construct a debug menu from the game's main heap context. */
DebugMenu *DebugMenu_Create(void)
{
    DebugMenu *menu =
        (DebugMenu *)Heap_Alloc(sizeof(DebugMenu), gDebugMenuSceneTag, 4,
                                &gHeapContext);

    if (menu != 0) {
        menu = DebugMenu_Init(menu);
    }
    return menu;
}
