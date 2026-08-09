/*
 * Recovered overlay 416 interpreter-data subsystem.
 *
 * The overlay registers three initialized top-level records, installs an
 * interpreter script record, and publishes a zero-initialized engine work word.
 * Additional embedded record and bytecode semantics remain unconfirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov416_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov416_02233ca0[];
extern unsigned char data_ov416_022343ce[];
extern unsigned char data_ov416_02234640[];
extern unsigned char data_ov416_02234644[];
