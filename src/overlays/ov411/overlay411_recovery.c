/*
 * Recovered overlay 411 interpreter-data subsystem.
 *
 * The overlay registers three initialized interpreter records, installs an
 * additional script record, and publishes a zero-initialized engine work word.
 * Individual record and bytecode semantics remain unconfirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov411_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov411_02233ca0[];
extern unsigned char data_ov411_0223436a[];
extern unsigned char data_ov411_022343c0[];
extern unsigned char data_ov411_022343c4[];
