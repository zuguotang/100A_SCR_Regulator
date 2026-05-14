#ifndef __TYPES_H__
#define __TYPES_H__

typedef unsigned char  u8;
typedef unsigned int   u16;
typedef unsigned long  u32;
typedef signed char    s8;

#define SetBit(VAR, Place)  ((VAR) |= (u8)(1 << (Place)))
#define ClrBit(VAR, Place)  ((VAR) &= (u8)(~(u8)(1 << (Place))))

#endif
