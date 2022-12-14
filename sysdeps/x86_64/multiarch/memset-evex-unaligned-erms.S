#if IS_IN (libc)
# define USE_WITH_EVEX	1

# define VEC_SIZE	32
# define MOV_SIZE	6
# define RET_SIZE	1

# define XMM0		xmm16
# define YMM0		ymm16
# define VEC0		ymm16
# define VEC(i)		VEC##i

# define VMOVU     vmovdqu64
# define VMOVA     vmovdqa64

# define VZEROUPPER

# define MEMSET_VDUP_TO_VEC0_AND_SET_RETURN(d, r) \
  movq r, %rax; \
  vpbroadcastb d, %VEC0

# define WMEMSET_VDUP_TO_VEC0_AND_SET_RETURN(d, r) \
  movq r, %rax; \
  vpbroadcastd d, %VEC0

# define SECTION(p)		p##.evex
# define MEMSET_SYMBOL(p,s)	p##_evex_##s
# define WMEMSET_SYMBOL(p,s)	p##_evex_##s
# define USE_LESS_VEC_MASK_STORE	1
# include "memset-vec-unaligned-erms.S"
#endif
