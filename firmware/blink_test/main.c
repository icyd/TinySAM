#include "sam.h"

#define LED0 PORT_PA28;

volatile uint32_t SysTickCnt;

void SysTick_Handler (void);
void Delay (uint32_t tick);

int main(void)
{
	SystemInit(); // Initialize the SAM system
	SysTick_Config (SystemCoreClock / 1000 - 1);

	// Configure LED0 as output
	REG_PORT_DIRSET0 = LED0;

	while (1)
	{
		REG_PORT_OUTTGL0 = LED0;
		Delay(500);
	}
}

void SysTick_Handler (void)
{
	SysTickCnt++;
}

void Delay (uint32_t tick)
{
	uint32_t systickcnt;

	systickcnt = SysTickCnt;
	while ((SysTickCnt - systickcnt) < tick);
}
