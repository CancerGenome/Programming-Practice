/*
 * =====================================================================================
 *
 *       Filename:  c_faq.c
 *
 *    Description:  * This is example from kernighan of "The C Programming Language" *
 *
 *        Version:  1.0
 *        Created:  08/10/2010 
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Wang yu
 *        Company:  BIG
 *
 * =====================================================================================
 */

#include <stdio.h>
#define LOW 0
#define UP 300
#define STEP 20
#define MAXLINE 1000 

/* 1.1
   main()
   {
           printf ("Hello World\n");
   }
*/

/* 1.2  Print Fahrenheit-Celsius table

main()
{
	int fahr, celsius;
	int low, upper, step;
	low = 0;
	upper = 300;
	step = 20;

	fahr = low;

	while (fahr <= upper) {
		celsius = 5 * (fahr -32)/9;
		printf ("%d\t%d\n",fahr,celsius);
		fahr += step;
	}
}
*/

/* 1.3 Print Fahrenheit-Celsius table via for loop 

main()
{
	int fahr;
	for (fahr = LOW; fahr <= UP; fahr = fahr + STEP)
		printf ("%3d %6.1f\n",fahr, (5.0/9.0)*(fahr-32));  // pay attention of 5.0 and 9.0
}
*/

// 1.5 File copying
/*main()
{
	long c;

	while( getchar() != EOF) {
		++c;
		printf("%ld\n",c);
	}
}

// exe 1-7
int main(void){
	printf("EOF is %d\n",EOF);
}

*/

// 1.5.2 count character

/*main()
{
	double nc;
	for (nc = 0; getchar()!= EOF; ++nc)
		;
	printf("%.0f\n",nc);
}

*/

// 1.5.3 count line and words #
/*main()
{
	int c,nl,cl,bl,tl;
	nl = 0;
	cl = 0;

	while ((c = getchar()) != EOF) {
		if (c == '\n') 
			++ nl;
		else if (c == ' ') {
			++ bl;
		}
		else if (c == '\t') {
			++ tl;
		}
		else {
			++ cl;
		}
	}

	printf ("Line\tWord\tBlank\tTab\n");
	printf ("%d %d %d %d\n",nl,cl,bl,tl);
}
*/

/*main()
{
	int x;
	x = power(5,5);
		printf ("%d\n",x);
}

int power(int base,int n) {
	int i,p;
	p = 1;
	for (i = 1; i<=n; ++i)
		p = p*base;
	return p;
}
*/

// print longest input line
// Pre-defined function 

int getline (char line[], int maxline);
void copy (char out[], char in[]);
void reverse (char out[], char in[]);

main()
{
	int len;
	int max = 0;
	char line[MAXLINE];
	char longest[MAXLINE];
	char re[MAXLINE];

	while((len = getline(line,MAXLINE)) > 0) { // control input
		if (len > max) {
			max = len;
			copy(longest,line);
		}
	}
		if(max > 0) {
			reverse (re,longest);
			printf("%s\n",re);
			return 0;
		}
}

int getline(char s[], int maxline)
{
	int c,i;
	for (i=0;i< maxline -1 && (c=getchar())!= EOF && c!='\n';++i)
			s[i]=c;
		if (c == '\n'){
			s[i]=c;
			++i;
		}
		s[i]='\0';
		return i;
}

void copy (char out[], char in[])
{
int i;
i=0;
while((out[i]= in[i])  != '\0')
	++i;
}

void reverse(char out[], char in[])
{
	int i = 0;

	while(in[i]!='\n'){
		i++;
	}

	int j = i;
	
	while(j >= 0) {
		out[i-j] = in[j];
		j--;
	}

}
