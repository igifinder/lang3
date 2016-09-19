.macro padded_string string, max
1:
    .ascii "\string"
2:
    .iflt \max - (2b - 1b)
    .error "String too long"
    .endif

    .ifgt \max - (2b - 1b)
    .zero \max - (2b - 1b)
    .endif

    .endm

.equ spr_list_xa, 0x06000C00
.equ spr_list_ya, 0x06000D60
.equ spr_list_num, 0x06088518
.equ spr_list_dispenable, 0x06000EC0

num_files:                 .long 4 ! Number of files to patch

! File 1
filename1:                  padded_string "A0LANG.BIN", 260 ! File to patch
file1_num_functions:       .long 5 ! Number of patches
! Patch 1
file1_func1_offset:        .long 0x8D38 ! Offset in File to Patch
file1_func1_max_size:      .long 0x30 ! Function Size
file1_func1_patch_offset:  .long sub_6016D38 ! New Function code
file1_func1_patch_size:    .long sub_6016D38_end-sub_6016D38+4
! Patch 2
file1_func2_offset:        .long 0x8D94 ! Offset in File to Patch
file1_func2_max_size:      .long 0x16C ! Function Size
file1_func2_patch_offset:  .long sub_6016D94 ! New Function code
file1_func2_patch_size:    .long off_6016EFC-sub_6016D94+4
! Patch 3
file1_func3_offset:        .long 0x8F00 ! Offset in File to Patch
file1_func3_max_size:      .long 0xCC ! Function Size
file1_func3_patch_offset:  .long sub_6016F00 ! New Function code
file1_func3_patch_size:    .long dword_6016FC8-sub_6016F00+4
! Patch 4
file1_func4_offset:        .long 0x9438 ! Offset in File to Patch
file1_func4_max_size:      .long 0x1C4 ! Function Size
file1_func4_patch_offset:  .long sub_6017438 ! New Function code
file1_func4_patch_size:    .long off_60175F8-sub_6017438+4
! Patch 5
file1_func5_offset:        .long 0x9748 ! Offset in File to Patch
file1_func5_max_size:      .long 0x58 ! Function Size
file1_func5_patch_offset:  .long sub_6017748 ! New Function code
file1_func5_patch_size:    .long sub_6017748_end-sub_6017748

! File 2
filename2:                 padded_string "LANG\\PROG_3.BIN", 260 ! File to patch 
file2_num_functions:       .long 10 ! Number of patches
! Patch 1
file2_func1_offset:        .long 0x29778 ! Offset in File to Patch
file2_func1_max_size:      .long 0x4C4 ! Function Size
file2_func1_patch_offset:  .long sub_607BF78 ! New Function code
file2_func1_patch_size:    .long off_607C438-sub_607BF78+4
! Patch 2
file2_func2_offset:        .long 0x2A4B8 ! Offset in File to Patch
file2_func2_max_size:      .long 0xAC ! Function Size
file2_func2_patch_offset:  .long sub_607CCB8 ! New Function code
file2_func2_patch_size:    .long off_607CD60-sub_607CCB8+4
! Patch 3
file2_func3_offset:        .long 0x2A564 ! Offset in File to Patch
file2_func3_max_size:      .long 0x1E4 ! Function Size
file2_func3_patch_offset:  .long sub_607CD64 ! New Function code
file2_func3_patch_size:    .long off_607CF44-sub_607CD64+4
! Patch 4
file2_func4_offset:        .long 0x2A748 ! Offset in File to Patch
file2_func4_max_size:      .long 0x44 ! Function Size
file2_func4_patch_offset:  .long sub_607CF48 ! New Function code
file2_func4_patch_size:    .long off_607CF88-sub_607CF48+4
! Patch 5
file2_func5_offset:        .long 0x2A78C ! Offset in File to Patch
file2_func5_max_size:      .long 0x138 ! Function Size
file2_func5_patch_offset:  .long sub_607CF8C ! New Function code
file2_func5_patch_size:    .long off_607D0C0-sub_607CF8C+4
! Patch 6
file2_func6_offset:        .long 0x2A8C4 ! Offset in File to Patch
file2_func6_max_size:      .long 0xB0 ! Function Size
file2_func6_patch_offset:  .long sub_607D0C4 ! New Function code
file2_func6_patch_size:    .long dword_607D170-sub_607D0C4+4
! Patch 7
file2_func7_offset:        .long 0x2A974 ! Offset in File to Patch
file2_func7_max_size:      .long 0xBC ! Function Size
file2_func7_patch_offset:  .long sub_607D174 ! New Function code
file2_func7_patch_size:    .long off_607D22C-sub_607D174+4
! Patch 8
file2_func8_offset:        .long 0x2AA30 ! Offset in File to Patch
file2_func8_max_size:      .long 0x2C0 ! Function Size
file2_func8_patch_offset:  .long sub_607D230 ! New Function code
file2_func8_patch_size:    .long off_607D4E8-sub_607D230+4
! Patch 9
file2_func9_offset:        .long 0x2C710 ! Offset in File to Patch
file2_func9_max_size:      .long 0x430 ! Function Size
file2_func9_patch_offset:  .long sub_607EF10 ! New Function code
file2_func9_patch_size:    .long off_607F33C-sub_607EF10+4
! Patch 10
file2_func10_offset:        .long 0x2CB70 ! Offset in File to Patch
file2_func10_max_size:      .long 0x148 ! Function Size
file2_func10_patch_offset:  .long sub_607F370 ! New Function code
file2_func10_patch_size:    .long off_607F4B4-sub_607F370+4

! File 3
filename3:                 padded_string "LANG\\PROG_4.BIN", 260 ! File to patch 
file3_num_functions:       .long 1 ! Number of patches
! Patch 1
file3_func1_offset:        .long 0x89D0 ! Offset in File to Patch
file3_func1_max_size:      .long 0x764 ! Function Size
file3_func1_patch_offset:  .long sub_60919D0 ! New Function code
file3_func1_patch_size:    .long off_6092130-sub_60919D0+4

! File 4
filename4:                 padded_string "LANG\\PROG_5.BIN", 260 ! File to patch 
file4_num_functions:       .long 2 ! Number of patches
! Patch 1
file4_func1_offset:        .long 0x5BCC ! Offset in File to Patch
file4_func1_max_size:      .long 0x160 ! Function Size
file4_func1_patch_offset:  .long sub_608EBCC ! New Function code
file4_func1_patch_size:    .long off_608ED28-sub_608EBCC+4
! Patch 2
file4_func2_offset:        .long 0x5D2C ! Offset in File to Patch
file4_func2_max_size:      .long 0x140 ! Function Size
file4_func2_patch_offset:  .long sub_608ED2C ! New Function code
file4_func2_patch_size:    .long off_608EE68-sub_608ED2C+4

.align 2
sub_6016D38:
		!mov.l	r14, @-r15
		!mov	r15, r14
		mov	r4, r0
		mov	#0, r2
		mov	#1, r6
		mov	#0xFF, r3
		extu.b	r3, r3

loc_6016D46:
		!mov.w	@r0, r1		! change this to mov.b
		mov.b	@r0, r1
		!add	#2, r1
		add	#1, r1
		!extu.w	r1, r1
		extu.b	r1, r1
		cmp/hi	r6, r1
		bt/s	loc_6016D56
		add	#1, r2
		bra	loc_6016D5E
		!add	#2, r0
		add	#2, r0

loc_6016D56:
		cmp/hi	r3, r2
		bf/s	loc_6016D46
		!add	#2, r0		! change to add	#1
		add	#1, r0
		mov	r4, r0

loc_6016D5E:
		tst	#1, r0	! make sure pointer is word aligned
		bt	sub_6016D38_end
		add	#1, r0
		!mov	r14, r15
sub_6016D38_end:
		rts
		!mov.l	@r15+, r14
		nop

.align 2
sub_6016D94:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r12, @-r15
		mov.l	r13, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-0x18,	r15
		mov	r15, r14
		mov.l	r4, @r14
		mov	r5, r9		! pointer to text to draw
		mov	#0x13, r11
		add	r14, r11
		mov	#6, r13
		mov.l	@(0x38,r14), r1
		add	r14, r13
		mov.b	r6, @r11
		mov.w	r7, @r13
		mov	#0xA, r11
		add	r14, r11
		mov.w	r1, @r11
		mov.l	off_6016EE8, r1	! off_604F8A0
		mov	#0xA, r13
		mov.l	@r1, r8
		add	r14, r13
		mov.w	@r13, r13
		extu.w	r13, r1
		shll2	r1
		add	r1, r1          ! remove this instruction to force 8x16
		shll2	r1
		add	r1, r8
		!mov.w	@r9, r1		! read a character from	menu text in fnt_sys.bin
		mov.b	@r9, r1		! read a character from	menu text in fnt_sys.bin
		mov.l	dword_6016EEC, r2 ! 0xFFFF ! if	value is 0xFFFF, terminate parsing
		!extu.w	r1, r1		! confine to unsigned short
		extu.b	r1, r1		! confine to unsigned char
		cmp/eq	r2, r1
		bt/s	loc_6016E30
		mov	#0, r10
		mov	#6, r11
		add	r14, r11
		mov.w	@r11, r11
		mov.w	word_6016EDE, r12 ! 0x300
		extu.w	r11, r11
		mov.l	r11, @(0x14,r14)
		mov.l	@(0x14,r14), r0

loc_6016DEE:
		mov.l	off_6016EF0, r1	! unk_600FFFF
		cmp/hi	r1, r8
		bt	loc_6016E30
		add	#4, r0
		cmp/hi	r12, r0
		bf/s	loc_6016E00
		add	#1, r10
		bra	loc_6016EC8
		mov.l	@(0x14,r14), r0

loc_6016E00:
		mov.l	off_6016EF4, r1	! unk_288000
		mov	#0x13, r13
		add	r14, r13
		mov	r8, r5
		!mov.w	@r9+, r4	! read a character from	menu text in fnt_sys.bin, post increment pointer
		mov.b	@r9+, r4	! read a character from	menu text in fnt_sys.bin, post increment pointer
		mov.l	off_6016EF8, r11 ! sub_6016F00
		mov.b	@r13, r13
		!extu.w	r4, r4		! confine to unsigned short
		extu.b	r4, r4		! confine to unsigned short
		shll2	r4
		!add	r4, r4 ! only have to multiply by 16
		shll2	r4
		add	r1, r4
		extu.b	r13, r6
		jsr	@r11 ! sub_6016F00
		mov.l	r0, @(0xC,r14)
		mov.w	word_6016EE0, r1 ! 0x80  ! for 8x16 this needs to be 0x40
		add	r1, r8
		mov	#0xFFFFFFFF, r13
		!mov.w	@r9, r1
		mov.b	@r9, r1
		!extu.w	r13, r13
		extu.b	r13, r13
		!extu.w	r1, r1
		extu.b	r1, r1
		cmp/eq	r13, r1
		bf/s	loc_6016DEE
		mov.l	@(0xC,r14), r0

loc_6016E30:
		mov.l	off_6016EFC, r1	! off_604EE94
		mov.w	word_6016EE2, r5 ! 0x5000
		mov.l	@r1, r7
		mov	#6, r13
		mov.l	@r14, r11
		add	r14, r13
		mov.l	@r14, r1
		mov.w	@r13, r4
		add	#1, r1
		mov.b	@r1, r1
		mov	r10, r6
		mov.b	@r11, r2
		shll2	r1
		shll2	r1
		shll2	r1
		add	r2, r1
		add	r1, r1
		add	r1, r7
		mov.w	word_6016EE4, r1 ! 0x100
		add	r1, r4
		mov	#0, r1
		!shll2	r6          ! shift only once for 8x16
		shll	r6          ! shift only once for 8x16
		cmp/hs	r6, r1
		bt/s	loc_6016E80
		mov	#0, r3

loc_6016E62:
		mov	r4, r2          ! Do tile map(first row)
		add	r3, r2
		mov	r5, r1
		add	r2, r1
		mov.w	r1, @r7
		add	#2, r7
		!add	#1, r2
		!mov	r5, r1
		!add	r2, r1
		!mov.w	r1, @r7         ! remove the second tile map write unless needed
		!add     #4, r3          ! 8x16 only needs to increment by 2
		add     #2, r3          ! 8x16 only needs to increment by 2
		extu.w	r3, r1
		cmp/hs	r6, r1
		bf/s	loc_6016E62
		!add	#2, r7
        nop

loc_6016E80:
		mov	r10, r2
		!add	r2, r2          ! nop this to fix the second row's start position
		mov	#0x40, r1
		sub	r2, r1
		add	r1, r1
		add	r1, r7
		!mov	#2, r2
		mov	#1, r2
		mov	r10, r1
		!shll2	r1          ! shift only once for 8x16
		shll	r1          ! shift only once for 8x16
		!add	#2, r1
		add	#1, r1
		cmp/hs	r1, r2
		bt/s	loc_6016EBA
		!mov	#2, r3
		mov	#1, r3
		mov	r1, r6

loc_6016E9C:
		mov	r4, r2          ! second row of tile map
		add	r3, r2
		mov	r5, r1
		add	r2, r1
		mov.w	r1, @r7
		add	#2, r7
		!add	#1, r2
		!mov	r5, r1
		!add	r2, r1
		!mov.w	r1, @r7         ! remove the second tile map write unless needed
		!add	#4, r3          ! 8x16 only needs to increment by 2
		add	#2, r3          ! 8x16 only needs to increment by 2
		extu.w	r3, r1
		cmp/hs	r6, r1
		bf/s	loc_6016E9C
		!add	#2, r7
        nop

loc_6016EBA:
		mov	r10, r1
		mov	#0xA, r11
		add	r14, r11
		mov.w	@r11, r11
		!shll2	r1          ! shift only once for 8x16
		shll	r1          ! shift only once for 8x16
		add	r11, r1
		extu.w	r1, r0

loc_6016EC8:
		add	#0x18, r14
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r13
		mov.l	@r15+, r12
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

word_6016EDE:	.word 0x300
!word_6016EE0:	.word 0x80
word_6016EE0:	.word 0x40
word_6016EE2:	.word 0x5000
word_6016EE4:	.word 0x100
.align 2
off_6016EE8:	.long 0x0604F8A0
!dword_6016EEC:	.long 0xFFFF
dword_6016EEC:	.long 0xFF
off_6016EF0:	.long 0x0600FFFF
off_6016EF4:	.long 0x00288000
off_6016EF8:	.long 0x06016F00
off_6016EFC:	.long 0x0604EE94

.align 2
sub_6016F00:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-0x54,	r15
		mov	r15, r14
		mov	r4, r8		! character pointer
		mov	r6, r10		! r6 = ???
		mov	r14, r2
		add	#0x44, r2
		mov.l	r5, @r2		! r5 = ???
		add	#0x20, r5
		!add	#0x40, r5
		mov.l	r5, @(4,r2)
		!mov	r14, r1
		!add	#0x48, r1
		mov	r14, r4
		!mov.l	@r1, r1
		add	#4, r4
		!add	#0x20, r1
		!mov.l	r1, @(8,r2)
		!mov	r14, r1
		!add	#0x4C, r1
		!mov.l	@r1, r1
		!add	#0x20, r1
		!mov.l	r1, @(0xC,r2)
		mov.l	off_6016FC4, r1	! sub_6017748
		jsr	@r1 ! sub_6017748 ! background text?
		mov	r8, r5
		mov	#0, r5
		mov	#0xF, r9	! height - 1?
		!mov	#0xF, r11	! width	
		mov	#7, r11	! width	
		mov	r14, r0

loc_6016F40:
		mov.l	dword_6016FC8, r7 ! 0x80
		mov	#0, r6
		mov	r0, r4
		add	#4, r4

loc_6016F48:
		mov	#0, r3
		mov	r14, r2

loc_6016F4C:
		!mov.w	@r8, r1		! This is where	it does	the foreground text for	menu
		mov.b	@r8, r1		! This is where	it does	the foreground text for	menu
		!extu.w	r1, r1		! basically the	mov.w and extu.w needs changing
		extu.b	r1, r1		! basically the	mov.w and extu.w needs changing
		and	r7, r1
		tst	r1, r1
		bt	loc_6016F5A
		bra	loc_6016F68
		mov.b	r10, @r2

loc_6016F5A:
		mov.l	@r4, r1
		and	r7, r1
		tst	r1, r1
		bf/s	loc_6016F66
		mov	#0xA, r1
		mov	#9, r1

loc_6016F66:
		mov.b	r1, @r2

loc_6016F68:
		shlr	r7
		add	#1, r3
		mov	#1, r1
		cmp/hi	r1, r3
		bf/s	loc_6016F4C	! This is where	it does	the foreground text for	menu
		add	#1, r2		! increment output buffer
		mov	#8, r1
		and	r5, r1
		shlr2	r1
		shlr	r1 ! added to downsize from 2x2 to 1x2 tiles
		!mov	#8, r2
		!and	r6, r2
		!shlr2	r2
		!shlr	r2
		!add	r2, r1
		shll2	r1
		add	r14, r1
		add	#0x44, r1
		mov.l	@r1, r3
		add	#2, r6
		mov	r3, r2
		add	#1, r2		! increment variable
		mov.l	r2, @r1
		mov	r14, r2
		mov.b	@r14, r1
		add	#1, r2
		mov.b	@r2, r2
		shll2	r1
		shll2	r1
		or	r2, r1
		!cmp/hi	r9, r6
		cmp/hi	r11, r6
		bf/s	loc_6016F48	! width	check?
		mov.b	r1, @r3
		!add	#2, r8		! for 8x16 this	will have to be	set to 1
		add	#1, r8		! for 8x16 this	will have to be	set to 1
		add	#1, r5
		cmp/hi	r9, r5		! height check?
		bf/s	loc_6016F40	! change this to 0x80
		add	#4, r0
		add	#0x54, r14
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8
.align 2
off_6016FC4:	.long 0x06017748
!dword_6016FC8:	.long 0x8000
dword_6016FC8:	.long 0x0080

.align 2
sub_6017438:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r12, @-r15
		mov.l	r13, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-0x30,	r15
		mov	r15, r14
		mov	r4, r13
		mov	r5, r0
		mov	#0x50, r10
		add	r14, r10
		mov	#0x54, r11
		add	r14, r11
		mov	r6, r8
		mov	r7, r12
		mov	#0, r9
		mov.l	@r10, r1
		mov	r0, r7
		mov.l	@r11, r2
		mov	#0x2A, r10
		add	r14, r10
		mov.w	r1, @r10
		mov	#0x2E, r11
		add	r14, r11
		mov.w	r2, @r11
		extu.b	r8, r2
		mov	r2, r1
		add	r1, r1
		add	#5, r1
		shlr2	r1
		shll2	r1
		sub	r1, r15
		mov	r15, r5
		mov	#0xFFFFFFFF, r10
		mov.w	r10, @r15
		mov	#1, r11
		mov.l	r11, @r14
		mov	#0xA, r10
		mov.l	r10, @(4,r14)
		mov	#0x64, r11
		mov.l	r11, @(8,r14)
		mov.w	word_601756E, r10 ! 0x3E8
		mov.l	r10, @(0xC,r14)
		mov.w	word_6017570, r11 ! 0x2710
		mov.l	r11, @(0x10,r14)
		mov.l	dword_6017574, r10 ! 0x186A0
		mov.l	r10, @(0x14,r14)
		mov.l	dword_6017578, r11 ! 0xF4240
		mov.l	r11, @(0x18,r14)
		mov.l	dword_601757C, r10 ! 0x989680
		mov.l	r10, @(0x1C,r14)
		mov.l	dword_6017580, r11 ! 0x5F5E100
		mov.l	r11, @(0x20,r14)
		mov.l	dword_6017584, r10 ! 0x3B9ACA00
		tst	r2, r2
		bf/s	loc_60174D2
		mov.l	r10, @(0x24,r14)
		mov	#0x4D, r1
		cmp/hi	r1, r7
		bf/s	loc_60174BE
		mov	#2, r8
		mov	r8, r9
		bra	loc_60174D0
		add	#-0x4C,	r7

loc_60174BE:
		mov	#0x24, r1
		cmp/hi	r1, r7
		bf/s	loc_60174D2
		extu.b	r8, r2
		mov	#1, r9
		cmp/eq	#0x2C, r0
		bf/s	loc_60174D2
		add	#-0x24,	r7
		add	#-3, r7

loc_60174D0:
		extu.b	r8, r2

loc_60174D2:
		mov	#9, r1
		cmp/hi	r1, r2
		bf	loc_60174DC
		bra	loc_60175E0
		or	r0, r0

loc_60174DC:
		mov	r2, r0
		shll2	r0
		mov.l	@(r0,r14), r1
		cmp/hs	r1, r7
		bf/s	loc_6017506
		tst	r7, r7
		mov	#0, r1
		cmp/hs	r2, r1
		bt/s	loc_60175AA
		mov	#0, r3
		mov	#'9', r7
		extu.b	r3, r1

loc_60174F4:
		mov	r1, r0
		add	#1, r3
		extu.b	r3, r1
		cmp/hs	r2, r1
		bf/s	loc_60174F4
		mov.b	r7, @(r0,r5) ! insert '9'
		bra	loc_60175AC
		extu.b	r8, r1

loc_6017506:
		bf/s	loc_601753A
		mov	#0, r4
		mov	#0, r1
		add	#-1, r2
		cmp/ge	r2, r1
		bt/s	loc_6017526
		mov	#0, r3
		extu.b	r3, r1

loc_6017516:
		mov	r1, r0
		mov	#' ', r10
		add	#1, r3
		extu.b	r3, r1
		cmp/ge	r2, r1
		bf/s	loc_6017516
		mov.b	r10, @(r0,r5)	! insert space

loc_6017526:
		extu.b	r8, r1
		add	r1, r1
		add	r5, r1
		mov	r1, r2
		add	#-2, r2
		mov	#'0', r11
		mov.b	r11, @r2	! insert '0'
		mov	#0xFFFFFFFF, r10 ! insert string terminator
		mov.b	r10, @r1
        add	#1, r1
		bra	loc_60175B4
		mov.b	r10, @r1

loc_601753A:
		mov	#0, r1
		cmp/hs	r2, r1
		bt/s	loc_60175AA
		mov	#0, r3
		mov	r2, r6
		extu.b	r3, r2

loc_6017546:
		mov	r6, r1
		sub	r2, r1
		shll2	r1
		add	r14, r1
		add	#-4, r1
		mov.l	@r1, r1
		cmp/hs	r1, r7
		bt/s	loc_6017588
		extu.b	r4, r0
		cmp/eq	#1, r0
		bf/s	loc_6017566
		mov	r2, r0
		mov	#'0', r11
		bra	loc_60175A0
		mov.b	r11, @(r0,r5)	! insert '0'

loc_6017566:
		mov	#' ', r10
		bra	loc_60175A0
		mov.b	r10, @(r0,r5)	! insert space
		
word_601756E:	.word 0x3E8
word_6017570:	.word 0x2710
.align 2
dword_6017574:	.long 0x186A0
dword_6017578:	.long 0xF4240
dword_601757C:	.long 0x989680
dword_6017580:	.long 0x5F5E100
dword_6017584:	.long 0x3B9ACA00

loc_6017588:
		mov	#1, r4
		mov	#0, r2

loc_601758C:
		sub	r1, r7
		cmp/hs	r1, r7
		bt/s	loc_601758C
		add	#1, r2
		extu.b	r3, r1
		mov	r1, r0
		extu.b	r2, r1
		add	#'0', r1
		mov.b	r1, @(r0,r5)	! insert number	char

loc_60175A0:
		add	#1, r3
		extu.b	r3, r1
		cmp/hs	r6, r1
		bf/s	loc_6017546
		extu.b	r3, r2

loc_60175AA:
		extu.b	r8, r1

loc_60175AC:
		mov	r1, r0
		mov	#0xFFFFFFFF, r11
		mov.b	r11, @(r0,r5)	! string terminator
		add	#1, r0
		mov.b	r11, @(r0,r5)	! string terminator

loc_60175B4:
		extu.b	r9, r0
		cmp/eq	#2, r0
		bf/s	loc_60175C0
		cmp/eq	#1, r0
		mov	#'^', r10 ! originally 0xDC ! ’´
		mov.b	r10, @r5

loc_60175C0:
		bf/s	loc_60175C8
		mov	#0x2A, r10
		mov	#'?', r11		! '?'
		mov.b	r11, @r5

loc_60175C8:
		add	r14, r10
		extu.b	r12, r6
		mov	#0x2E, r11
		add	r14, r11
		mov.l	off_60175F8, r0	! sub_6016D94
		mov.w	@r10, r10
		mov	r13, r4
		mov.w	@r11, r11
		extu.w	r10, r7
		extu.w	r11, r1
		jsr	@r0 ! sub_6016D94
		mov.l	r1, @-r15

loc_60175E0:
		add	#0x30, r14
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r13
		mov.l	@r15+, r12
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

.align 2
off_60175F8:	.long 0x06016D94

.align 2
sub_6017748:
		mov.l	r8, @-r15
		mov.l	r9, @-r15	! this is the background layer font rendering function
		mov.l	r14, @-r15
		mov	r15, r14	! r4 = output buffer, r5 = pointer to current character	to draw
		mov	r4, r8
		mov	#0, r4
		mov	#0, r7
		!mov.w	@r5+, r1	! read one line
		mov.b	@r5+, r1	! read one line(8 pixels)
		mov	#14, r9	! vertical
		!extu.w	r1, r3
		extu.b	r1, r3      ! 8 pixels
		!mov.w	@r5+, r1	! read another line
		mov.b	@r5+, r1	! read another line(8 pixels)
		mov	r8, r6
		!extu.w	r1, r0
		extu.b	r1, r0      ! 8 pixels

loc_6017762:
		mov	r3, r1
		add	r1, r1
		mov	r3, r2
		shlr	r2
		or	r2, r1
		or	r4, r1
		or	r0, r1
		mov.l	r1, @r6
		mov	r3, r4
		mov	r0, r3
		!mov.w	@r5+, r1
		mov.b	@r5+, r1   ! 8 pixels        
		add	#4, r6
		add	#1, r7
		cmp/hi	r9, r7
		bf/s	loc_6017762
		!extu.w	r1, r0
		extu.b	r1, r0     ! 8 pixels 
		mov	r7, r0
		shll2	r0
		mov	r3, r1
		add	r1, r1
		mov	r3, r2
		shlr	r2
		or	r2, r1
		or	r4, r1
		mov.l	r1, @(r0,r8) 
		mov	r14, r15
		mov.l	@r15+, r14
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8
sub_6017748_end:

.align 2
sub_607BF78:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r12, @-r15
		mov.l	r13, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-4, r15
		mov	r15, r14
		mov	r4, r8
		mov.l	off_607C1A0, r1	! unk_6087CCC
		mov	#2, r2
		mov.b	r2, @r1
		add	#1, r1
		mov.b	r2, @r1
		mov.l	off_607C1A4, r1	! unk_6087E79
		mov.b	@r1, r1
		extu.b	r1, r2
		mov	#9, r1
		cmp/hi	r1, r2
		bf/s	loc_607BFAA
		mov	r5, r9
		bra	loc_607C3B8
		or	r0, r0

loc_607BFAA:
		mov	r2, r1
		add	r1, r1
		mova	off_607BFB8, r0	! (loc_607C040 - off_607BFB8)
		mov.w	@(r0,r1), r1
		add	r1, r0
		jmp	@r0
		nop

off_607BFB8:	
		.word loc_607C040 - off_607BFB8
		.word loc_607C1E4 - off_607BFB8
		.word loc_607BFCC - off_607BFB8
		.word loc_607BFCC - off_607BFB8
		.word loc_607C008 - off_607BFB8
		.word loc_607C02E - off_607BFB8
		.word loc_607C22C - off_607BFB8
		.word loc_607C2E4 - off_607BFB8
		.word loc_607C38C - off_607BFB8
		.word loc_607C39A - off_607BFB8

loc_607BFCC:
		mov.l	off_607C1A8, r3	! unk_60882C8
		mov	r8, r1
		mov	r3, r2
		mov.l	@r1+, r0
		add	#4, r2
		mov.l	r0, @r3
		mov.l	@r1+, r0
		mov.l	r0, @r2
		mov.l	@r1, r1
		mov.l	r1, @(4,r2)
		mov	r8, r1
		add	#2, r1
		mov.b	@r1, r1
		extu.b	r1, r1
		mov	r1, r0
		cmp/eq	#1, r0
		bf/s	loc_607BFF8
		mov	#0, r13
		mov	r3, r2
		add	#2, r2
		bra	loc_607BFFE
		mov	#1, r1

loc_607BFF8:
		mov	r3, r2
		add	#2, r2
		mov	#0, r1

loc_607BFFE:
		mov.b	r1, @r2
		mov.l	off_607C1A4, r2	! unk_6087E79
		mov	#4, r1
		bra	loc_607C3B8
		mov.b	r1, @r2

loc_607C008:
		mov	#0, r13
		mov.l	off_607C1A0, r1	! unk_6087CCC
		mov	#1, r2
		mov.b	r2, @r1
		add	#1, r1
		mov.b	r2, @r1
		mov.l	off_607C1A8, r4	! unk_60882C8
		mov.l	off_607C1AC, r0	! sub_607DB10
		jsr	@r0 ! sub_607DB10
		mov	#1, r5
		extu.w	r0, r0
		cmp/eq	#2, r0
		bt/s	loc_607C028
		mov	#5, r1
		bra	loc_607C3B8
		or	r0, r0

loc_607C028:
		mov.l	off_607C1A4, r2	! unk_6087E79
		bra	loc_607C3B8
		mov.b	r1, @r2

loc_607C02E:
		mov	#0, r13
		mov.l	off_607C1A8, r4	! unk_60882C8
		mov.l	off_607C1AC, r0	! sub_607DB10
		jsr	@r0 ! sub_607DB10
		mov	#0, r5
		mov.l	off_607C1A4, r2	! unk_6087E79
		mov	#0, r1
		bra	loc_607C3B8
		mov.b	r1, @r2

loc_607C040:
		mov.l	off_607C1A8, r9	! unk_60882C8
		mov.l	off_607C1AC, r0	! sub_607DB10
		mov	#0, r5
		jsr	@r0 ! sub_607DB10
		mov	r9, r4
		mov.b	@r8, r1
		extu.b	r1, r2
		tst	r2, r2
		bt/s	loc_607C05C
		mov	#0, r13
		mov	#5, r1
		cmp/hi	r1, r2
		bf/s	loc_607C06A
		mov	r2, r0

loc_607C05C:
		mov.l	off_607C1A4, r2	! unk_6087E79
		mov	#9, r1
		mov.b	r1, @r2
		mov.l	off_607C1B0, r2	! unk_60882D4
		mov	#0xFFFFFFFF, r1
		bra	loc_607C1E4
		mov.b	r1, @r2

loc_607C06A:
		cmp/eq	#1, r0
		bf/s	loc_607C0A2
		mov	r9, r1
		add	#4, r1
		mov.w	@r1, r3
		movt	r2
		mov	r3, r1
		add	#2, r1
		extu.w	r1, r1
		cmp/hi	r2, r1
		bf/s	loc_607C08A
		extu.w	r3, r1
		!mov.l	dword_607C1B4, r2 ! 0xFFFD
		mov	#0xFD, r2 ! 0xFFFD
        extu.w r2, r2
		cmp/eq	r2, r1
		bf/s	loc_607C090
		mov	#3, r1

loc_607C08A:
		bra	loc_607C092
		mov	#1, r1

loc_607C090:

loc_607C092:
		mov.l	off_607C1C0, r2
		add	#0x3E, r2	! unk_6087ECE
		mov.b	r1, @r2
		mov.l	off_607C1BC, r1	! sub_6018724
		jsr	@r1 ! sub_6018724
		mov	#0, r13
		mov.l	off_607C1A4, r2	! unk_6087E79
		mov	#1, r1
		bra	loc_607C3B8
		mov.b	r1, @r2

loc_607C0A2:
		mov	r2, r0
		cmp/eq	#2, r0
		bf/s	loc_607C0BA
		cmp/eq	#3, r0
		mov.l	off_607C1C0, r2	! unk_6087E90
		mov	r2, r3
		add	#1, r3
		mov	#2, r1
		mov.b	r1, @r3
		add	#5, r2
		bra	loc_607C124
		mov	#6, r1

loc_607C0BA:
		bf/s	loc_607C0D4
		mov	r2, r0
		mov.l	off_607C1C0, r2	! unk_6087E90
		mov	r2, r3
		add	#1, r3
		mov	#0, r1
		mov.b	r1, @r3
		mov	r2, r3
		add	#5, r3
		mov	#4, r1
		mov.b	r1, @r3
		bra	loc_607C122
		add	#9, r2

loc_607C0D4:
		cmp/eq	#4, r0
		bf/s	loc_607C0FA
		mov	r2, r0
		mov.l	off_607C1C0, r2	! unk_6087E90
		mov	r2, r3
		add	#1, r3
		mov	#0, r1
		mov.b	r1, @r3
		mov	r2, r3
		add	#5, r3
		mov	#2, r1
		mov.b	r1, @r3
		mov	r2, r3
		add	#9, r3
		mov	#4, r1
		mov.b	r1, @r3
		add	#0xD, r2
		bra	loc_607C124
		mov	#6, r1

loc_607C0FA:
		cmp/eq	#5, r0
		bf/s	loc_607C126
		mov	#0, r1
		mov.l	off_607C1C0, r2	! unk_6087E90
		mov	r2, r3
		add	#1, r3
		mov.b	r1, @r3
		mov	r2, r3
		add	#5, r3
		mov	#2, r1
		mov.b	r1, @r3
		mov	r2, r3
		add	#9, r3
		mov	#4, r1
		mov.b	r1, @r3
		mov	r2, r3
		add	#0xD, r3
		mov	#6, r1
		mov.b	r1, @r3
		add	#0x11, r2

loc_607C122:
		mov	#8, r1

loc_607C124:
		mov.b	r1, @r2

loc_607C126:
		mov.b	@r8, r1
		mov.l	off_607C1C4, r2	! unk_6087EBD
		mov.b	r1, @r2
		mov.l	off_607C1C8, r1	! unk_60887C8
		mov.b	@r1, r1
		extu.b	r1, r0
		cmp/eq	#1, r0
		bf/s	loc_607C13E
		mov	#3, r1
		mov.l	off_607C1CC, r2	! unk_6087E80
		bra	loc_607C170
		mov.b	r1, @r2

loc_607C13E:
		mov.l	off_607C1D0, r3	! unk_60882CC
		mov.w	@r3, r1
		!mov.l	dword_607C1D4, r2 ! 0xFFFF
		mov	#0xFF, r2 ! 0xFFFF
		extu.w	r2, r2
		cmp/eq	r2, r1
		bf/s	loc_607C152
		mov	r3, r1
		mov.l	off_607C1CC, r2	! unk_6087E80
		bra	loc_607C16E
		mov	#6, r1

loc_607C152:
		add	#-2, r1
		mov.b	@r1, r1
		extu.b	r1, r1
		tst	r1, r1
		bt/s	loc_607C16A
		mov	r1, r0
		cmp/eq	#1, r0
		bf/s	loc_607C16A
		mov	#1, r1
		mov.l	off_607C1CC, r2	! unk_6087E80
		bra	loc_607C170
		mov.b	r1, @r2

loc_607C16A:
		mov.l	off_607C1CC, r2	! unk_6087E80
		mov	#0xC, r1

loc_607C16E:
		mov.b	r1, @r2

loc_607C170:
		mov.l	off_607C1D8, r1	! unk_60882CA
		mov.b	@r1, r1
		extu.b	r1, r1
		tst	r1, r1
		bf/s	loc_607C182
		mov	r1, r0
		mov.l	off_607C1DC, r2	! unk_6087E81
		bra	loc_607C18A
		mov	#2, r1

loc_607C182:
		cmp/eq	#1, r0
		bf/s	loc_607C18C
		mov	#0xF, r1
		mov.l	off_607C1DC, r2	! unk_6087E81

loc_607C18A:
		mov.b	r1, @r2

loc_607C18C:
		mov.l	off_607C1A4, r2	! unk_6087E79
		mov	#6, r1
		mov.b	r1, @r2
		mov.l	off_607C1E0, r1	! unk_6087E7A
		mov	#0, r2
		mov.b	r2, @r1
		mov.l	off_607C1B0, r1	! unk_60882D4
		bra	loc_607C3B8
		mov.b	r2, @r1
.align 2
off_607C1A0:	.long 0x06087CCC
off_607C1A4:	.long 0x06087E79
off_607C1A8:	.long 0x060882C8
off_607C1AC:	.long 0x0607DB10
off_607C1B0:	.long 0x060882D4
!dword_607C1B4:	.long 0xFFFD
off_607C1BC:	.long 0x06018724
off_607C1C0:	.long 0x06087E90
off_607C1C4:	.long 0x06087EBD
off_607C1C8:	.long 0x060887C8
off_607C1CC:	.long 0x06087E80
off_607C1D0:	.long 0x060882CC
!dword_607C1D4:	.long 0xFFFF
off_607C1D8:	.long 0x060882CA
off_607C1DC:	.long 0x06087E81
off_607C1E0:	.long 0x06087E7A

loc_607C1E4:
		mov	#0, r13
		mov.l	off_607C3D8, r8	! unk_60882C8
		mov.l	off_607C3DC, r0	! sub_607DB10
		mov	#0, r5
		jsr	@r0 ! sub_607DB10
		mov	r8, r4
		add	#2, r8
		mov.l	off_607C3E8, r1
		add #0x55, r1 ! unk_6087ECE
		mov.l	off_607C3E4, r0	! sub_601874C
		mov.b	@r8, r4
		mov	r14, r5
		mov.b	@r1, r1
		extu.b	r4, r4
		extu.b	r1, r1
		jsr	@r0 ! sub_601874C
		add	r1, r4
		cmp/eq	#1, r0
		bt/s	loc_607C20E
		mov.b	@r14, r3
		bra	loc_607C3B8
		or	r0, r0

loc_607C20E:
		extu.b	r3, r1
		tst	r1, r1
		bf/s	loc_607C21E
		mov	r3, r1
		mov.l	off_607C3E8, r2	! unk_6087E79
		mov	#1, r1
		bra	loc_607C3B8
		mov.b	r1, @r2

loc_607C21E:
		mov.l	off_607C3EC, r2	! unk_60882D4
		add	#-1, r1
		mov.b	r1, @r2
		mov.l	off_607C3E8, r2	! unk_6087E79
		mov	#9, r1
		bra	loc_607C3B8
		mov.b	r1, @r2

loc_607C22C:
		mov	#0, r13
		mov.l	off_607C3F0, r10 ! unk_60882CA
		mov.b	@r10, r4
		mov.l	off_607C3F4, r1	! sub_607CCB8
		jsr	@r1 ! sub_607CCB8
		extu.b	r4, r4
		mov.l	@(8,r8), r8
		mov.l	off_607C3F8, r0	! sub_6016D38
		jsr	@r0 ! sub_6016D38
		mov	r8, r4
		mov	r0, r8
		mov	r10, r3
		add	#-2, r3
		mov.b	@r3, r1
		mov	#0, r2
		extu.b	r1, r1
		cmp/hs	r1, r2
		bt/s	loc_607C2CE
		mov	#0, r9
		mov	r3, r11
		mov	r10, r12
		mov.l	off_607C3FC, r10 ! sub_607D174

loc_607C258:
		extu.w	r9, r0
		mov.b	@r11, r1
		mov.l	off_607C400, r6	! unk_6087ECC
		mov.b	@r12, r4
		extu.b	r1, r1
		mov	r1, r2
		shll2	r2
		add	r1, r2
		mov.l	off_607C404, r1	! unk_6087E9A
		add	r1, r2
		mov.b	@(r0,r2), r5
		extu.b	r4, r4
		jsr	@r10 ! sub_607D174
		extu.b	r5, r5
		bra	loc_607C2B2
		!mov.w	@r8, r3
        mov.b	@r8, r3

loc_607C278:
		!mov.l	dword_607C408, r1 ! 0xF600
		mov	#0xF6, r1
        extu.b r1, r1
		cmp/eq	r1, r2
		bf/s	loc_607C28E
		extu.w	r9, r0
		add	#2, r8
		!mov.w	@r8, r4
		mov.b	@r8+, r4
        shll8	r4
		mov.b	@r8, r0
		extu.b	r0, r0
        or      r0, r4
		mov.l	off_607C40C, r0	! sub_607AB14
		jsr	@r0 ! sub_607AB14
		extu.w	r4, r4
		mov	r0, r8
		extu.w	r9, r0

loc_607C28E:
		mov.b	@r11, r1
		mov	r8, r6
		mov.b	@r12, r4
		extu.b	r1, r1
		mov	r1, r2
		shll2	r2
		add	r1, r2
		mov.l	off_607C404, r1	! unk_6087E9A
		add	r1, r2
		mov.b	@(r0,r2), r5
		extu.b	r4, r4
		jsr	@r10		! sub_607D174
		extu.b	r5, r5
		exts.w	r0, r0
		cmp/eq	#0xFFFFFFFF, r0
		bt	loc_607C2C0
		!add	#2, r8
		!mov.w	@r8, r3
		add	#1, r8
		mov.b	@r8, r3

loc_607C2B2:
		mov	#1, r2
		mov	r3, r1
		add	#2, r1
		!extu.w	r1, r1
		extu.b	r1, r1
		cmp/hi	r2, r1
		bt/s	loc_607C278
		!extu.w	r3, r2
		extu.b	r3, r2

loc_607C2C0:
		mov r8, r0 ! make sure r8 is word aligned
		tst #1, r0
		bt end_walign_check
		add #1, r8
end_walign_check:
		add	#1, r9
		mov.b	@r11, r1
		extu.w	r9, r2
		extu.b	r1, r1
		cmp/hs	r1, r2
		bf/s	loc_607C258
		add	#2, r8

loc_607C2CE:
		mov.l	off_607C410, r0	! sub_60186E8
		jsr	@r0 ! sub_60186E8
		nop
		mov.l	off_607C414, r4	! off_6087EB8
		mov.l	off_607C418, r0	! sub_6016D68
		jsr	@r0 ! sub_6016D68
		nop
		mov.l	off_607C3E8, r2	! unk_6087E79
		mov	#7, r1
		bra	loc_607C3B8
		mov.b	r1, @r2

loc_607C2E4:
		mov	#0, r13
		mov.l	off_607C3D8, r9	! unk_60882C8
		mov.l	off_607C3DC, r0	! sub_607DB10
		mov	#0, r5
		jsr	@r0 ! sub_607DB10
		mov	r9, r4
		mov.l	off_607C41C, r1	! unk_6034B7C
		mov.w	@r1, r3
		mov.w	word_607C3D0, r2 ! 0x3000
		mov	r3, r1
		and	r2, r1
		tst	r1, r1
		bt	loc_607C30C
		mov.l	off_607C420, r8	! unk_6087E7A
		mov.l	off_607C414, r4	! off_6087EB8
		mov.l	off_607C424, r0	! sub_6016A38
		jsr	@r0 ! sub_6016A38
		mov.b	@r8, r5
		bra	loc_607C364
		mov.b	r0, @r8

loc_607C30C:
		mov.l	off_607C428, r2	! unk_603A494
		mov.w	@r2, r1
		and	r3, r1
		extu.w	r1, r1
		tst	r1, r1
		bf/s	loc_607C342
		mov	r2, r1
		add	#-2, r1
		mov.w	@r1, r1
		and	r3, r1
		extu.w	r1, r1
		tst	r1, r1
		bt	loc_607C364
		mov.w	word_607C3D2, r4 ! 0x102
		mov.l	off_607C42C, r1	! sub_6010698
		jsr	@r1 ! sub_6010698
		mov	#1, r5
		mov	r8, r1
		add	#2, r1
		mov.b	@r1, r4
		mov.l	off_607C3F4, r1	! sub_607CCB8
		jsr	@r1 ! sub_607CCB8
		extu.b	r4, r4
		mov.l	off_607C3E8, r2	! unk_6087E79
		mov	#3, r1
		bra	loc_607C3B8
		mov.b	r1, @r2

loc_607C342:
		mov.w	word_607C3D4, r4 ! 0x101
		mov.l	off_607C42C, r1	! sub_6010698
		jsr	@r1 ! sub_6010698
		mov	#1, r5
		mov.l	off_607C420, r1	! unk_6087E7A
		mov.b	@r1, r1
		mov.l	off_607C3EC, r2	! unk_60882D4
		mov.b	r1, @r2
		mov.l	off_607C3E8, r2	! unk_6087E79
		mov	#9, r1
		mov.b	r1, @r2
		mov	r9, r1
		add	#2, r1
		mov.b	@r1, r4
		mov.l	off_607C3F4, r1	! sub_607CCB8
		jsr	@r1 ! sub_607CCB8
		extu.b	r4, r4

loc_607C364:
		mov.l	off_607C420, r1	! unk_6087E7A
		mov.b	@r1, r2
		mov.l	off_607C430, r1	! off_6087EC0
		mov.l	@r1, r3
		shll2	r2
		add	#-8, r1
		mov.l	@r1, r1
		mov	r2, r0
		mov.l	@(r0,r3), r5
		mov.l	off_607C434, r0	! sub_6016860
		jsr	@r0 ! sub_6016860
		mov.l	@(4,r1), r4
		mov.l	off_607C3F0, r1	! unk_60882CA
		mov	#0, r5
		mov.b	@r1, r4
		mov.l	off_607C438, r0	! _DrawDialogText
		jsr	@r0 ! _DrawDialogText
		extu.b	r4, r4
		bra	loc_607C3BA
		add	#4, r14

loc_607C38C:
		mov.l	off_607C3D8, r4	! unk_60882C8
		mov.l	off_607C3DC, r0	! sub_607DB10
		jsr	@r0 ! sub_607DB10
		mov	#0, r5
		mov.l	off_607C3E8, r2	! unk_6087E79
		mov	#9, r1
		mov.b	r1, @r2

loc_607C39A:
		mov	#0, r13
		mov.l	off_607C3D8, r4	! unk_60882C8
		mov.l	off_607C3DC, r0	! sub_607DB10
		jsr	@r0 ! sub_607DB10
		mov	#2, r5
		extu.w	r0, r0
		cmp/eq	#1, r0
		bf/s	loc_607C3B8
		mov	#2, r1
		mov.l	off_607C3E8, r2	! unk_6087E79
		mov.b	r1, @r2
		mov.l	off_607C3EC, r1	! unk_60882D4
		mov.b	@r1, r1
		mov	#1, r13
		mov.b	r1, @r9

loc_607C3B8:
		add	#4, r14

loc_607C3BA:
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		extu.w	r13, r0
		mov.l	@r15+, r13
		mov.l	@r15+, r12
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

word_607C3D0:	.word 0x3000
word_607C3D2:	.word 0x102
word_607C3D4:	.word 0x101
.align 2
off_607C3D8:	.long 0x060882C8
off_607C3DC:	.long 0x0607DB10
off_607C3E4:	.long 0x0601874C
off_607C3E8:	.long 0x06087E79
off_607C3EC:	.long 0x060882D4
off_607C3F0:	.long 0x060882CA
off_607C3F4:	.long 0x0607CCB8
off_607C3F8:	.long 0x06016D38
off_607C3FC:	.long 0x0607D174
off_607C400:	.long 0x06087ECC
off_607C404:	.long 0x06087E9A
off_607C40C:	.long 0x0607AB14
off_607C410:	.long 0x060186E8
off_607C414:	.long 0x06087EB8
off_607C418:	.long 0x06016D68
off_607C41C:	.long 0x06034B7C
off_607C420:	.long 0x06087E7A
off_607C424:	.long 0x06016A38
off_607C428:	.long 0x0603A494
off_607C42C:	.long 0x06010698
off_607C430:	.long 0x06087EC0
off_607C434:	.long 0x06016860
off_607C438:	.long 0x0607D230

.align 2
sub_607CCB8:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r12, @-r15
		mov.l	r13, @-r15
		mov.l	r14, @-r15
		add	#-4, r15
		mov	r15, r14
		mov	r4, r13
		mov	#0, r7
		mov	r13, r1
		shll2	r1
		add	r13, r1
		mov.l	off_607CD48, r2	! spr_list_num
		add	r2, r1
		mov.l	r1, @r14
		mov	#0, r8
		mov	#0x20, r11
		mov	#0xAA, r10
		extu.b	r10, r10
		mov.l	off_607CD4C, r9	! spr_list_dispenable
		extu.b	r7, r1

loc_607CCE6:
		mov.l	@r14, r0
		mov	#0, r3
		mov	r1, r6
		mov	#0x22, r4
		mov.b	r8, @(r0,r1)

loc_607CCF0:
		mul.l	r10, r5
		extu.b	r3, r0
		sts	macl, r1
		mul.l	r4, r6
		add	#1, r3
		add	r9, r1
		sts	macl, r2
		add	r1, r2
		extu.b	r3, r1
		cmp/hi	r11, r1
		bf/s	loc_607CCF0
		mov.b	r8, @(r0,r2)
		add	#1, r7
		extu.b	r7, r2
		mov	#4, r1
		cmp/hi	r1, r2
		bf/s	loc_607CCE6
		extu.b	r7, r1
		extu.b	r13, r1
		mov	r1, r2
		shll2	r2
		mov.l	off_607CD50, r1	! unk_60885D8
		mov	#0, r12
		mov	r2, r0		! clear	out text drawing related variables
		mov.l	r12, @(r0,r1)
		mov.l	off_607CD54, r1	! dword_60885E0
		mov.l	r12, @(r0,r1)
		mov.l	off_607CD58, r1	! dword_60885E8
		mov.l	r12, @(r0,r1)
		mov.l	off_607CD5C, r1	! dword_60885F0
		mov.l	r12, @(r0,r1)
		mov.l	off_607CD60, r1	! dword_60885F8
		mov.l	r12, @(r0,r1)
		add	#4, r14
		mov	r14, r15
		mov.l	@r15+, r14
		mov.l	@r15+, r13
		mov.l	@r15+, r12
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

.align 2		
off_607CD48:	.long spr_list_num
off_607CD4C:	.long spr_list_dispenable
off_607CD50:	.long 0x060885D8
off_607CD54:	.long 0x060885E0
off_607CD58:	.long 0x060885E8
off_607CD5C:	.long 0x060885F0
off_607CD60:	.long 0x060885F8

.align 2
sub_607CD64:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r12, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		mov	r15, r14
		mov	r5, r6
		mov	r4, r11
		mov	r11, r8
		shll2	r8
		mov.l	off_607CF1C, r1	! unk_60885F0
		mov	r8, r12
		add	r1, r12
		mov.l	@r12, r1
		tst	r1, r1
		bt/s	loc_607CD90
		mov	#0, r10
		bra	loc_607CF08
		or	r0, r0

loc_607CD90:
		mov.l	off_607CF20, r1	! unk_60370D7
		mov.b	@r1, r1
		extu.b	r1, r0
		cmp/eq	#2, r0
		bf	loc_607CD9E
		bra	loc_607CF08
		or	r0, r0

loc_607CD9E:
        mov.b	@r6+, r1  ! read character from buffer
        shll8	r1
        mov.b	@r6, r2  ! read character from buffer
		extu.b	r2, r2
        or      r2, r1
        mov	r5, r6
        mov	#0xFC, r2 ! 0xFFFC
		!extu.w	r2, r2
		!extu.w	r1, r1
		cmp/eq	r2, r1
		bt	loc_607CE88
		add	#1, r2 ! 0xFFFD
		cmp/eq	r2, r1
		bf/s	loc_607CDF6
		mov	r8, r9
		mov.l	off_607CF2C, r1	! unk_60885E8
		mov	r8, r5
		add	r1, r5
		mov.l	off_607CF30, r1	! unk_60885E0
		mov.l	@r5, r2
		mov	r8, r0
		mov.l	@(r0,r1), r6
		cmp/hi	r6, r2
		bf/s	loc_607CDCA
		mov	r8, r3
		bra	loc_607CF08
		or	r0, r0

loc_607CDCA:
		mov.l	off_607CF34, r1	! unk_60885D8
		add	r1, r3
		mov.l	@r3, r7
		mov	#3, r1
		mov	r7, r2
		sub	r6, r2
		cmp/hi	r1, r2
		bf/s	loc_607CDEC
		mov	r7, r1
		mov	#0x12, r0
		mov.l	r0, @r12
		mov.l	@r3, r1
		movt	r10
		add	#1, r1
		mov.l	r1, @r3
		bra	loc_607CF08
		mov.l	r1, @r5

loc_607CDEC:
		add	#1, r1
		mov.l	r1, @r3
		mov.l	r1, @r5
		bra	loc_607CF08
		mov	#1, r10

loc_607CDF6:
		mov.l	off_607CF34, r1	! unk_60885D8
		add	r1, r9
		mov.l	@r9, r5
		mov.l	off_607CF38, r0	! sub_607D174
		jsr	@r0 ! sub_607D174
		mov	r11, r4
		exts.w	r0, r1
		tst	r1, r1
		bf/s	loc_607CE0E
		mov	r8, r0
		bra	loc_607CF08
		mov	#1, r10

loc_607CE0E:
		mov.l	off_607CF30, r1	! unk_60885E0
		mov.l	@r9, r3
		mov.l	@(r0,r1), r7
		mov	r3, r2
		sub	r7, r2
		mov	#3, r1
		cmp/hi	r1, r2
		bf/s	loc_607CE38
		mov	r11, r4
		mov.l	off_607CF2C, r1	! unk_60885E8
		mov.l	@(r0,r1), r1
		cmp/hi	r7, r1
		bf/s	loc_607CE34
		mov	#0x12, r0
		mov.l	r0, @r12
		mov.l	@r9, r1
		add	#1, r1
		bra	loc_607CF08
		mov.l	r1, @r9

loc_607CE34:
		bra	loc_607CF08
		mov	#2, r10

loc_607CE38:
		mov	r3, r2
		add	#1, r2
		mov.l	r2, @r9
		mov.l	dword_607CF3C, r1 ! 0xCCCCCCCD
		mov	#0, r7
		mov	#0x20, r10
		mov	#0xAA, r9
		extu.b	r9, r9
		dmulu.l	r1, r2
		mov	#0x22, r5
		mov	#0, r3
		sts	mach, r1
		mov	r1, r6
		shlr2	r6
		mov	r6, r1
		shll2	r1
		add	r6, r1
		mov	r2, r6
		sub	r1, r6
		mov	r8, r1
		add	r11, r1
		mov.l	off_607CF40, r2	! unk_6088518
		add	r2, r1
		mov	#0, r2
		mov	r1, r0
		mov.b	r2, @(r0,r6)
		mov.l	off_607CF44, r8	! unk_6088528

loc_607CE6C:
		mul.l	r9, r4
		extu.b	r7, r0
		sts	macl, r1
		mul.l	r5, r6
		add	#1, r7
		add	r8, r1
		sts	macl, r2
		add	r1, r2
		extu.b	r7, r1
		cmp/hi	r10, r1
		bf/s	loc_607CE6C
		mov.b	r3, @(r0,r2)
		bra	loc_607CF08
		mov	#0, r10

loc_607CE88:
		mov	r8, r2
		mov.l	off_607CF34, r1	! unk_60885D8
		add	r1, r2
		mov.l	off_607CF30, r1	! unk_60885E0
		mov.l	@r2, r7
		mov	r8, r0
		mov.l	@(r0,r1), r6
		mov	#3, r5
		mov	r7, r1
		sub	r6, r1
		cmp/hi	r5, r1
		bf/s	loc_607CEBA
		mov	#4, r1
		mov.l	off_607CF2C, r1	! unk_60885E8
		mov.l	@(r0,r1), r1
		cmp/eq	r1, r6
		bt/s	loc_607CEB6
		mov	#0x12, r0
		mov.l	r0, @r12
		mov.l	@r2, r1
		mov	#4, r10
		add	#1, r1
		bra	loc_607CF08
		mov.l	r1, @r2

loc_607CEB6:
		bra	loc_607CF08
		mov	r5, r10

loc_607CEBA:
		mov	r7, r0
		add	#1, r0
		mov	r0, r6
		cmp/hi	r1, r6
		bf/s	loc_607CED0
		mov.l	r0, @r2
		add	#-5, r6

loc_607CEC8:
		cmp/hi	r1, r6
		bt/s	loc_607CEC8
		add	#-5, r6
		add	#5, r6

loc_607CED0:
		mov	r3, r1
		shll2	r1
		add	r3, r1
		mov.l	off_607CF40, r2	! unk_6088518
		add	r2, r1
		mov	#0, r2
		mov	r1, r0
		mov.b	r2, @(r0,r6)
		mov	#0, r7
		mov	#0x20, r10
		mov	#0xAA, r9
		extu.b	r9, r9
		mov.l	off_607CF44, r8	! unk_6088528
		mov	#0x22, r4
		mov	#0, r5

loc_607CEEE:
		mul.l	r9, r3
		extu.b	r7, r0
		sts	macl, r1
		mul.l	r4, r6
		add	#1, r7
		add	r8, r1
		sts	macl, r2
		add	r1, r2
		extu.b	r7, r1
		cmp/hi	r10, r1
		bf/s	loc_607CEEE
		mov.b	r5, @(r0,r2)
		mov	#4, r10

loc_607CF08:
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r12
		mov.l	@r15+, r11
		mov	r10, r0
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

.align 2
off_607CF1C:	.long 0x060885F0
off_607CF20:	.long 0x060370D7
off_607CF2C:	.long 0x060885E8
off_607CF30:	.long 0x060885E0
off_607CF34:	.long 0x060885D8
off_607CF38:	.long 0x0607D174
dword_607CF3C:	.long 0xCCCCCCCD
off_607CF40:	.long spr_list_num
off_607CF44:	.long spr_list_dispenable

.align 2
sub_607CF48:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r14, @-r15
		mov	r15, r14
		mov	#0, r7
		mov	#0x20, r9 
		mov	#0xAA, r8
		extu.b	r8, r8
		mov.l	off_607CF88, r6	! spr_list_ya
		mov	#0, r3

loc_607CF5C:
		mov	#0, r0
		mul.l	r8, r4

loc_607CF60:
		mov	r3, r2
		sts	macl, r1
		add	r6, r1
		add	r1, r2
		mov.b	@(r0,r2), r1
		sub	r5, r1
		mov.b	r1, @(r0,r2)
		add	#1, r0
		cmp/hi	r9, r0
		bf/s	loc_607CF60
		mov	#4, r1
		add	#1, r7
		cmp/hi	r1, r7
		bf/s	loc_607CF5C
		add	#0x22, r3
		mov	r14, r15
		mov.l	@r15+, r14
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

.align 2
off_607CF88:	.long spr_list_ya

.align 2
sub_607CF8C:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r12, @-r15
		mov.l	r13, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-0xC, r15
		mov	r15, r14
		mov.l	r7, @r14
		mov.l	@r14, r3
		mov	#4, r1
		cmp/hi	r1, r3
		bf/s	loc_607CFB8
		extu.b	r4, r10
		add	#-5, r3

loc_607CFAE:
		cmp/hi	r1, r3
		bt/s	loc_607CFAE
		add	#-5, r3
		add	#5, r3

loc_607CFB8:
		mov	#0xAA, r1
		extu.b r1, r1
		mul.l	r1, r10
		sts	macl, r11
		mov.l	off_607D094, r1	! unk_6088528
		mov	r11, r2
		add	r1, r2
		mov	#0x22, r1
		mul.l	r1, r3
		mov	r10, r13
		shll2	r13
		sts	macl, r8
		add	r8, r2
		mov	#1, r1
		mov	r2, r0
		mov.b	r1, @(r0,r6)
		mov.l	off_607D098, r1	! off_604F8A0
		mov.l	@r1, r12
		mov	r13, r9
		mov.b	@r5, r4         ! read character from text buffer
		mov.l	off_607D09C, r1	! unk_60885F8
		add	r1, r9
		extu.b	r4, r4
		mov.l	@r9, r1
		mov.l	r6, @(8,r14)
		shll2	r1
		shll2	r1
		add	r1, r1
		shll2	r1
		add	r1, r12
		mov.l	off_607D0A0, r1	! sub_607D0C4
		jsr	@r1 ! sub_607D0C4
		mov	r12, r5
		mov.l	off_607D0A4, r5	! unk_25C60000
		mov.w	word_607D08E, r1 ! 0x2A80
		mov	r8, r2
		mov	r8, r7
		mov	r12, r4
		mov.l	@(8,r14), r6
		mul.l	r1, r10
		add	r6, r2
		shll2	r2
		shll2	r2
		add	r2, r2
		shll2	r2
		mov	r6, r3
		sts	macl, r1
		add	r1, r5
		mov.w	word_607D090, r10 ! 0x80
		add	r2, r5
		shlr2	r2
		shlr2	r2
		shlr	r2
		shlr2	r2
		mov.l	@r9, r1
		!add	r3, r3 ! disable this to force text sprite increments for 8x16 sprites instead of 16x16
		add	#1, r1
		mov.l	r1, @r9
		mov.l	off_607D0A8, r1	! unk_6088308
		add	r11, r1
		add	r8, r1
		mov	r1, r0
		mov.b	r2, @(r0,r6)
		mov.l	off_607D0AC, r1	! unk_60883B8
		add	r11, r1
		add	r1, r7
		mov.l	off_607D0B0, r1	! unk_604EDF8
		mov	r13, r2
		add	r1, r2
		mov.b	@r2+, r1
		mov	r7, r0
		add	r3, r1
		mov.b	r1, @(r0,r6)
		mov.l	off_607D0B4, r1	! unk_6088468
		add	r1, r11
		mov.b	@r2, r1
		mov	r13, r0
		mov.l	@r14, r3
		mov.l	off_607D0B8, r2	! unk_60885E0
		mov.l	@(r0,r2), r2
		add	r11, r8
		sub	r2, r3
		mov	#0x12, r2
		mul.l	r2, r3
		shll2	r1
		add	r1, r1
		mov	r8, r0
		sts	macl, r2
		add	r2, r1
		add	#2, r1
		mov.b	r1, @(r0,r6)
		mov.l	off_607D0BC, r1	! _slDMACopy
		jsr	@r1 ! _slDMACopy
		mov	r10, r6
		mov.l	off_607D0C0, r2	! unk_60370D7
		mov	#3, r1
		mov.b	r1, @r2
		add	#0xC, r14
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r13
		mov.l	@r15+, r12
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

word_607D08E:	.word 0x2A80
word_607D090:	.word 0x80
		.align 2
off_607D094:	.long spr_list_dispenable
off_607D098:	.long 0x0604F8A0
off_607D09C:	.long 0x060885F8
off_607D0A0:	.long 0x0607D0C4
off_607D0A4:	.long 0x025C60000
off_607D0A8:	.long 0x06088308
off_607D0AC:	.long spr_list_xa
off_607D0B0:	.long 0x0604EDF8
off_607D0B4:	.long spr_list_ya
off_607D0B8:	.long 0x060885E0
off_607D0BC:	.long 0x0602E14C
off_607D0C0:	.long 0x060370D7

.align 2
sub_607D0C4:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r12, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-0x48,	r15
		mov	r15, r14
		extu.w	r4, r4
		shll2	r4
		!add	r4, r4		! disable this to convert to 8x16
		shll2	r4
		mov.l	off_607D164, r1	! unk_288000
		mov	r4, r9
		add	r1, r9
		mov	r5, r8
		mov	r14, r4
		add	#4, r4
		mov.l	off_607D168, r1	! sub_6017748
		jsr	@r1 ! sub_6017748
		mov	r9, r5
		mov	#0, r10
		mov.l	off_607D16C, r12 ! unk_603E9F0
		mov	#0xF, r11
		mov	r14, r4

loc_607D0F8:
		!mov.l	dword_607D170, r7 ! 0x8000
		mov.l	dword_607D170, r7 ! 0x80
		mov	#0, r6
		mov	r4, r5
		add	#4, r5

loc_607D100:
		mov	#0, r3

loc_607D102:
		;mov.w	@r9, r1
		mov.b	@r9, r1
		;extu.w	r1, r1
		extu.b	r1, r1
		and	r7, r1
		tst	r1, r1
		bt/s	loc_607D112
		extu.b	r3, r0
		bra	loc_607D120
		mov.b	@r12, r1

loc_607D112:
		mov.l	@r5, r1
		and	r7, r1
		tst	r1, r1
		bf/s	loc_607D120
		mov	#0xA, r1
		extu.b	r3, r0
		mov	#0, r1

loc_607D120:
		mov.b	r1, @(r0,r14)
		shlr	r7
		add	#1, r3
		!extu.b	r3, r2          ! unnecessary
		mov	#1, r1
		!cmp/hi	r1, r2
		cmp/hi	r1, r3          ! this can be cmp/hi  r1, r3
		bf/s	loc_607D102
		mov	r14, r2
		add	#1, r2
		mov.b	@r14, r1
		!add	#2, r6
		add	#4, r6
		mov.b	@r2, r2
		shll2	r1
		shll2	r1
		or	r2, r1
		mov.b	r1, @r8
		cmp/hi	r11, r6
		bf/s	loc_607D100
		add	#1, r8
		!add	#2, r9
		add	#1, r9
		add	#1, r10
		cmp/hi	r11, r10
		bf/s	loc_607D0F8
		add	#4, r4
		add	#0x48, r14
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r12
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

.align 2
off_607D164:	.long 0x00288000
off_607D168:	.long 0x06017748
off_607D16C:	.long 0x0603E9F0
!dword_607D170:	.long 0x8000
dword_607D170:	.long 0x80

.align 2
sub_607D174:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		mov	r15, r14
		mov	r5, r7
		mov	r7, r9
		mov	#4, r1
		cmp/hi	r1, r9		! max rows check?
		bf/s	loc_607D194
		mov	r6, r5		! char index
		add	#-5, r9

loc_607D18C:
		cmp/hi	r1, r9
		bt/s	loc_607D18C
		add	#-5, r9
		add	#5, r9

loc_607D194:
		mov.l	off_607D220, r1	! unk_60887C8
		mov.b	@r1, r1
		extu.b	r1, r0
		cmp/eq	#1, r0
		bt/s	loc_607D1AE
		mov	#34, r3		! max number of	characters in a	line 32+2
		mov.l	off_607D224, r1	! unk_60887C9
		mov.b	@r1, r1
		extu.b	r1, r0
		cmp/eq	#1, r0
		bt/s	loc_607D1B0
		extu.b	r4, r2
		mov	#26, r3		! max number of	characters in a	line(24+2)

loc_607D1AE:
		extu.b	r4, r2

loc_607D1B0:
		mov	r2, r1
		shll2	r1
		add	r2, r1
		mov.l	off_607D228, r2	! spr_list_num
		add	r2, r1
		mov	r1, r0
		mov.b	@(r0,r9), r1
		extu.b	r1, r2
		cmp/eq	r3, r2
		bt/s	loc_607D1F0
		mov	r3, r1
		add	#-1, r1
		cmp/eq	r1, r2
		bf	loc_607D1F4
		mov.w	@r5, r1		! read text from buffer(convert	to byte	reads)
		extu.w	r1, r2
		mov	r2, r0
		cmp/eq	#5, r0
		bt/s	loc_607D1F4
		mov	#5, r1
		cmp/gt	r1, r2
		bt/s	loc_607D1E6
		cmp/eq	#3, r0
		bt/s	loc_607D1F4
		cmp/eq	#4, r0
		bra	loc_607D1EC
		nop

loc_607D1E6:
		cmp/eq	#6, r0
		bt/s	loc_607D1F4
		cmp/eq	#0x67, r0

loc_607D1EC:
		bt/s	loc_607D1F6
		extu.b	r4, r4

loc_607D1F0:
		bra	loc_607D214
		mov	#0xFFFFFFFF, r0

loc_607D1F4:
		extu.b	r4, r4

loc_607D1F6:
		mov	r4, r8
		shll2	r8
		add	r4, r8
		mov.l	off_607D228, r1	! spr_list_num
		add	r1, r8
		mov	r8, r0
		mov.b	@(r0,r9), r6	! r9 ==	row
		mov.l	off_607D22C, r1
		jsr	@r1 ! sub_607CF8C
		extu.b	r6, r6		! column
		mov	r8, r0
		mov.b	@(r0,r9), r1
		add	#1, r1
		mov.b	r1, @(r0,r9)
		mov	#0, r0

loc_607D214:
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

.align 2
off_607D220:	.long 0x060887C8
off_607D224:	.long 0x060887C9
off_607D228:	.long spr_list_num
off_607D22C:	.long 0x0607CF8C

.align 2
sub_607D230:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r12, @-r15
		mov.l	r13, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-0x10,	r15
		mov	r15, r14
		mov	#3, r0
		mov.b	r4, @(r0,r14)
		mov	#0, r13
		mov.l	r13, @(4,r14)
		mov	#3, r0
		mov.b	@(r0,r14), r0
		extu.b	r0, r1
		mov	r1, r6
		shll2	r6
		mov.l	off_607D4A0, r1	! dword_60885F0
		mov	r6, r7
		add	r1, r7
		mov.l	@r7, r3
		tst	r3, r3
		bt/s	loc_607D300
		mov	r7, r2
		add	#3, r2
		mov.l	off_607D4A4, r4	! dword_60370C8
		mov	r4, r1
		mov.b	@r2, r2
		add	#3, r1
		mov.b	@r1, r5
		mov	r2, r1
		sub	r5, r1
		exts.b	r1, r1
		cmp/pl	r1
		bt/s	loc_607D2E6
		mov	r6, r0
		mov.l	r13, @r7
		mov.l	off_607D4A8, r1	! dword_60885E0
		mov.l	@(r0,r1), r6
		mov	#4, r1
		cmp/hi	r1, r6
		bf/s	loc_607D294
		mov	r2, r5
		add	#-5, r6

loc_607D28C:
		cmp/hi	r1, r6
		bt/s	loc_607D28C
		add	#-5, r6
		add	#5, r6

loc_607D294:
		mov	#3, r13
		add	r14, r13
		mov.b	@r13, r13
		mov.l	off_607D4AC, r2	! spr_list_num
		mov	#0, r7
		mov	#0x20, r11
		mov	#0xAA, r10
		extu.b r10, r10
		mov.l	off_607D4B0, r9	! spr_list_dispenable
		mov	#0x22, r8
		mov	#0, r4
		mov	r13, r1
		shll2	r1
		add	r13, r1
		add	r2, r1
		mov	#0, r2
		mov	r1, r0
		mov.b	r2, @(r0,r6)

loc_607D2B8:
		mul.l	r10, r13
		extu.b	r7, r0
		sts	macl, r1
		mul.l	r8, r6
		add	#1, r7
		add	r9, r1
		sts	macl, r2
		add	r1, r2
		extu.b	r7, r1
		cmp/hi	r11, r1
		bf/s	loc_607D2B8
		mov.b	r4, @(r0,r2)
		mov	#3, r13
		add	r14, r13
		mov.b	@r13, r13
		extu.b	r13, r1
		shll2	r1
		mov.l	off_607D4A8, r2	! dword_60885E0
		add	r2, r1
		mov.l	@r1, r2
		add	#1, r2
		bra	loc_607D2EE
		mov.l	r2, @r1

loc_607D2E6:
		mov.l	@r4, r1
		sub	r1, r3
		mov	r3, r1
		mov.l	r1, @r7

loc_607D2EE:
		exts.b	r5, r5
		mov	#3, r0
		mov.b	@(r0,r14), r0
		mov.l	off_607D4B4, r1	! sub_607CF48
		jsr	@r1 ! sub_607CF48
		extu.b	r0, r4
		mov	#1, r13
		bra	loc_607D31E
		mov.l	r13, @(4,r14)

loc_607D300:
		extu.b	r5, r0
		cmp/eq	#1, r0
		bf/s	loc_607D320
		mov	#3, r13
		mov.l	off_607D4B8, r1	! dword_60885E8
		mov	r6, r0
		mov.l	@(r0,r1), r3
		mov.l	off_607D4A8, r2	! dword_60885E0
		mov.l	@(r0,r2), r1
		cmp/eq	r1, r3
		bt/s	loc_607D31E
		mov	#0x12, r13
		mov.l	r13, @r7
		mov	#1, r0
		mov.l	r0, @(4,r14)

loc_607D31E:
		mov	#3, r13

loc_607D320:
		add	r14, r13
		mov.b	@r13, r13
		mov.l	off_607D4A0, r1	! dword_60885F0
		extu.b	r13, r9
		mov	r9, r8
		shll2	r8
		mov	r8, r0
		mov.l	@(r0,r1), r1
		tst	r1, r1
		bt/s	loc_607D38C
		mov	r9, r12
		mov.l	off_607D4BC, r1	! _slCurWindow
		jsr	@r1 ! _slCurWindow
		mov	#1, r4
		mov.l	off_607D4C0, r1	! unk_604EDF8
		mov	r8, r3
		add	r1, r3
		mov	r3, r1
		add	#1, r1
		mov	r8, r2
		mov	#0, r13
		mov.b	@r1, r5
		mov	#0, r0
		mov.b	@r3, r4
		mov.l	off_607D4C4, r1	! unk_60352A8
		add	r1, r2
		mov	r2, r1
		add	#1, r1
		mov	r5, r7
		mov.b	@r1, r1
		mov	r4, r6
		add	r1, r7
		shll2	r7
		add	r7, r7
		add	#-1, r7
		mov.b	@r2, r1
		exts.w	r7, r7
		add	r1, r6
		shll2	r6
		add	r6, r6
		add	#-1, r6
		exts.w	r6, r6
		shll2	r5
		add	r5, r5
		shll2	r4
		mov.l	r13, @-r15
		mov.l	r0, @-r15
		mov	#0xFFFFFFC7, r13
		extu.b	r13, r13
		mov.l	r13, @-r15
		mov.l	off_607D4C8, r0	! _slWindow
		jsr	@r0 ! _slWindow
		add	r4, r4
		add	#0xC, r15

loc_607D38C:
		mov	#0, r13
		mov.l	r13, @(0xC,r14)
		mov	r8, r2
		add	r12, r2
		mov.l	off_607D4AC, r1	! spr_list_num
		mov	r2, r11
		add	r1, r11
		mov	#0, r10

loc_607D39C:
		mov.b	@r11, r1
		mov	#0, r8
		extu.b	r1, r1
		cmp/hs	r1, r8
		bt/s	loc_607D458
		mov	#0xAA, r1
		extu.b	r1, r1
		mov.l	off_607D4CC, r9	! spr_cmd
		mov	r9, r6
		add	#8, r6

loc_607D3AE:
		mul.l	r1, r12
		sts	macl, r7
		mov.l	off_607D4B0, r1	! spr_list_dispenable
		add	r7, r1
		add	r10, r1
		mov	r1, r0
		mov.b	@(r0,r8), r1
		extu.b	r1, r1
		tst	r1, r1
		bt/s	loc_607D44C
		mov	r9, r1
		mov	#0, r13
		mov.w	r13, @r9	! CTRL
		add	#2, r1
		mov	#0, r0
		mov.w	r0, @r1		! LINK
		mov	r9, r1
		add	#4, r1
		mov.w	word_607D49A, r13 ! 0x480
		mov.w	r13, @r1	! PMOD
		mov	r9, r1
		add	#6, r1
		mov	#0x70, r0
		mov.w	r0, @r1		! COLR
		mov	r9, r1
		add	#0x1C, r1
		mov	#0, r13
		mov.w	r13, @r1	! GRDA
		mov.w	word_607D49C, r1 ! 0x2A80
		mov.l	dword_607D4D0, r3 ! 0x60000
		!mov.w	word_607D49E, r13 ! 0x210
		mov.w	word_607D49E, r13 ! 0x110
		mul.l	r1, r12
		mov.l	dword_607D4D4, r5 ! 0xC80000
		mov	r9, r4
		mov.l	off_607D4D8, r1	! spr_list_srca
		add	r7, r1
		add	r10, r1
		mov	r1, r0
		mov.b	@(r0,r8), r1
		sts	macl, r2
		extu.b	r1, r1
		shll2	r1
		shll2	r1
		add	r1, r1
		shll2	r1
		add	r3, r1
		add	r1, r2
		shar	r2
		shar	r2
		shar	r2
		mov.w	r2, @r6		! SRCA
		mov	r9, r1
		add	#0xA, r1
		mov.w	r13, @r1	! SIZE
		mov	r9, r2
		add	#0xC, r2
		mov.l	off_607D4DC, r1	! spr_list_xa
		add	r7, r1
		add	r10, r1
		mov	r1, r0
		mov.b	@(r0,r8), r1	! This is set at 0x0607D044
		mov.l	off_607D4E0, r13 ! _slSetSprite
		extu.b	r1, r1
		shll2	r1
		add	r1, r1 ! disabling this does fix the positioning, but the true fix is to modify the code that is fed in from @(r0,r8)
		add	#0xA, r1
		mov.w	r1, @r2		! XA
		mov	r9, r2
		mov.l	off_607D4E4, r1	! spr_list_ya
		add	r7, r1
		add	r10, r1
		mov	r1, r0
		mov.b	@(r0,r8), r1
		add	#0xE, r2
		extu.b	r1, r1
		mov.w	r1, @r2		! YA
		jsr	@r13 ! _slSetSprite
		mov.l	r6, @(8,r14)
		mov.l	@(8,r14), r6

loc_607D44C:
		mov.b	@r11, r1
		add	#1, r8
		extu.b	r1, r1
		cmp/hs	r1, r8
		mov	#0xAA, r1
		bf/s	loc_607D3AE
		extu.b	r1, r1

loc_607D458:
		add	#1, r11
		add	#0x22, r10
		mov.l	@(0xC,r14), r0
		mov	#4, r1
		add	#1, r0
		cmp/hi	r1, r0
		bf/s	loc_607D39C
		mov.l	r0, @(0xC,r14)
		mov	#3, r13
		add	r14, r13
		mov.b	@r13, r13
		extu.b	r13, r1
		mov	r1, r2
		shll2	r2
		mov.l	off_607D4E8, r1	! unk_60885F8
		mov	#0, r13
		mov	r2, r0
		mov.l	r13, @(r0,r1)
		mov.l	off_607D4BC, r1	! _slCurWindow
		jsr	@r1 ! _slCurWindow
		mov	#0, r4
		mov.l	@(4,r14), r0
		add	#0x10, r14
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r13
		mov.l	@r15+, r12
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

word_607D49A:	.word 0x480
word_607D49C:	.word 0x2A80
!word_607D49E:	.word 0x210
word_607D49E:	.word 0x110
.align 2
off_607D4A0:	.long 0x060885F0
off_607D4A4:	.long 0x060370C8
off_607D4A8:	.long 0x060885E0
off_607D4AC:	.long spr_list_num
off_607D4B0:	.long spr_list_dispenable
off_607D4B4:	.long 0x0607CF48
off_607D4B8:	.long 0x060885E8
off_607D4BC:	.long 0x0602DD10
off_607D4C0:	.long 0x0604EDF8
off_607D4C4:	.long 0x060352A8
off_607D4C8:	.long 0x0602DC4C
off_607D4CC:	.long 0x060882E8 ! spr_cmd
dword_607D4D0:	.long 0x60000
dword_607D4D4:	.long 0xC80000
off_607D4D8:	.long 0x06088308 ! spr_list_srca
off_607D4DC:	.long spr_list_xa
off_607D4E0:	.long 0x0602E034
off_607D4E4:	.long spr_list_ya
off_607D4E8:	.long 0x060885F8

.align 2
sub_607EF10:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		extu.w	r5, r3
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F1B0, r2	! off_6088620
		mov	r1, r8
		add	r2, r8
		shll2	r3
		mov.l	off_607F1B4, r1	! unk_6088000
		mov	r3, r2
		add	r1, r2
		mov.l	@r2, r1
		mov	r15, r14
		mov	r1, r0
		shll2	r0
		mov.l	@(r0,r8), r1
		mov	r4, r9		! output buffer	for text
		!mov.w	@r1, r7		! read character(word size) of dialogue	text
		mov.b	@r1, r7		! read character(word size) of dialogue	text
		mov	r6, r4
		mov	r7, r6
		add	#1, r1
		mov.b	@r1, r10	! low byte of character(only used for 0xFDXX/0xFEXX)
		!extu.w	r7, r3
		extu.b	r7, r3
		#mov.l	dword_607F1B8, r1 ! 0xDFFF
		mov	#0xDF, r1
        extu.b r1, r1
		cmp/hi	r1, r3		! is character value > 0xDFFF
		!bt/s	loc_607EF58
		bt	loc_607EF58
		!shlr8	r6		! high byte of character
        !nop
		bra	loc_607F2EE	! store	character
		or	r0, r0

loc_607EF58:
        shll8 r3   ! added to fix earlier parsing changes
        extu.b r10, r10
        or r10, r3 !
		mov.l	dword_607F1BC, r2 ! 0xFFF9
		mov	#6, r1
		sub	r2, r3		! character - 0xFFF9
		mov	r3, r2
		cmp/hi	r1, r2
		bf/s	loc_607EF6A	! character == 0xFFF9 -	0xFFFF
		mov	r2, r1
		bra	loc_607F0B8	! character < 0xFFF9
		or	r0, r0

loc_607EF6A:
		add	r1, r1		! character == 0xFFF9 -	0xFFFF
		mova	off_607EF78, r0	! (loc_607F08A - off_607EF78)
		mov.w	@(r0,r1), r1
		add	r1, r0
		jmp	@r0		! 0xFFFF
		nop

.align 2
off_607EF78:	
		.word loc_607F08A - off_607EF78 ! 0xFFF9
		.word loc_607F05C - off_607EF78	! 0xFFFA
		.word loc_607EFF4 - off_607EF78	! 0xFFFB
		.word loc_607EFD4 - off_607EF78	! 0xFFFC
		.word loc_607F030 - off_607EF78	! 0xFFFD
		.word loc_607EFB6 - off_607EF78	! 0xFFFE
		.word loc_607EF86 - off_607EF78	! 0xFFFF

loc_607EF86:
		extu.w	r5, r3		! 0xFFFF
		mov	r3, r2
		shll2	r2
		mov.l	off_607F1B4, r1	! unk_6088000
		add	r2, r1
		mov.l	@r1, r2
		tst	r2, r2
		bt/s	loc_607EFB0
		add	#-1, r2
		mov.l	r2, @r1
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F1B0, r3	! off_6088620
		add	r3, r1
		shll2	r2
		add	r1, r2
		mov.l	@r2, r1
		bra	loc_607F2FA
		mov	#0xFFFFFFFF, r8

loc_607EFB0:
		mov	#0, r8
		bra	loc_607EFC8
		mov	r3, r2

loc_607EFB6:
		extu.w	r5, r1		! 0xFFFE
		mov	r1, r3
		shll2	r3
		mov.l	off_607F1B4, r2	! unk_6088000
		mov	#0, r11
		mov	r3, r0
		mov.l	r11, @(r0,r2)
		mov	#0, r8
		mov	r1, r2

loc_607EFC8:
		add	r2, r2
		mov.l	off_607F1C0, r1	! unk_6087FEC
		mov	#5, r11
		mov	r2, r0
		bra	loc_607F2FE
		mov.w	r11, @(r0,r1)

loc_607EFD4:
		mov	#0xFFFFFFFC, r0	! 0xFFFC
		mov.w	r0, @r9
		extu.w	r5, r3
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F1B0, r2	! off_6088620
		add	r2, r1
		shll2	r3
		mov.l	off_607F1B4, r2	! unk_6088000
		mov	r3, r0
		mov.l	@(r0,r2), r2
		shll2	r2
		bra	loc_607F2F6
		add	r1, r2

loc_607EFF4:
		extu.w	r5, r2		! 0xFFFB
		mov	r2, r7
		add	r7, r7
		mov	r7, r3
		add	r2, r3
		shll2	r3
		mov.l	off_607F1B0, r1	! off_6088620
		add	r1, r3
		shll2	r2
		mov.l	off_607F1B4, r1	! unk_6088000
		mov	r2, r0
		mov.l	@(r0,r1), r2
		shll2	r2
		add	r3, r2
		mov.l	@r2, r1
		mov	r7, r0
		add	#2, r1
		mov.l	r1, @r2
		mov.l	off_607F1C0, r1	! unk_6087FEC
		mov	#2, r11
		mov.w	r11, @(r0,r1)
		extu.b	r4, r1
		mov	r1, r0
		cmp/eq	#1, r0
		bt/s	loc_607F02C
		mov	#0, r8
		bra	loc_607F2FE
		or	r0, r0

loc_607F02C:
		bra	loc_607F2FE
		mov	#0xFFFFFFFF, r8

loc_607F030:
		extu.w	r5, r2		! 0xFFFD
		mov	r2, r3
		add	r3, r3
		mov.l	off_607F1C0, r1	! unk_6087FEC
		mov	#3, r11
		mov	r3, r0
		mov.w	r11, @(r0,r1)
		mov	#0xFFFFFFFD, r0
		mov.w	r0, @r9
		add	r2, r3
		shll2	r3
		mov.l	off_607F1B0, r1	! off_6088620
		add	r1, r3
		shll2	r2
		mov.l	off_607F1B4, r1	! unk_6088000
		mov	r2, r0
		mov.l	@(r0,r1), r2
		shll2	r2
		add	r3, r2
		mov.l	@r2, r1
		bra	loc_607F2FA
		mov	#0, r8

loc_607F05C:
		extu.w	r5, r3		! 0xFFFA
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F1B0, r2	! off_6088620
		add	r2, r1
		mov	r3, r7
		shll2	r7
		mov.l	off_607F1B4, r2	! unk_6088000
		mov	r7, r0
		mov.l	@(r0,r2), r2
		mov	#0xFFFFFFFF, r8
		shll2	r2
		add	r1, r2
		mov.l	@r2, r1
		mov	r3, r0
		add	#2, r1
		mov.l	r1, @r2
		mov.l	off_607F1C4, r2	! unk_6087CC8
		mov	#2, r1
		bra	loc_607F2FE
		mov.b	r1, @(r0,r2)

loc_607F08A:
		extu.w	r5, r3		! 0xFFF9
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F1B0, r2	! off_6088620
		add	r2, r1
		mov	r3, r7
		shll2	r7
		mov.l	off_607F1B4, r2	! unk_6088000
		mov	r7, r0
		mov.l	@(r0,r2), r2
		mov	#0xFFFFFFFF, r8
		shll2	r2
		add	r1, r2
		mov.l	@r2, r1
		mov	r3, r0
		add	#2, r1
		mov.l	r1, @r2
		mov.l	off_607F1C4, r2	! unk_6087CC8
		mov	#1, r1
		bra	loc_607F2FE
		mov.b	r1, @(r0,r2)

loc_607F0B8:
		extu.b	r6, r2
		mov.w	word_607F1AC, r3 ! 0xF6
		mov	#8, r1
		sub	r3, r2
		cmp/hi	r1, r2		! is high byte of character < 0xF6?
		bf/s	loc_607F0CA
		mov	r2, r1
		bra	loc_607F22C	! high byte of character < 0xF6
		or	r0, r0

loc_607F0CA:
		add	r1, r1
		mova	off_607F0D8, r0	! (loc_607F1CC - off_607F0D8)
		mov.w	@(r0,r1), r1
		add	r1, r0
		jmp	@r0		! 0xFBXX
		nop

.align 2
off_607F0D8:	
		.word loc_607F1CC - off_607F0D8 ! 0xF6XX
		.word loc_607F22C - off_607F0D8	! 0xF7XX-0xF9XX,0xFCXX
		.word loc_607F22C - off_607F0D8	! 0xF7XX-0xF9XX,0xFCXX
		.word loc_607F22C - off_607F0D8	! 0xF7XX-0xF9XX,0xFCXX
		.word loc_607F10A - off_607F0D8	! 0xFAXX
		.word loc_607F0EA - off_607F0D8	! 0xFBXX
		.word loc_607F22C - off_607F0D8	! 0xF7XX-0xF9XX,0xFCXX
		.word loc_607F164 - off_607F0D8	! 0xFDXX
		.word loc_607F12A - off_607F0D8	! 0xFEXX

loc_607F0EA:
		extu.w	r5, r3		! 0xFBXX
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F1B0, r2	! off_6088620
		add	r2, r1
		mov	r3, r0
		shll2	r0
		mov.l	off_607F1B4, r2	! unk_6088000
		mov.l	@(r0,r2), r2
		shll2	r2
		add	r1, r2
		mov.l	@r2, r1
		bra	loc_607F2FA
		mov	#0xFFFFFFFF, r8

loc_607F10A:
		extu.w	r5, r3		! 0xFAXX
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F1B0, r2	! off_6088620
		add	r2, r1
		mov	r3, r0
		shll2	r0
		mov.l	off_607F1B4, r2	! unk_6088000
		mov.l	@(r0,r2), r2
		shll2	r2
		add	r1, r2
		mov.l	@r2, r1
		bra	loc_607F2FA
		mov	#0xFFFFFFFF, r8

loc_607F12A:
		extu.w	r5, r2		! 0xFEXX
		mov	r2, r7
		add	r7, r7
		mov	r7, r3
		add	r2, r3
		shll2	r3
		mov.l	off_607F1B0, r1	! off_6088620
		add	r1, r3
		mov	r2, r0
		shll2	r0
		mov.l	off_607F1B4, r1	! unk_6088000
		mov.l	@(r0,r1), r2
		shll2	r2
		add	r3, r2
		extu.b	r4, r0
		mov.l	@r2, r1
		cmp/eq	#1, r0
		add	#2, r1
		bt/s	loc_607F228
		mov.l	r1, @r2
		mov.l	off_607F1C0, r1	! unk_6087FEC
		mov	#4, r11
		mov	r7, r0
		mov.w	r11, @(r0,r1)
		mov.l	off_607F1C8, r2	! unk_6087FF0
		extu.b	r10, r1
		mov.l	r1, @r2
		bra	loc_607F2FE
		mov	#0, r8

loc_607F164:
		extu.w	r5, r2		! 0xFDXX
		mov	r2, r7
		add	r7, r7
		mov	r7, r3
		add	r2, r3
		shll2	r3
		mov.l	off_607F1B0, r1	! off_6088620
		add	r1, r3
		shll2	r2
		mov.l	off_607F1B4, r1	! unk_6088000
		mov	r2, r0
		mov.l	@(r0,r1), r2
		mov	#0xFFFFFFFD, r11
		shll2	r2
		add	r3, r2
		mov.l	@r2, r1
		mov	#0, r8
		add	#2, r1
		mov.l	r1, @r2
		extu.b	r4, r1
		mov	r1, r0
		cmp/eq	#1, r0
		bf/s	loc_607F19E
		mov.w	r11, @r9
		mov.l	off_607F1C0, r1	! unk_6087FEC
		mov	#3, r11
		mov	r7, r0
		bra	loc_607F2FE
		mov.w	r11, @(r0,r1)

loc_607F19E:
		mov.l	off_607F1C0, r1	! unk_6087FEC
		mov	#4, r11
		mov	r7, r0
		mov.w	r11, @(r0,r1)
		mov.l	off_607F1C8, r2	! unk_6087FF0
		bra	loc_607F2FC
		extu.b	r10, r1

word_607F1AC:	.word 0xF6
.align 2
off_607F1B0:	.long 0x06088620
off_607F1B4:	.long 0x06088000
!dword_607F1B8:	.long 0xDFFF
!dword_607F1B8:	.long 0x00DF
dword_607F1BC:	.long 0xFFF9
off_607F1C0:	.long 0x06087FEC
off_607F1C4:	.long 0x06087CC8
off_607F1C8:	.long 0x06087FF0

loc_607F1CC:
		extu.w	r5, r3		! 0xF6XX
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F314, r2	! off_6088620
		mov	r1, r9
		add	r2, r9
		shll2	r3              ! calculate offset to current text pointer
		mov.l	off_607F318, r1	! unk_6088000
		mov	r3, r8
		add	r1, r8
		mov.l	@r8, r2
		shll2	r2
		add	r9, r2
		mov.l	@r2, r1
		add	#2, r1          ! move pointer to offset +2 of start of 0xF600XXXX
		mov.l	r1, @r2
		mov.l	@r8, r3
		mov.b	@r1+, r4 ! fetch two bytes instead of one word in order to handle misaligned reads
		shll8	r4
		mov.b	@r1, r2
		extu.b	r2, r2
		or	r2, r4
		mov.l	dword_607F31C, r2 ! 0xFFFC
		extu.w	r4, r1
		cmp/eq	r2, r1
		bf/s	loc_607F214
		mov	r3, r1
		mov.l	off_607F320, r1	! unk_603A47E
		mov.w	@r1, r1
		mov.w	word_607F310, r2 ! 0xB8
		mulu	r2, r1
		sts	macl, r0
		mov.l	off_607F324, r1	! unk_6037184
		mov.w	@(r0,r1), r4
		mov	r3, r1

loc_607F214:
		add	#1, r1
		mov.l	r1, @r8
		mov.l	off_607F328, r0	! sub_607AB14
		jsr	@r0 ! sub_607AB14
		extu.w	r4, r4
		mov.l	@r8, r1
		mov	r0, r2
		mov	r1, r0
		shll2	r0
		mov.l	r2, @(r0,r9)

loc_607F228:
		bra	loc_607F2FE
		mov	#0xFFFFFFFF, r8

loc_607F22C:
		mov	r6, r3		! 0xF7XX-0xF9XX,0xFCXX
		add	#0x12, r3
		extu.b	r3, r2
		mov	#7, r1
		cmp/hi	r1, r2
		bt/s	loc_607F2CE
		extu.b	r3, r1
		add	#-7, r1
		neg	r1, r6
		extu.w	r5, r3
		mov	r3, r7
		add	r7, r7
		add	r3, r7
		shll2	r7
		mov.l	off_607F314, r1	! off_6088620
		add	r1, r7
		shll2	r3
		mov.l	off_607F318, r1	! unk_6088000
		add	r1, r3
		mov.l	@r3, r2
		shll2	r2
		add	r7, r2
		mov.l	@r2, r1
		add	#2, r1
		mov.l	r1, @r2
		mov.l	@r3, r1
		mov	r1, r0
		shll2	r0
		mov.l	@(r0,r7), r1
		mov.w	@r1, r4
		extu.w	r4, r1
		tst	r1, r1
		bt/s	loc_607F274
		mov	r1, r0
		cmp/eq	#0x27, r0
		bf	loc_607F296

loc_607F274:
		mov.l	off_607F32C, r1	! unk_603708E
		mov.b	@r1, r0
		cmp/eq	#1, r0
		bf/s	loc_607F296
		extu.w	r4, r1
		mov.l	off_607F330, r1	! unk_604E91C
		mov.b	@r1, r0
		cmp/eq	#1, r0
		bf/s	loc_607F296
		extu.w	r4, r1
		extu.b	r6, r1
		mov	r1, r0
		add	r0, r0
		mov.l	off_607F334, r1	! unk_6034D90
		mov.w	@(r0,r1), r0
		bra	loc_607F2B2
		mov.w	r0, @r9

loc_607F296:
		mov.l	off_607F338, r2	! off_604E9FC
		add	r1, r1
		mov.l	@r2, r2
		mov	r1, r0
		mov.w	@(r0,r2), r1
		extu.w	r1, r1
		extu.b	r6, r2
		add	r2, r1
		mov.l	off_607F33C, r2	! off_604EB68
		add	r1, r1
		mov.l	@r2, r2
		mov	r1, r0
		mov.w	@(r0,r2), r1
		mov.w	r1, @r9

loc_607F2B2:
		extu.w	r5, r3
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F314, r2	! off_6088620
		add	r2, r1
		mov	r3, r0
		shll2	r0
		mov.l	off_607F318, r2	! unk_6088000
		mov.l	@(r0,r2), r2
		shll2	r2
		bra	loc_607F2F6
		add	r1, r2

loc_607F2CE:
		extu.w	r5, r3
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F314, r2	! off_6088620
		add	r2, r1
		mov	r3, r0
		shll2	r0
		mov.l	off_607F318, r2	! unk_6088000
		mov.l	@(r0,r2), r2
		shll2	r2
		add	r1, r2
		mov.l	@r2, r1
		bra	loc_607F2FA
		mov	#0xFFFFFFFF, r8

loc_607F2EE:
		mov.b	r7, @r9		! store	character
		mov.l	@r2, r2
		shll2	r2
		add	r8, r2

loc_607F2F6:
		mov.l	@r2, r1
		mov	#1, r8

loc_607F2FA:
		!add	#2, r1 ! increment text pointer, should be variable
		add	#1, r1 ! increment text pointer, should be variable

loc_607F2FC:
		mov.l	r1, @r2

loc_607F2FE:
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		exts.b	r8, r0
		rts
		mov.l	@r15+, r8

word_607F310:	.word 0xB8
.align 2
off_607F314:	.long 0x06088620
off_607F318:	.long 0x06088000
dword_607F31C:	.long 0xFFFC
off_607F320:	.long 0x0603A47E
off_607F324:	.long 0x06037184
off_607F328:	.long 0x0607AB14
off_607F32C:	.long 0x0603708E
off_607F330:	.long 0x0604E91C
off_607F334:	.long 0x06034D90
off_607F338:	.long 0x0604E9FC
off_607F33C:	.long 0x0604EB68

.align 2
sub_607F370:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-4, r15
		mov	r15, r14
		mov	r5, r11
		mov	#1, r0
		extu.w	r4, r2
		tst	r2, r2
		bt/s	loc_607F398
		mov.w	r0, @r14
		mov	r2, r0
		cmp/eq	#0x30, r0
		bt	loc_607F398
		mov.l	dword_607F484, r1 ! 0x8000
		cmp/eq	r1, r2
		bf	loc_607F3AE

loc_607F398:
		mov.l	off_607F488, r1	! unk_603708E
		mov.b	@r1, r0
		cmp/eq	#1, r0
		bf	loc_607F3AE
		mov.l	off_607F48C, r1	! unk_604E91C
		mov.b	@r1, r0
		cmp/eq	#1, r0
		bf	loc_607F3AE
		mov.l	off_607F490, r8	! unk_6034D90
		bra	loc_607F436
		nop

loc_607F3AE:
		mov.w	word_607F47C, r1 ! 0x4000
		and	r4, r1
		tst	r1, r1
		bt/s	loc_607F3E2
		mov	#0, r2
		mov.w	word_607F47E, r3 ! 0xB8
		mov.l	off_607F494, r5	! unk_6037180
		extu.w	r4, r4
		mov	#0x33, r6
		mulu	r3, r2

loc_607F3C2:				! CODE XREF: sub_607F370+6Aj
		sts	macl, r1
		mov	r1, r7
		add	r5, r7
		mov	r7, r1
		add	#4, r1
		mov.w	@r1, r1
		extu.w	r1, r1
		cmp/eq	r4, r1
		bt	loc_607F404
		add	#1, r2
		extu.w	r2, r1
		cmp/hi	r6, r1
		bf/s	loc_607F3C2
		mulu	r3, r2
		bra	loc_607F436
		nop

loc_607F3E2:
		mov.w	word_607F480, r3 ! 0x7FFF
		extu.w	r4, r7
		extu.w	r3, r1
		cmp/hi	r1, r7
		bt/s	loc_607F422
		mov	r3, r1
		mov.l	off_607F498, r1	! off_604E9FC
		mov.l	@r1, r2
		mov	r7, r1
		add	r1, r1
		mov	r1, r0
		mov.w	@(r0,r2), r1
		mov.l	off_607F49C, r3	! off_604EB68
		extu.w	r1, r1
		add	r1, r1
		bra	loc_607F432
		mov.l	@r3, r2

loc_607F404:
		mov	r7, r2
		add	#6, r2
		mov.w	@r2, r2
		mov.w	word_607F482, r1 ! 0x1FFF
		and	r2, r1
		mov.l	off_607F4A0, r2	! off_6036278
		add	r1, r1
		mov.l	@r2, r2
		mov	r1, r0
		mov.w	@(r0,r2), r1
		mov.l	off_607F4A4, r3	! off_6034BE4
		extu.w	r1, r1
		add	r1, r1
		bra	loc_607F432
		mov.l	@r3, r2

loc_607F422:
		mov.l	off_607F4A8, r2	! off_603D570
		and	r4, r1
		add	r1, r1
		add	#4, r1
		mov.l	@r2, r2
		mov	r1, r0
		mov.w	@(r0,r2), r1
		extu.w	r1, r1

loc_607F432:
		mov	r1, r8
		add	r2, r8

loc_607F436:
		mov.l	off_607F4AC, r2	! unk_603E9F0
		mov	#5, r1
		mov.b	r1, @r2
		mov.b	@r8, r1		! read text character from buffer
		mov	    #0xFF, r9 ! 0xFFFF
        extu.b	r9, r9
		extu.b	r1, r1
		cmp/eq	r9, r1 ! is it an end code?
		bt/s	loc_607F45C
		mov.l	off_607F4B4, r10 ! sub_607CD64
		mov	r8, r5

loc_607F44C:
		jsr	@r10 ! sub_607CD64
		extu.b	r11, r4
		add	#1, r8
		mov.b	@r8, r1		! read text character from buffer
		extu.b	r1, r1		! change to extu.b
		cmp/eq	r9, r1
		bf/s	loc_607F44C
		mov	r8, r5

loc_607F45C:
		mov.l	off_607F4AC, r2	! unk_603E9F0
		mov	#7, r1
		mov.b	r1, @r2		! ???
		extu.b	r11, r4
		jsr	@r10 ! sub_607CD64
		mov	r14, r5
		add	#4, r14
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

word_607F47C:	.word 0x4000
word_607F47E:	.word 0xB8
word_607F480:	.word 0x7FFF
word_607F482:	.word 0x1FFF
.align 2
dword_607F484:	.long 0x8000
off_607F488:	.long 0x0603708E
off_607F48C:	.long 0x0604E91C
off_607F490:	.long 0x06034D90
off_607F494:	.long 0x06037180
off_607F498:	.long 0x0604E9FC
off_607F49C:	.long 0x0604EB68
off_607F4A0:	.long 0x06036278
off_607F4A4:	.long 0x06034BE4
off_607F4A8:	.long 0x0603D570
off_607F4AC:	.long 0x0603E9F0
off_607F4B4:	.long 0x0607CD64

.align 2
_spr_list_num: .byte 0xA, 0xC, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.align 2
sub_60919D0:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-4, r15
		mov	r15, r14
		mov	#0, r1
		mov.b	r1, @r14
		mov.l	off_6091B88, r1	! 0x060953FA
		mov.w	@r1, r1
		extu.w	r1, r2
		mov	#5, r1
		cmp/hi	r1, r2
		bf/s	loc_60919F6
		mov	#0, r10
		bra	loc_6092010
		or	r0, r0
loc_60919F6:
		mov	r2, r1
		add	r1, r1
		mova	off_6091A04, r0	! (loc_6091A10 - off_6091A04)
		mov.w	@(r0,r1), r1
		add	r1, r0
		jmp	@r0
		nop
off_6091A04:
		.word loc_6091A10 - off_6091A04
		.word loc_6091AAC - off_6091A04
		.word loc_6091AD8 - off_6091A04
		.word loc_6091FDA - off_6091A04
		.word loc_6091FAA - off_6091A04
		.word loc_6091FFC - off_6091A04

loc_6091A10:
		mov	#0, r10
		mov.l	off_6091B8C, r5	! unk_6034D90
		mov.l	off_6091B90, r2	! off_604EB68
		mov.l	off_6091B94, r1	! off_604E9FC
		mov.l	@r1, r1
		mov.l	off_6091B98, r0	! sub_6016D04
		mov.w	@r1, r4
		mov	#6, r6
		extu.w	r4, r4
		mov.l	@r2, r1
		add	r4, r4
		jsr	@r0 ! sub_6016D04
		add	r1, r4
		mov	#0, r7
		mov	#20, r8
		mov.l	off_6091B9C, r4	! unk_6095404
		mov.l	off_6091BA0, r5	! off_6034DD0
		mov.l	off_6091BA4, r6	! off_604EB00
		extu.b	r7, r1
		mov	r1, r3

loc_6091A38:
		shll2	r3
		shll2	r3
		add	r4, r3
		mov	r1, r0
		mov.l	@r6, r2		! read pointer to name entry text offsets
		add	r0, r0
		mov.w	@(r0,r2), r1
		add	#1, r7
		extu.w	r1, r1
		mov.l	@r5, r2		! read pointer to name entry text
		add	r1, r1
		add	r2, r1
		mov.l	r1, @(0xC,r3)
		extu.b	r7, r1
		cmp/hi	r8, r1
		bf/s	loc_6091A38
		mov	r1, r3
		mov.l	off_6091BA8, r3	! unk_60955D4
		mov.l	off_6091BAC, r2	! off_604E9F0
		mov.l	off_6091BB0, r1	! off_603A478
		mov.w	word_6091B80, r7 ! 0x134
		mov.l	off_6091B8C, r11 ! unk_6034D90
		mov.l	@r1, r1
		mov.l	off_6091BB4, r4	! unk_60955F4
		mov	r1, r0
		mov.w	@(r0,r7), r1
		mov.l	@r2, r2
		extu.w	r1, r1
		add	r1, r1
		add	r2, r1
		mov.l	r1, @(0xC,r3)
		mov.l	off_6091BB8, r1	! unk_60955A0
		mov.l	r11, @(0xC,r1)
		mov.l	off_6091B88, r1	! unk_60953FA
		mov	#1, r0
		mov.w	r0, @r1
		mov.l	off_6091BBC, r1	! unk_60953F8
		mov	#0, r3
		mov.b	r3, @r1
		mov.l	off_6091BC0, r1	! unk_603E9CE
		mov.b	r3, @r1
		mov.l	off_6091BC4, r1	! unk_609576C
		mov.b	r3, @r1
		mov.l	off_6091BC8, r2	! unk_6095608
		mov	#2, r1
		mov.b	r1, @r2
		mov.l	off_6091BCC, r1	! unk_6095609
		mov.b	r3, @r1
		mov.l	off_6091BD0, r2	! off_609560A
		mov	#6, r1
		mov.b	r1, @r2
		mov.l	dword_6091BD4, r1 ! 0x609560B
		mov.b	r3, @r1
		mov.l	off_6091BD8, r1	! sub_6017EF8
		jsr	@r1 ! sub_6017EF8
		mov	#1, r5
		bra	loc_6092012
		add	#4, r14

loc_6091AAC:
		mov	#0, r10
		mov.l	off_6091BDC, r5	! unk_603A474
		mov.l	off_6091BE0, r8	! off_609558C
		mov.l	off_6091BE4, r0	! sub_6017C64
		jsr	@r0 ! sub_6017C64
		mov.l	@r8, r4
		cmp/eq	#1, r0
		bt	loc_6091AC0
		bra	loc_6092010
		or	r0, r0

loc_6091AC0:
		mov.l	off_6091BE8, r11 ! sub_6016D68
		jsr	@r11 ! sub_6016D68
		mov	r8, r4
		mov.l	off_6091BEC, r4	! unk_60955C0
		mov.l	off_6091BD8, r1	! sub_6017EF8
		jsr	@r1 ! sub_6017EF8
		mov	#1, r5
		mov.l	off_6091BF0, r1	! sub_60186E8
		jsr	@r1 ! sub_60186E8
		nop
		bra	loc_609200A
		nop

loc_6091AD8:
		mov.l	off_6091BF4, r1	! unk_6034B7C
		mov.w	@r1, r1
		mov.w	word_6091B82, r2 ! 0xFFFFF000
		and	r2, r1
		tst	r1, r1
		bt/s	loc_6091AEE
		mov	#0, r10
		mov.l	off_6091BC0, r2	! unk_603E9CE
		mov	#0x17, r1
		bra	loc_6091B10
		mov.b	r1, @r2

loc_6091AEE:
		mov.l	off_6091BF8, r1	! unk_60396E6
		mov.w	@r1, r1
		and	r2, r1
		tst	r1, r1
		bt/s	loc_6091B20
		mov	#0x17, r1
		mov.l	off_6091BC0, r3	! unk_603E9CE
		mov.b	@r3, r2
		extu.b	r2, r1
		tst	r1, r1
		bt/s	loc_6091B0C
		mov	r2, r1
		add	#-1, r1
		bra	loc_6091B24
		mov.b	r1, @r3

loc_6091B0C:
		mov	#5, r1
		mov.b	r1, @r3

loc_6091B10:
		mov.l	off_6091BD0, r6	! off_609560A
		mov.l	off_6091BCC, r5	! unk_6095609
		mov.l	off_6091BC8, r4	! unk_6095608
		mov.l	off_6091BFC, r1	! sub_6092134
		jsr	@r1 ! sub_6092134
		nop
		bra	loc_6091B24
		nop

loc_6091B20:
		mov.l	off_6091BC0, r2	! unk_603E9CE
		mov.b	r1, @r2

loc_6091B24:
		mov.l	off_6091BF4, r1	! unk_6034B7C
		mov.w	@r1, r2
		mov.l	off_6091C00, r3	! unk_603A494
		mov.w	@r3, r1
		and	r2, r1
		extu.w	r1, r1
		tst	r1, r1
		bf/s	loc_6091B3A
		mov	r3, r1
		bra	loc_6091D60
		or	r0, r0

loc_6091B3A:
		mov.w	word_6091B84, r4 ! 0x101
		mov.l	off_6091C04, r9	! sub_6010698
		jsr	@r9 ! sub_6010698
		mov	#1, r5
		mov.l	off_6091BC8, r1	! unk_6095608
		mov.b	@r1, r0
		cmp/eq	#2, r0
		bt	loc_6091B4E
		bra	loc_6091C94
		or	r0, r0

loc_6091B4E:
		mov.l	off_6091BD0, r1	! off_609560A
		mov.b	@r1, r0
		cmp/eq	#6, r0
		bt	loc_6091B5A
		bra	loc_6091C94
		or	r0, r0

loc_6091B5A:
		mov.l	off_6091C08, r0	! sub_6092348
		jsr	@r0 ! sub_6092348
		nop
		mov.l	dword_6091BD4, r1 ! 0x609560B
		mov.b	r0, @r1
		mov.l	off_6091C0C, r0	! sub_60923A8
		jsr	@r0 ! sub_60923A8
		nop
		extu.w	r0, r0
		cmp/eq	#1, r0
		bt/s	loc_6091C10
		mov	#0, r3
		mov.w	word_6091B86, r4 ! 0x103
		jsr	@r9 ! sub_6010698
		mov	#1, r5
		mov.l	off_6091B88, r1	! unk_60953FA
		mov	#5, r11
		bra	loc_6092010
		mov.w	r11, @r1
word_6091B80:	.word 0x134
word_6091B82:	.word 0xF000
word_6091B84:	.word 0x101
word_6091B86:	.word 0x103
off_6091B88:	.long 0x060953FA
off_6091B8C:	.long 0x06034D90
off_6091B90:	.long 0x0604EB68
off_6091B94:	.long 0x0604E9FC
off_6091B98:	.long 0x06016D04
off_6091B9C:	.long 0x06095404
off_6091BA0:	.long 0x06034DD0
off_6091BA4:	.long 0x0604EB00
off_6091BA8:	.long 0x060955D4
off_6091BAC:	.long 0x0604E9F0
off_6091BB0:	.long 0x0603A478
off_6091BB4:	.long 0x060955F4
off_6091BB8:	.long 0x060955A0
off_6091BBC:	.long 0x060953F8
off_6091BC0:	.long 0x0603E9CE
off_6091BC4:	.long 0x0609576C
off_6091BC8:	.long 0x06095608
off_6091BCC:	.long 0x06095609
off_6091BD0:	.long 0x0609560A
dword_6091BD4:	.long 0x0609560B
off_6091BD8:	.long 0x06017EF8
off_6091BDC:	.long 0x0603A474
off_6091BE0:	.long 0x0609558C
off_6091BE4:	.long 0x06017C64
off_6091BE8:	.long 0x06016D68
off_6091BEC:	.long 0x060955C0
off_6091BF0:	.long 0x060186E8
off_6091BF4:	.long 0x06034B7C
off_6091BF8:	.long 0x060396E6
off_6091BFC:	.long 0x06092134
off_6091C00:	.long 0x0603A494
off_6091C04:	.long 0x06010698
off_6091C08:	.long 0x06092348
off_6091C0C:	.long 0x060923A8

loc_6091C10:
		mov.l	off_6091D9C, r6	! unk_6034D90
		mov.w	@r6, r1
		mov.l	dword_6091DA0, r2 ! 0xFFFF
		extu.w	r1, r1
		cmp/eq	r2, r1
		bt/s	loc_6091C46
		mov	#0, r7
		mov	#7, r5
		extu.b	r7, r1

loc_6091C22:
		cmp/hi	r5, r1
		bt/s	loc_6091C46
		mov	r1, r0
		add	r0, r0
		mov.w	@(r0,r6), r1
		extu.w	r1, r1
		tst	r1, r1
		bt/s	loc_6091C36
		add	#1, r7
		mov	#1, r3

loc_6091C36:
		extu.b	r7, r1
		mov	r1, r0
		add	r0, r0
		mov.w	@(r0,r6), r1
		extu.w	r1, r1
		cmp/eq	r2, r1
		bf/s	loc_6091C22
		extu.b	r7, r1

loc_6091C46:
		extu.b	r3, r0
		cmp/eq	#1, r0
		bf/s	loc_6091C84
		mov	#5, r0
		mov.l	off_6091DA4, r2	! off_604EB68
		mov.l	off_6091DA8, r1	! off_604E9FC
		mov.l	@r1, r1
		mov.l	off_6091D9C, r4	! unk_6034D90
		mov.w	@r1, r5
		mov.l	off_6091DAC, r0	! sub_6016C84
		extu.w	r5, r5
		mov.l	@r2, r1
		add	r5, r5
		jsr	@r0 ! sub_6016C84
		add	r1, r5
		extu.w	r0, r0
		cmp/eq	#1, r0
		bt/s	loc_6091C72
		mov	#4, r0
		mov.l	off_6091DB0, r2	! unk_603708E
		mov	#1, r1
		mov.b	r1, @r2

loc_6091C72:
		mov.l	off_6091DB4, r1	! unk_60953FA
		mov.w	r0, @r1
		mov.l	off_6091DB8, r11 ! sub_6092348
		jsr	@r11 ! sub_6092348
		nop
		mov	r0, r2
		mov.l	dword_6091DBC, r1 ! 0x609560B
		bra	loc_6092010
		mov.b	r2, @r1


loc_6091C84:
		mov.l	off_6091DB4, r1	! unk_60953FA
		mov.w	r0, @r1
		mov.w	word_6091D98, r4 ! 0x103
		mov.l	off_6091DC0, r1	! sub_6010698
		jsr	@r1 ! sub_6010698
		mov	#1, r5
		bra	loc_6092012
		add	#4, r14


loc_6091C94:
		mov.l	off_6091DC4, r1	! unk_6095608
		mov.b	@r1, r0
		cmp/eq	#2, r0
		bf/s	loc_6091CD4
		mov	#2, r1
		mov.l	off_6091DC8, r6	! unk_6095609
		mov.b	@r6, r2
		cmp/gt	r1, r2
		bt	loc_6091CCE
		mov.l	off_6091DCC, r1	! off_609560A
		mov.b	@r1, r0
		cmp/eq	#5, r0
		bf	loc_6091CCE
		mov.l	dword_6091DBC, r7 ! 0x609560B
		mov.b	@r7, r3
		extu.b	r3, r1
		mov	r1, r0
		add	r0, r0
		mov.l	off_6091D9C, r1	! unk_6034D90
		mov.w	@(r0,r1), r1
		mov.l	dword_6091DA0, r2 ! 0xFFFF
		extu.w	r1, r1
		cmp/eq	r2, r1
		bf/s	loc_6091CCA
		mov	#0, r1
		bra	loc_6091E94
		or	r0, r0


loc_6091CCA:
		bra	loc_6091D90
		mov.b	r1, @r6


loc_6091CCE:
		mov.l	off_6091DC4, r1	! unk_6095608
		mov.b	@r1, r0
		cmp/eq	#2, r0

loc_6091CD4:
		bf/s	loc_6091CFC
		mov	#2, r1
		mov.l	off_6091DC8, r7	! unk_6095609
		mov.b	@r7, r2
		cmp/gt	r1, r2
		bf	loc_6091CFC
		mov.l	off_6091DCC, r1	! off_609560A
		mov.b	@r1, r0
		cmp/eq	#5, r0
		bf	loc_6091CFC
		mov.l	dword_6091DBC, r3 ! 0x609560B
		mov.b	@r3, r2
		extu.b	r2, r1
		tst	r1, r1
		bf/s	loc_6091CF8
		mov	#4, r1
		bra	loc_6091E94
		or	r0, r0


loc_6091CF8:
		bra	loc_6091DF8
		mov.b	r1, @r7


loc_6091CFC:
		mov.l	dword_6091DD0, r1 ! 0x609560C
		mov	#0, r2
		mov.b	r2, @r1
		mov.l	dword_6091DBC, r5 ! 0x609560B
		mov.b	@r5, r1
		mov	#0xF, r2 ! Check current name entry length
		extu.b	r1, r3
		cmp/hi	r2, r3
		bf/s	loc_6091D14
		mov	r3, r4
		bra	loc_6091E94
		or	r0, r0


loc_6091D14:
		mov.l	off_6091DC4, r1	! unk_6095608
		mov.b	@r1, r1
		mov	#0x7, r2
		mul.l	r2, r1
		mov.l	off_6091DCC, r1	! off_609560A
		mov.b	@r1, r1         ! row offset in characters
		sts	macl, r2
		add	r1, r2
		shll2	r2
		shll2	r2
		mov.l	off_6091DD4, r1	! unk_6095404
		add	r1, r2
		mov.l	off_6091DC8, r1	! unk_6095609
		mov.b	@r1, r1         ! col offset in characters
		mov.l	@(0xC,r2), r2   ! read pointer to name entry characters from current row
		add	r1, r1
		mov	r1, r6
		add	r2, r6
		add	r4, r4
		mov.l	off_6091D9C, r3	! unk_6034D90
		mov.l	dword_6091DA0, r2 ! 0xFFFF
		mov	r4, r0
		mov.w	@(r0,r3), r1
		extu.w	r1, r1
		cmp/eq	r2, r1
		bf/s	loc_6091D4E
		mov	r2, r7
		mov	r3, r1
		add	#2, r1
		mov.w	r7, @(r0,r1)

loc_6091D4E:
		mov.b	@r5, r1
		extu.b	r1, r2
		mov	r2, r0
		mov.b	@r6, r6 ! read character from table
		add	#1, r1		! text cursor position increment
		mov.b	r6, @(r0,r3)	! add character	to buffer
		bra	loc_6091E5A
		mov.b	r1, @r5


loc_6091D60:
		add	#0xA, r1
		mov.w	@r1, r1
		and	r2, r1
		extu.w	r1, r1
		tst	r1, r1
		bt/s	loc_6091DD8
		mov	r3, r1
		mov.w	word_6091D9A, r4 ! 0x100
		mov.l	off_6091DC0, r1	! sub_6010698
		jsr	@r1 ! sub_6010698
		mov	#1, r5
		mov.l	dword_6091DBC, r7 ! 0x609560B
		mov.b	@r7, r3
		extu.b	r3, r1
		mov	r1, r0
		add	r0, r0
		mov.l	off_6091D9C, r1	! unk_6034D90
		mov.w	@(r0,r1), r1
		mov.l	dword_6091DA0, r2 ! 0xFFFF
		extu.w	r1, r1
		cmp/eq	r2, r1
		bf	loc_6091D90
		bra	loc_6091E94
		or	r0, r0


loc_6091D90:
		mov	r3, r1
		add	#1, r1
		bra	loc_6091E94
		mov.b	r1, @r7

word_6091D98:	.word 0x103
word_6091D9A:	.word 0x100
.align 2
off_6091D9C:	.long 0x06034D90
dword_6091DA0:	.long 0xFFFF
off_6091DA4:	.long 0x0604EB68
off_6091DA8:	.long 0x0604E9FC
off_6091DAC:	.long 0x06016C84
off_6091DB0:	.long 0x0603708E
off_6091DB4:	.long 0x060953FA
off_6091DB8:	.long 0x06092348
dword_6091DBC:	.long 0x0609560B
off_6091DC0:	.long 0x06010698
off_6091DC4:	.long 0x06095608
off_6091DC8:	.long 0x06095609
off_6091DCC:	.long 0x0609560A
dword_6091DD0:	.long 0x0609560C
off_6091DD4:	.long 0x06095404


loc_6091DD8:
		add	#8, r1
		mov.w	@r1, r1
		and	r2, r1
		extu.w	r1, r1
		tst	r1, r1
		bt/s	loc_6091E00
		mov	r3, r1
		mov.w	word_6091EE2, r4 ! 0x100
		mov.l	off_6091EE8, r1	! sub_6010698
		jsr	@r1 ! sub_6010698
		mov	#1, r5
		mov.l	dword_6091EEC, r3 ! 0x609560B
		mov.b	@r3, r2
		extu.b	r2, r1
		tst	r1, r1
		bt	loc_6091E94

loc_6091DF8:
		mov	r2, r1
		add	#-1, r1
		bra	loc_6091E94
		mov.b	r1, @r3


loc_6091E00:
		add	#-2, r1
		mov.w	@r1, r1
		and	r2, r1
		extu.w	r1, r1
		tst	r1, r1
		bt	loc_6091E72
		mov.w	word_6091EE4, r4 ! 0x102
		mov.l	off_6091EE8, r1	! sub_6010698
		jsr	@r1 ! sub_6010698
		mov	#1, r5
		mov.l	dword_6091EEC, r3 ! 0x609560B
		mov.b	@r3, r2
		extu.b	r2, r1
		tst	r1, r1
		bt/s	loc_6091E94
		mov	r2, r1
		add	#-1, r1
		mov.b	r1, @r3
		mov	r1, r7
		extu.b	r7, r2
		mov	r2, r0
		add	r0, r0
		mov.l	off_6091EF0, r6	! unk_6034D90
		mov.w	@(r0,r6), r1
		mov.l	dword_6091EF4, r3 ! 0xFFFF
		extu.w	r1, r1
		cmp/eq	r3, r1
		bt/s	loc_6091E5A
		mov	r6, r5
		add	#2, r5
		mov	r2, r1

loc_6091E3E:
		add	r1, r1
		mov	r1, r0
		add	#1, r7
		mov.w	@(r0,r5), r11
		extu.b	r7, r2
		mov.w	r11, @(r0,r6)
		mov	r2, r1
		add	r1, r1
		mov	r1, r0
		mov.w	@(r0,r6), r1
		extu.w	r1, r1
		cmp/eq	r3, r1
		bf/s	loc_6091E3E
		mov	r2, r1

loc_6091E5A:
		mov.l	off_6091EF8, r1	! sub_6018240
		jsr	@r1 ! sub_6018240
		nop
		mov.l	off_6091EFC, r4	! unk_60955C0
		mov.l	off_6091F00, r1	! sub_6017EF8
		jsr	@r1 ! sub_6017EF8
		mov	#1, r5
		mov.l	off_6091F04, r1	! sub_60186E8
		jsr	@r1 ! sub_60186E8
		nop
		bra	loc_6091E94
		nop


loc_6091E72:
		mov.w	word_6091EE6, r1 ! 0x800
		and	r2, r1
		tst	r1, r1
		bt	loc_6091E94
		mov.w	word_6091EE2, r4 ! 0x100
		mov.l	off_6091EE8, r1	! sub_6010698
		jsr	@r1 ! sub_6010698
		mov	#1, r5
		mov.l	off_6091F08, r2	! unk_6095608
		mov	#2, r1
		mov.b	r1, @r2
		mov.l	off_6091F0C, r2	! unk_6095609
		mov	#0, r1
		mov.b	r1, @r2
		mov.l	off_6091F10, r2	! off_609560A
		mov	#6, r1
		mov.b	r1, @r2

loc_6091E94:
		mov.l	off_6091F08, r1	! unk_6095608
		mov.b	@r1, r2
		mov	r2, r0
		cmp/eq	#2, r0
		bf	loc_6091EB8
		mov.l	off_6091F10, r1	! off_609560A
		mov.b	@r1, r0
		cmp/eq	#6, r0
		bf/s	loc_6091EB6
		mov	#0xB, r1
		mul.l	r1, r2
		mov.l	off_6091F14, r1	! off_609558C
		mov.l	@r1, r1
		add	#4, r1
		mov.b	@r1, r1
		bra	loc_6091F6C
		sts	macl, r2


loc_6091EB6:
		mov.l	off_6091F08, r1	! unk_6095608

loc_6091EB8:
		mov.b	@r1, r3
		mov	r3, r0
		cmp/eq	#2, r0
		bf	loc_6091F18
		mov.l	off_6091F0C, r1	! unk_6095609
		mov.b	@r1, r2
		mov	#2, r1
		cmp/gt	r1, r2
		bt	loc_6091F18
		mov.l	off_6091F10, r1	! off_609560A
		mov.b	@r1, r0
		cmp/eq	#5, r0
		bf/s	loc_6091F18
		mov	#0xB, r1
		mul.l	r1, r3
		mov.l	off_6091F14, r1	! off_609558C
		mov.l	@r1, r1
		add	#4, r1
		mov.b	@r1, r1
		bra	loc_6091F6C
		sts	macl, r2

word_6091EE2:	.word 0x100
word_6091EE4:	.word 0x102
word_6091EE6:	.word 0x800
off_6091EE8:	.long 0x06010698
dword_6091EEC:	.long 0x0609560B
off_6091EF0:	.long 0x06034D90
dword_6091EF4:	.long 0xFFFF
off_6091EF8:	.long 0x06018240
off_6091EFC:	.long 0x060955C0
off_6091F00:	.long 0x06017EF8
off_6091F04:	.long 0x060186E8
off_6091F08:	.long 0x06095608
off_6091F0C:	.long 0x06095609
off_6091F10:	.long 0x0609560A
off_6091F14:	.long 0x0609558C

loc_6091F18:
		mov.l	off_6092028, r1	! unk_6095608
		mov.b	@r1, r3
		mov	r3, r0
		cmp/eq	#2, r0
		bf	loc_6091F54
		mov.l	off_609202C, r1	! unk_6095609
		mov.b	@r1, r2
		mov	#2, r1
		cmp/gt	r1, r2
		bf	loc_6091F52
		mov.l	off_6092030, r1	! off_609560A
		mov.b	@r1, r0
		cmp/eq	#5, r0
		bf/s	loc_6091F52
		mov	#0xB, r1
		mul.l	r1, r3
		mov.l	off_6092034, r1	! off_609558C
		mov.l	@r1, r1
		add	#4, r1
		mov.b	@r1, r1
		sts	macl, r2
		add	r2, r1
		add	#0xB, r1
		shll16	r1
		shll8	r1
		mov.l	dword_6092038, r2 ! 0xFFFFFF
		and	r2, r8
		bra	loc_6091F7A
		or	r1, r8

loc_6091F52:
		mov.l	off_6092028, r1	! unk_6095608

loc_6091F54:
		mov.b	@r1, r2
		mov	#0xB, r1
		mul.l	r1, r2
		mov.l	off_609202C, r1	! unk_6095609
		mov.b	@r1, r1
		sts	macl, r2
		add	r1, r1
		add	r1, r2
		mov.l	off_6092034, r1	! off_609558C
		mov.l	@r1, r1
		add	#4, r1
		mov.b	@r1, r1

loc_6091F6C:
		add	r1, r2
		add	#3, r2
		shll16	r2
		shll8	r2
		mov.l	dword_6092038, r1 ! 0xFFFFFF
		and	r1, r8
		or	r2, r8

loc_6091F7A:
		mov.l	off_6092030, r1	! off_609560A
		mov.b	@r1, r2
		mov.l	off_6092034, r1	! off_609558C
		mov.l	@r1, r1
		add	#5, r1
		mov.b	@r1, r1
		add	r2, r2
		add	r1, r2
		add	#2, r2
		extu.b	r2, r2
		shll16	r2
		mov.l	dword_609203C, r1 ! 0xFF00FFFF
		and	r1, r8
		or	r2, r8
		mov.l	off_6092040, r1	! sub_6016770
		jsr	@r1 ! sub_6016770
		mov	r8, r4
		mov.l	dword_6092044, r1 ! 0x609560B
		mov.b	@r1, r4
		mov.l	off_6092048, r1	! sub_6092070
		jsr	@r1 ! sub_6092070
		extu.b	r4, r4
		bra	loc_6092012
		add	#4, r14

loc_6091FAA:
		mov.l	off_609204C, r0	! sub_609226C
		jsr	@r0 ! sub_609226C
		mov	r14, r4
		tst	r0, r0
		bt/s	loc_6092010
		mov.b	@r14, r1
		extu.b	r1, r0
		cmp/eq	#1, r0
		bf/s	loc_6091FCA
		mov	#2, r0
		mov.l	off_6092050, r1	! sub_6018240
		jsr	@r1 ! sub_6018240
		mov	#3, r11
		mov.l	off_6092054, r1	! unk_60953FA
		bra	loc_6092010
		mov.w	r11, @r1


loc_6091FCA:
		mov.l	off_6092054, r1	! unk_60953FA
		mov.w	r0, @r1
		mov.l	off_6092034, r4	! off_609558C
		mov.l	off_6092058, r11 ! sub_6016D68
		jsr	@r11 ! sub_6016D68
		nop
		bra	loc_6092012
		add	#4, r14


loc_6091FDA:
		mov	#0, r10
		mov.l	off_609205C, r5	! unk_603A474
		mov.l	off_6092034, r1	! off_609558C
		mov.l	off_6092060, r0	! sub_6018038
		jsr	@r0 ! sub_6018038
		mov.l	@r1, r4
		cmp/eq	#1, r0
		bf	loc_6092010
		mov.l	off_6092064, r0	! sub_6016D88
		jsr	@r0 ! sub_6016D88
		mov	#0, r11
		mov.l	off_6092068, r1	! sub_6017C00
		jsr	@r1 ! sub_6017C00
		mov	#1, r10
		mov.l	off_6092054, r1	! unk_60953FA
		bra	loc_6092010
		mov.w	r11, @r1

loc_6091FFC:
		mov.w	word_6092024, r4 ! 0xEE
		mov.l	off_609206C, r0	! sub_60127A0
		jsr	@r0 ! sub_60127A0
		mov	#0xE, r5
		extu.b	r0, r1
		tst	r1, r1
		bt	loc_6092010

loc_609200A:
		mov.l	off_6092054, r1	! unk_60953FA
		mov	#2, r0
		mov.w	r0, @r1

loc_6092010:
		add	#4, r14

loc_6092012:
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r11
		mov	r10, r0
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

word_6092024:	.word 0xEE
.align 2
off_6092028:	.long 0x06095608
off_609202C:	.long 0x06095609
off_6092030:	.long 0x0609560A
off_6092034:	.long 0x0609558C
dword_6092038:	.long 0xFFFFFF
dword_609203C:	.long 0xFF00FFFF
off_6092040:	.long 0x06016770
dword_6092044:	.long 0x609560B
off_6092048:	.long 0x06092070
off_609204C:	.long 0x0609226C
off_6092050:	.long 0x06018240
off_6092054:	.long 0x060953FA
off_6092058:	.long 0x06016D68
off_609205C:	.long 0x0603A474
off_6092060:	.long 0x06018038
off_6092064:	.long 0x06016D88
off_6092068:	.long 0x06017C00
off_609206C:	.long 0x060127A0

sub_6092070:
		mov.l	r8, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-0x20,	r15
		extu.b	r4, r4
		mov	#0xF, r1 ! check name entry length
		cmp/hi	r1, r4
		bf/s	loc_6092088
		mov	r15, r14
		mov.w	word_609211E, r3 ! 0x128 ! Clamp it down
		bra	loc_6092094 
		nop

loc_6092088:
		mov	r4, r1
		shll2	r1
		shll	r1
		mov.w	word_6092120, r2 ! 0xB0
		mov	r1, r3
		add	r2, r3

loc_6092094:
		mov.l	off_6092128, r8	! unk_6095610
		mov.l	@r8, r2
		mov	#0xF, r1
		cmp/hi	r1, r2
		bf/s	loc_6092102
		mov	#4, r7
		mov.w	r7, @r14
		mov	r14, r1
		add	#2, r1
		mov	#0, r7
		mov.w	r7, @r1
		mov	r14, r1
		add	#4, r1
		mov.w	word_6092122, r7 ! 0x4C0
		mov.w	r7, @r1
		mov	r14, r1
		add	#6, r1
		mov.w	word_6092124, r7 ! 0x1057
		mov.w	r7, @r1
		mov	r14, r1
		add	#0xC, r1
		mov.w	r3, @r1
		mov	r14, r1
		add	#0xE, r1
		mov	#0x26, r7
		mov.w	r7, @r1
		mov	r14, r1
		add	#0x10, r1
		mov	r3, r2
		add	#0x7, r2	! text cursor size in pixels
		mov.w	r2, @r1
		mov	r14, r1
		add	#0x12, r1
		mov.w	r7, @r1
		mov	r14, r1
		add	#0x14, r1
		mov.w	r2, @r1
		mov	r14, r1
		add	#0x16, r1
		mov	#0x27, r7
		mov.w	r7, @r1
		mov	r14, r1
		add	#0x18, r1
		mov.w	r3, @r1
		mov	r14, r1
		add	#0x1A, r1
		mov.w	r7, @r1
		mov	r14, r1
		add	#0x1C, r1
		mov	#0, r7
		mov.w	r7, @r1
		mov.l	dword_609212C, r5 ! 0xC70000
		mov.l	off_6092130, r0
		jsr	@r0 ! _slSetSprite
		mov	r14, r4

loc_6092102:
		mov.l	@r8, r1
		mov	#0x1E, r2
		add	#1, r1
		cmp/hi	r2, r1
		bf/s	loc_6092112
		mov.l	r1, @r8
		mov	#0, r7
		mov.l	r7, @r8

loc_6092112:
		add	#0x20, r14
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		rts
		mov.l	@r15+, r8

word_609211E:	.word 0x128
word_6092120:	.word 0xB0
word_6092122:	.word 0x4C0
word_6092124:	.word 0x1057
.align 2
off_6092128:	.long 0x06095610
dword_609212C:	.long 0xC70000
off_6092130:	.long 0x0602E034

.align 2
sub_608EBCC:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		mov	r15, r14
		mov	#0, r9
		mov	#0, r6
		mov.l	off_608ED14, r2	! unk_6092858
		mov.w	@r2, r1
		extu.w	r1, r1
		mov	r1, r0
		cmp/eq	#1, r0
		bt/s	loc_608ECE0
		mov	#0, r8
		mov	#1, r7
		cmp/gt	r7, r1
		bt/s	loc_608EBFA
		tst	r1, r1
		bt/s	loc_608EC04
		mov	#0x4D, r1
		bra	loc_608ECFA
		nop

loc_608EBFA:
		cmp/eq	#3, r0
		bt/s	loc_608ECF6
		mov	#0, r0
		bra	loc_608ECFA
		nop

loc_608EC04:
		cmp/hi	r1, r4
		bf/s	loc_608EC2C
		mov	#0x24, r1
		mov	#2, r8
		add	#-0x4D,	r4
		mov.l	off_608ED18, r1	! off_603A478
		mov.l	@r1, r1
		mov.w	word_608ED12, r2 ! 0xF8
		mov	r1, r0
		mov.w	@(r0,r2), r1 ! ?
		mov.l	off_608ED1C, r3	! off_6092AE4
		extu.w	r1, r1
		mov.l	off_608ED20, r2	! off_604E9F0
		add	r1, r1
		mov.l	@r2, r2
		mov	r1, r0
		mov.b	@(r0,r2), r1
		mov	r7, r6
		bra	loc_608EC3C
		mov.b	r1, @r3	! insert prefix character

loc_608EC2C:
		cmp/hi	r1, r4
		bf/s	loc_608EC3C
		mov	#0x28, r1
		cmp/hi	r1, r4
		bf/s	loc_608EC3A
		mov	#1, r8
		add	#-3, r4

loc_608EC3A:
		add	#-0x24,	r4

loc_608EC3C:
		mov.l	off_608ED18, r1	! off_603A478
		mov.l	@r1, r1
		add	#0x62, r1
		mov.w	@r1, r1
		mov.l	off_608ED20, r2	! off_604E9F0
		mov.l	@r2, r2
		extu.w	r1, r1
		add	r1, r1
		mov	r1, r7
		add	r2, r7
		mov.b	@r7, r3		! first	character of "Scenario"(and other?) text?
		mov	#0xFF, r5
		extu.b	r5, r5
		extu.b	r3, r1
		cmp/eq	r5, r1
		bt/s	loc_608EC72
		mov	r6, r1
		mov.l	off_608ED1C, r2	! off_6092AE4
		add	r1, r2

loc_608EC62:
		mov.b	r3, @r2		! rest of "Scenario"(and other?) text
		add	#1, r2
		add	#1, r7
		mov.b	@r7, r3
		extu.b	r3, r1
		cmp/eq	r5, r1
		bf/s	loc_608EC62	! rest of "Scenario"(and other?) text
		add	#1, r6

loc_608EC72:
		mov	r6, r2
		mov.l	off_608ED1C, r1	! off_6092AE4
		mov	#0x20, r10
		mov	r2, r0
		mov.b	r10, @(r0,r1)	! add space character
		extu.b	r8, r2
		mov	r2, r0
		cmp/eq	#1, r0
		bf/s	loc_608EC94
		add	#1, r6
		mov	r6, r2
		mov	#'?', r10		! '?' character
		mov	r2, r0
		mov.b	r10, @(r0,r1)	! add '?' character
		add	#1, r6

loc_608EC94:
		mov	#10, r1
		cmp/hi	r4, r1
		bt/s	loc_608ECA4	! if tens digit
		mov	#0, r3

loc_608EC9C:
		add	#10, r1	! R4 >=	10
		cmp/hi	r4, r1
		bf/s	loc_608EC9C	! R4 >=	10
		add	#1, r3		! tens number increment

loc_608ECA4:
		tst	r3, r3		! if tens digit
		bt/s	loc_608ECB8
		mov	#0xFFFFFFFF, r10
		mov	r6, r0
		mov.l	off_608ED1C, r2	! off_6092AE4
		mov	r3, r1
		add	#'0', r1
		mov.b	r1, @(r0,r2)	! tens digit
		add	#1, r6

loc_608ECB8:
		mov	r3, r1
		shll2	r1
		add	r3, r1
		add	r1, r1
		sub	r1, r4
		mov	r6, r3
		mov.l	off_608ED1C, r2	! off_6092AE4
		mov	r4, r1
		add	#'0', r1
		mov	r3, r0
		mov.b	r1, @(r0,r2)	! ones digit
		add	#1, r6
		mov	r6, r1
		mov	r1, r0
		mov.b	r10, @(r0,r2)	! insert 0xFF
		add	#1, r0
		mov.b	r10, @(r0,r2)	! insert 0xFF
		mov.l	off_608ED14, r1	! unk_6092858
		mov	#1, r0
		mov.w	r0, @r1

loc_608ECE0:
		mov.l	off_608ED1C, r4	! off_6092AE4
		mov.l	off_608ED28, r0	! sub_6012A98
		jsr	@r0 ! sub_6012A98
		mov	#0xE, r5
		extu.b	r0, r1
		tst	r1, r1
		bt/s	loc_608ED02
		mov	#3, r10
		mov.l	off_608ED14, r1	! unk_6092858
		bra	loc_608ED02
		mov.w	r10, @r1

loc_608ECF6:
		bra	loc_608ED00
		mov.w	r0, @r2

loc_608ECFA:
		mov.l	off_608ED14, r1	! unk_6092858
		mov	#0, r10
		mov.w	r10, @r1

loc_608ED00:
		mov	#1, r9

loc_608ED02:
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r10
		mov	r9, r0
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

word_608ED12:	.word 0xF8
.align 2
off_608ED14:	.long 0x06092858
off_608ED18:	.long 0x0603A478
off_608ED1C:	.long 0x06092AE4
off_608ED20:	.long 0x0604E9F0
off_608ED28:	.long 0x06012A98

.align 2
sub_608ED2C:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		mov	r15, r14
		mov	#0, r8
		mov.l	off_608EE54, r2	! unk_609285A
		mov.w	@r2, r1
		extu.w	r1, r0
		cmp/eq	#1, r0
		bt/s	loc_608EE2A
		mov	#0, r6
		mov	#1, r1
		cmp/gt	r1, r0
		bt/s	loc_608ED52
		tst	r0, r0
		bt	loc_608ED5C
		bra	loc_608EE44
		mov	#1, r8

loc_608ED52:
		cmp/eq	#2, r0
		bt/s	loc_608EE40
		mov	#0, r9
		bra	loc_608EE44
		mov	#1, r8

loc_608ED5C:
		mov.l	off_608EE58, r1	! off_603A478
		mov.l	@r1, r1
		add	#0x64, r1
		mov.w	@r1, r1
		mov.l	off_608EE5C, r2	! off_604E9F0
		mov.l	@r2, r2
		extu.w	r1, r1
		add	r1, r1
		mov	r1, r7
		add	r2, r7
		mov.b	@r7, r2		! Turn %d text beginning of turn
		mov	#0xFF, r3
		extu.b	r3, r3
		extu.b	r2, r1
		cmp/eq	r3, r1
		bt/s	loc_608ED92
		mov	r6, r0
		mov	r3, r5
		mov.l	off_608EE64, r3	! unk_6092B04

loc_608ED80:
		mov.b	r2, @r3		! Copy "Turn" text
		add	#1, r3
		add	#1, r7
		mov.b	@r7, r2
		extu.b	r2, r1
		cmp/eq	r5, r1
		bf/s	loc_608ED80
		add	#1, r6
		mov	r6, r0

loc_608ED92:
		mov.l	off_608EE64, r2	! unk_6092B04
		mov	#0x20, r9
		mov.b	r9, @(r0,r2)	! insert space character
		mov	#99, r1		! is turn over 100
		cmp/hi	r1, r4
		bt/s	loc_608EE08
		add	#1, r6
		mov	#100, r9	! Turn is over 100
		lds	r9, macl
		sts	macl, r1
		cmp/hi	r4, r1
		bt/s	loc_608EDB6
		mov	#0, r3		! hundreds number

loc_608EDAE:
		add	#100, r1
		cmp/hi	r4, r1
		bf/s	loc_608EDAE
		add	#1, r3		! increment hundreds number

loc_608EDB6:
		tst	r3, r3
		bt/s	loc_608EDC8
		mov	r6, r0
		mov.l	off_608EE64, r2	! unk_6092B04
		mov	r3, r1
		add	#'0', r1
		mov.b	r1, @(r0,r2)	! insert hundreds char
		add	#1, r6

loc_608EDC8:
		mov	#100, r1
		mul.l	r1, r3
		sts	macl, r1
		sub	r1, r4
		mov	#10, r1
		cmp/hi	r4, r1		! is turn over 10
		bt/s	loc_608EDE0
		mov	#0, r3		! tens number

loc_608EDD8:
		add	#10, r1
		cmp/hi	r4, r1
		bf/s	loc_608EDD8
		add	#1, r3		! increment tens number

loc_608EDE0:
		tst	r3, r3
		bt/s	loc_608EDF2
		mov	r6, r0
		mov.l	off_608EE64, r2	! unk_6092B04
		mov	r3, r1
		add	#'0', r1
		mov.b	r1, @(r0,r2)	! insert tens char
		add	#1, r6

loc_608EDF2:
		mov	r3, r1
		shll2	r1
		add	r3, r1
		add	r1, r1
		sub	r1, r4
		mov	r6, r0
		mov.l	off_608EE64, r2	! unk_6092B04
		mov	r4, r1
		bra	loc_608EE16
		add	#'0', r1

loc_608EE08:
		mov	r6, r0
		mov	#'9', r1
		mov.b	r1, @(r0,r2)	! insert '9'
		add	#1, r6
		mov	r6, r0

loc_608EE16:
		mov.b	r1, @(r0,r2)	! insert '9'
		add	#1, r6
		mov	r6, r0
		mov.l	off_608EE64, r1	! unk_6092B04
		mov	#0xFFFFFFFF, r9
		mov.b	r9, @(r0,r1)	! insert string	terminator
		add	#1, r0
		mov.b	r9, @(r0,r1)	! insert string	terminator
		mov.l	off_608EE54, r1	! unk_609285A
		mov	#1, r9
		mov.w	r9, @r1

loc_608EE2A:
		mov.l	off_608EE64, r4	! unk_6092B04
		mov.l	off_608EE68, r0	! sub_6012A98
		jsr	@r0 ! sub_6012A98
		mov	#0xE, r5
		extu.b	r0, r1
		tst	r1, r1
		bt/s	loc_608EE44
		mov	#2, r9
		mov.l	off_608EE54, r1	! unk_609285A
		bra	loc_608EE44
		mov.w	r9, @r1

loc_608EE40:
		mov.w	r9, @r2
		mov	#1, r8

loc_608EE44:
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r9
		mov	r8, r0
		rts
		mov.l	@r15+, r8

.align 2
off_608EE54:	.long 0x0609285A
off_608EE58:	.long 0x0603A478
off_608EE5C:	.long 0x0604E9F0
off_608EE64:	.long 0x06092B04
off_608EE68:	.long 0x06012A98

_main:
rts
