/*
 * Recovered overlay 417 interpreter-data subsystem.
 *
 * The overlay registers a fifteen-entry initialized table, installs an
 * interpreter script record, and publishes a zero-initialized engine work word.
 * Additional embedded record and bytecode semantics remain unconfirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov417_02233c60(void);

/* Initialized registration and script records plus the work word used by the initializer. */
extern unsigned char data_ov417_02233ca0[];
extern unsigned char data_ov417_02233cb0[];
extern unsigned char data_ov417_022343de[];
extern unsigned char data_ov417_02234640[];
