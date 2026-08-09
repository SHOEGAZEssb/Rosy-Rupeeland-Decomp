/*
 * Recovered overlay 63 graphics-transition scene subsystem.
 *
 * The scene configures DS display interrupts and sub-engine graphics, owns a
 * heap-backed presentation controller, drives brightness/transitions, and
 * records its active state in GameWork.  Unconfirmed members remain described
 * by address or offset rather than speculative semantic names.
 */

/* Initializes a small offset-based configuration record from ABI inputs; it
 * changes caller-owned memory and returns the prescribed result. */
void func_ov063_0220fd20(void);

/* Constructs the scene, configures VBlank/HBlank and sub-engine graphics,
 * allocates presentation state, sets a GameWork flag, and returns the scene. */
void func_ov063_0220fd54(void);

/* Destroys presentation and graphics resources, clears the GameWork flag, and
 * tears down the base Scene while retaining its allocation. */
void func_ov063_0220fec8(void);

/* Deleting destructor: performs normal scene teardown and conditionally frees
 * the scene allocation according to the ABI deletion flag. */
void func_ov063_0220ff48(void);

/* Runs the main presentation state machine, dispatches indirect steps, updates
 * graphics/Lupy state, and returns the observable frame status. */
void func_ov063_0220ffd0(void);

/* Advances the secondary routed transition, updates shared graphics state,
 * and returns its completion/status result. */
void func_ov063_022101c4(void);

/* Applies the current transition value to both display engines' master
 * brightness registers and returns the resulting state/status. */
void func_ov063_0221028c(void);

/* Releases the heap-backed presentation controller and its shared graphics
 * resources; it returns no meaningful value. */
void func_ov063_02210314(void);

/* Resolves shared routing data and invokes one indirect scene callback,
 * returning that callback's result. */
void func_ov063_02210348(void);

/* Returns the current entry from the overlay's address-derived routing table;
 * it does not itself change state. */
void func_ov063_02210380(void);

/* Implements the scene's confirmed no-op virtual method; its input is ignored,
 * it changes no state, and it returns no value. */
void func_ov063_022103a0(void);

/* Resolves and invokes the second indirect callback from shared routing data,
 * returning the callback result. */
void func_ov063_022103a4(void);

/* Resolves and invokes the third indirect callback from shared routing data,
 * returning the callback result. */
void func_ov063_022103dc(void);

/* Finalizes the scene transition: controls display interrupts, dispatches
 * teardown callbacks, updates GameWork/sound state, and returns status. */
void func_ov063_02210414(void);

/* Frees the pointer supplied in r0 through the game heap API and returns no
 * meaningful value. */
void func_ov063_02210568(void);
