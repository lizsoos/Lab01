	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"lab01.c"
	.text
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	ldr	r3, [r3]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawTriangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTriangle, %function
drawTriangle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mvn	r4, #32768
	ldr	r3, .L13
	rsb	r1, r1, r1, lsl #4
	ldr	ip, [r3]
	add	r1, r0, r1, lsl #4
	sub	r3, r1, #-2147483647
	lsl	lr, r1, #1
	add	r1, ip, #38
	add	r3, ip, r3, lsl #1
	add	r1, r1, lr
.L6:
	strh	r4, [r3, #2]!	@ movhi
	cmp	r3, r1
	bne	.L6
	add	r3, ip, lr
	mov	r2, r3
	add	r1, ip, #9600
	ldr	r0, .L13+4
	add	r1, r1, lr
.L7:
	strh	r0, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L7
	mov	r1, #31744
	add	r2, ip, #9536
	add	r2, r2, #24
	add	r2, r2, lr
.L8:
	strh	r1, [r3, #38]	@ movhi
	add	r3, r3, #476
	add	r3, r3, #2
	cmp	r3, r2
	bne	.L8
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.word	31775
	.size	drawTriangle, .-drawTriangle
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #30
	ldr	r2, .L18
	push	{r4, lr}
	mov	r0, r1
	strh	r2, [r3]	@ movhi
	ldr	r4, .L18+4
	mov	lr, pc
	bx	r4
	mov	r1, #70
	mov	r0, r1
	mov	lr, pc
	bx	r4
	mov	r1, #90
	mov	r0, #100
	mov	lr, pc
	bx	r4
.L16:
	b	.L16
.L19:
	.align	2
.L18:
	.word	1027
	.word	drawTriangle
	.size	main, .-main
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 47) 7.1.0"
