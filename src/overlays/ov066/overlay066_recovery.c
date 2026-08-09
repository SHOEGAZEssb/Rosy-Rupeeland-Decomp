/*
 * Recovered overlay 66 touch-driven four-slot presentation scene.
 *
 * The overlay configures display state, allocates four related presentation
 * slots, samples touch input, and drives randomized geometry and animation.
 * It owns scene lifecycle and associated graphics resources; unconfirmed
 * fields retain offset-based descriptions.
 */

/* Initializes a compact offset-based configuration record from ABI inputs;
 * it changes caller-owned memory and returns the prescribed result. */
void func_ov066_0220fd20(void);

/* Constructs the scene, configures DS graphics, allocates private state,
 * initializes presentation slots and callbacks, and returns the scene. */
void func_ov066_0220fd3c(void);

/* Returns an address-derived overlay configuration value without changing
 * state or invoking SDK services. */
void func_ov066_0220fe40(void);

/* Implements a confirmed scene no-op virtual method; it ignores its input,
 * changes no state, and returns no value. */
void func_ov066_0220fe54(void);

/* Destroys the presentation controller and base Scene while retaining the
 * scene allocation; returns no meaningful value. */
void func_ov066_0220fe58(void);

/* Deleting destructor: performs ordinary teardown and conditionally frees the
 * scene allocation according to the ABI deletion flag. */
void func_ov066_0220fe98(void);

/* Generates randomized controller parameters, derives bounded values, and
 * applies them to a presentation slot; returns the update result. */
void func_ov066_0220fee0(void);

/* Runs the main touch-driven frame state machine, sampling the touch manager,
 * updating all slots and animations, and returning frame status. */
void func_ov066_0220ff60(void);

/* Advances the scene's secondary routed transition and returns its completion
 * status after shared presentation updates. */
void func_ov066_02210410(void);

/* Frees the pointer supplied in r0 through the game heap API and returns no
 * meaningful value. */
void func_ov066_02210444(void);

/* Initializes one presentation slot, connecting its geometry, graphics, and
 * offset-selected owner fields; returns the initialized slot/result. */
void func_ov066_02210458(void);

/* Returns the shared configuration entry used to initialize a slot; it has no
 * observable state changes. */
void func_ov066_02210514(void);

/* Releases or resets one slot's graphics resource through shared APIs and
 * returns no meaningful value. */
void func_ov066_02210534(void);

/* Updates one slot's geometry/animation from its offset-based fields and ABI
 * inputs; it changes render state and returns the computed status. */
void func_ov066_02210550(void);

/* Initializes the four presentation slots and their SDK graphics objects,
 * installs callbacks, and returns the controller/result. */
void func_ov066_022107ac(void);

/* Initializes a small address-derived slot helper record without direct SDK
 * effects and returns the ABI-prescribed result. */
void func_ov066_02210958(void);

/* Destroys all slot graphics resources and controller allocations, changing
 * shared graphics state and returning no meaningful value. */
void func_ov066_0221096c(void);

/* Allocates and initializes a randomized presentation instance and returns the
 * constructed pointer/result. */
void func_ov066_02210a00(void);

/* Updates a presentation instance, rebuilding geometry when required and
 * applying animation state; returns the observable update status. */
void func_ov066_02210a9c(void);

/* Recomputes the instance's detailed geometry and animation parameters using
 * shared world helpers; it mutates render state and returns no value. */
void func_ov066_02210b20(void);

/* Returns the address-derived geometry configuration used by the instance;
 * it changes no state. */
void func_ov066_02210e54(void);

/* Copies the current geometry configuration into the supplied output record
 * and returns the ABI-prescribed result without direct hardware effects. */
void func_ov066_02210e70(void);
