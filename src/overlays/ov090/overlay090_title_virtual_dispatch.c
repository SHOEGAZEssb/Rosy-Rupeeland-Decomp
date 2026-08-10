#include "tingle/types.h"

/* Virtual update fan-out used by the phase-90 title controller. */

class TitleVirtualActor {
public:
    virtual void method00();
    virtual void method04();
    virtual void method08();
    virtual void method0c();
    virtual void method10();
    virtual void method14();
    virtual void method18();
    virtual void method1c();
};

/* Dispatch virtual method +0x1c on the three bound actors and controller. */
extern "C" void func_ov090_0221a504(void *self)
{
    s32 i;
    for (i = 0; i < 3; i++) {
        TitleVirtualActor *actor =
            *(TitleVirtualActor **)((u8 *)self + 0x1f4 + i * 4);
        actor->method1c();
    }
    ((TitleVirtualActor *)self)->method1c();
}
