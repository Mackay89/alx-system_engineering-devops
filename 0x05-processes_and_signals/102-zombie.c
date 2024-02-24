#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>


/**
 * infinity_while - A function to keep the program running indefinitely
 * Return: always 0
 */
int infinity_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - Entry point for the program.
 * Return: Always 0.
 */
int main(void)
{
	int i, pid;


	for (i = 0; i < 5; i++)
	{
		pid = fork();

		if (pid == 0)
		{
			printf("Zombie process created, PID: %d\n", getpid());
			return (0);
		}
	}

	for (i = 0; i < 5; i++)
	{
		waitpid(-1, NULL, 0);
	}

	infinity_while();

	return (0);
}

