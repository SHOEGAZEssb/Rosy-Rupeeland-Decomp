/*
 * Recovered overlay 432 interpreter-data subsystem.
 *
 * The overlay registers a three-entry zero-initialized work table, installs
 * an initialized interpreter record, and publishes a separate work word.
 * The meanings of the embedded interpreter bytecode records remain unconfirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov432_02233c60(void);

/* Initialized interpreter data and zero-initialized work storage used by the initializer. */
extern unsigned char data_ov432_022342a2[];
extern unsigned char data_ov432_022342c0[];
extern unsigned char data_ov432_022342c4[];
extern unsigned char data_ov432_022342c8[];
