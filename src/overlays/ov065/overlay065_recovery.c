/*
 * Recovered overlay 65 randomized effect-scene subsystem.
 *
 * The overlay owns a heap-backed effect controller, several graphics records,
 * a scripted Scene, and randomized placement/motion helpers.  It interacts
 * with actors, Lupy state, sound, and shared rendering APIs.  Unconfirmed
 * object members remain described by offsets.
 */

/* Initializes and allocates the scene's effect-controller record from ABI
 * inputs, changing shared graphics state and returning the controller. */
void func_ov065_0220fd20(void);

/* Configures the controller's two presentation records and derived resource,
 * updates visible state, and returns no meaningful value. */
void func_ov065_0220fdac(void);

/* Initializes or copies one offset-selected graphics descriptor through the
 * shared resource API; it mutates caller-owned state and returns no value. */
void func_ov065_0220fe7c(void);

/* Finalizes a graphics descriptor and submits its derived SDK resource state;
 * it mutates the owner and returns no meaningful value. */
void func_ov065_0220fee8(void);

/* Advances the effect controller, updating motion, randomized values, sound,
 * and shared graphics resources; returns the observable update status. */
void func_ov065_0220ff20(void);

/* Constructs the scene and its three graphics allocations plus effect
 * controller, sets scene flags, and returns the initialized scene. */
void func_ov065_022101bc(void);

/* Destroys scene-owned resources, controller, routed callbacks, and base Scene
 * while retaining the allocation; returns no meaningful value. */
void func_ov065_022103c8(void);

/* Deleting destructor: performs ordinary teardown and conditionally frees the
 * scene allocation according to the ABI deletion flag. */
void func_ov065_022104e0(void);

/* Runs the main scene state machine, updates actors/effects/Lupy state, routes
 * transitions, and returns the frame status. */
void func_ov065_02210600(void);

/* Invokes the scene's indirect transition callback selected from shared
 * routing data and returns its result. */
void func_ov065_022108f8(void);

/* Generates and stores randomized presentation coordinates/parameters in the
 * supplied offset-based record and returns its status/result. */
void func_ov065_0221091c(void);

/* Creates and configures a randomized effect instance, updates controller
 * resources and timers, and returns the constructed instance/result. */
void func_ov065_02210a04(void);
