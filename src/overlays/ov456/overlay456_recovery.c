/*
 * Recovered overlay 456 interpreter-data subsystem.
 *
 * The overlay registers three initialized records, installs an embedded
 * interpreter program, and publishes a separate zero-initialized engine work
 * word. Address-derived names remain because the record semantics are not yet
 * confirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov456_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov456_02233ca0[];
extern unsigned char data_ov456_02234432[];
extern unsigned char data_ov456_022346a0[];
extern unsigned char data_ov456_022346a4[];
