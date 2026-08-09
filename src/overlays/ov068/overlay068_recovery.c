/*
 * Recovered overlay 68 randomized multi-sprite scene subsystem.
 *
 * The scene constructs three related presentation objects, enables the main
 * display, drives randomized motion through a large frame state machine, and
 * owns a small heap-backed helper.  Data and BSS remain in their original
 * sections; uncertain fields retain offset-based descriptions.
 */

/* Constructs the scene and its three presentation objects, initializes their
 * transforms/resources, enables display output, and returns the scene. */
void func_ov068_0220fd20(void);

/* Destroys the heap-backed helper owned by the scene after forwarding through
 * its shared cleanup routine; returns no meaningful value. */
void func_ov068_02210024(void);

/* Applies a shared resource operation to the supplied helper and returns the
 * observable SDK/helper result. */
void func_ov068_02210044(void);

/* Allocates and initializes the scene helper through shared resource APIs and
 * returns the constructed pointer/result. */
void func_ov068_02210070(void);

/* Destroys the scene's presentations, graphics resources, helper, and base
 * Scene while retaining the allocation; returns no meaningful value. */
void func_ov068_022100b0(void);

/* Deleting destructor: performs ordinary teardown and conditionally frees the
 * scene allocation according to the ABI deletion flag. */
void func_ov068_02210140(void);

/* Runs the large randomized frame state machine, updating presentation motion,
 * shared system state, rendering, and debug text; returns frame status. */
void func_ov068_022101d8(void);

/* Invokes the scene's indirect transition callback selected through shared
 * routing data and returns its result. */
void func_ov068_0221071c(void);
