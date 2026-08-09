/*
 * Recovered overlay 60 touch-driven scene subsystem.
 *
 * The overlay owns two touch regions, scene construction/destruction, periodic
 * input dispatch, and an interaction that updates GameWork flags and sound.
 * Field meanings that are not yet confirmed remain described by offsets.
 */

/* Initializes a touch-region object from its input descriptor, changing the
 * region and SDK touch state; it has no meaningful C return value. */
void func_ov060_0220fd20(void);

/* Receives a region callback context, forwards its embedded payload to the
 * shared handler, and returns no value. */
void func_ov060_0220fd54(void);

/* Releases the callback payload selected from the input region and then frees
 * it through the heap API; it returns no value. */
void func_ov060_0220fd68(void);

/* Updates offset-based state for a touch-region owner and synchronizes its
 * visible/interactive state through shared scene helpers; returns no value. */
void func_ov060_0220fd84(void);

/* Stores one inferred interaction state in the object supplied in r0; it has
 * no SDK effects and returns no value. */
void func_ov060_0220fdd8(void);

/* Stores the complementary inferred interaction state in the object supplied
 * in r0; it has no SDK effects and returns no value. */
void func_ov060_0220fdf8(void);

/* Handles a touch press, notifies the SDK region, and updates associated
 * offset-based scene state; returns no value. */
void func_ov060_0220fe18(void);

/* Returns the TouchRegion end-press callback address used by this overlay;
 * it does not change state. */
void func_ov060_0220fe44(void);

/* Applies a touch event to an owner selected through offset-based fields,
 * changing its inferred interaction state; returns no value. */
void func_ov060_0220fe50(void);

/* Returns the TouchRegion tick callback address used by this overlay; it does
 * not change state. */
void func_ov060_0220fec4(void);

/* Forwards an input notification to the SDK touch region held by the supplied
 * object and returns no value. */
void func_ov060_0220fed0(void);

/* Initializes a small offset-based owner record without observable SDK effects
 * and returns the ABI-prescribed result. */
void func_ov060_0220ff00(void);

/* Builds both overlay touch regions, registers them with the scene manager,
 * and allocates their callback payloads; returns the constructed owner. */
void func_ov060_0220ff1c(void);

/* Initializes a compact callback payload from its ABI arguments and returns
 * the initialized pointer. */
void func_ov060_02210098(void);

/* Tears down shared scene resources selected through the supplied object,
 * changing graphics/touch state and returning no value. */
void func_ov060_022100b0(void);

/* Constructs and configures the overlay scene, allocates its private state,
 * installs touch regions, and returns the scene pointer. */
void func_ov060_022100e4(void);

/* Initializes offset-based private scene fields from its ABI inputs; it has no
 * confirmed hardware effects and returns the prescribed object/result. */
void func_ov060_022101fc(void);

/* Destroys scene resources and the private allocation but leaves deletion of
 * the scene object to its caller; returns no value. */
void func_ov060_02210230(void);

/* Deleting destructor: performs the ordinary teardown and frees the scene when
 * requested by the ABI deletion flag; returns the scene pointer/result. */
void func_ov060_0221028c(void);

/* Advances the scene state machine, dispatches its indirect action, ticks touch
 * management, and returns the frame update result. */
void func_ov060_022102f0(void);

/* Invokes the first indirect scene transition callback selected from global
 * routing data and returns its result. */
void func_ov060_02210430(void);

/* Invokes the second indirect scene transition callback selected from global
 * routing data and returns its result. */
void func_ov060_02210450(void);

/* Processes the confirmed interaction: updates shared values, plays sound,
 * sets or clears a GameWork flag, and enables/disables touch input. */
void func_ov060_02210470(void);

/* Classifies the current offset-based interaction value and returns the small
 * state code consumed by the scene update routine. */
void func_ov060_02210584(void);
