/*
 * Recovered overlay 415 interpreter-data subsystem.
 *
 * The overlay registers three initialized interpreter records, installs an
 * additional script record, and publishes a zero-initialized engine work word.
 * Individual record and bytecode semantics remain unconfirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov415_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov415_02233ca0[];
extern unsigned char data_ov415_0223436a[];
extern unsigned char data_ov415_022343e0[];
extern unsigned char data_ov415_022343e4[];
