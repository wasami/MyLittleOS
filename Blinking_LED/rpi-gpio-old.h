extern void _put32 ( unsigned int, unsigned int );
extern unsigned int _get32 ( unsigned int );

#define GPIO_BASE       0x20200000UL
#define LED_GPFBIT      18
#define LED_GPIO_BIT    16
#define LED_GPFSEL      0x20200004
#define LED_GPCLR       0x20200028
#define LED_GPSET       0x2020001C 