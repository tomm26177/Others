// SO IS1 214B LAB10
// Tomasz Kaminski
// kt53661@zut.edu.pl
 
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>
#include <math.h>
 
#define MAX_THREADS 100
 
struct Thread {
    int id;
    int start;
    int end;
};
 
 
double Finalsum = 0;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
 
 
void *compute_pi(void *arg) {
    struct Thread *thread = (struct Thread *)arg;
    double sum = 0;
 
    for (int i = thread->start; i < thread->end; ++i) {
        sum += 1.0 / (2 * i + 1) * pow(-1, i);
    }
 
 
   pthread_mutex_lock(&mutex);
    Finalsum += sum;
    pthread_mutex_unlock(&mutex);

 
    printf("Thread %lx size=%d first==%d sum=%.20lf\n", pthread_self(), thread->end - thread->start, thread->start, sum);
 
    pthread_exit(NULL);
}
 
 
 
int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <number_of_terms> <number_of_threads>\n", argv[0]);
        return EXIT_FAILURE;
    }
 
    int n = atoi(argv[1]);
    int w = atoi(argv[2]);
 
    if (n <= 1 || w <= 1 || n >= 1000000 || w >= fmin(100, n)) {
        fprintf(stderr, "Invalid input parameters.\n");
        return EXIT_FAILURE;
    }
 
    pthread_t threads[MAX_THREADS];
    struct Thread thread[MAX_THREADS];
    clock_t TimeStart, TimeEnd;
 
    TimeStart = clock();
    for (int i = 0; i < w; ++i) {
        int start = i * (n / w);

        int end;
	if (i == w - 1) {
    	end = n;
	} else{
	    end = (i + 1) * (n / w);
	}

 
        thread[i].id = i;
        thread[i].start = start;
        thread[i].end = end;
 
        pthread_create(&threads[i], NULL, compute_pi, (void *)&thread[i]);
    }
    for (int i = 0; i < w; ++i) {
        pthread_join(threads[i], NULL);
    }
 
    TimeEnd = clock();
 
    printf("w/Threads PI=%.20lf time=%.6lf\n", 4 * Finalsum, ((double)TimeEnd - TimeStart) / CLOCKS_PER_SEC);
 
    	Finalsum = 0;
    TimeStart = clock();
 
    for (int i = 0; i < n; ++i) {
        Finalsum += 1.0 / (2 * i + 1) * pow(-1, i);
    }
 
    TimeEnd = clock();
 
    printf("wo/Threads PI=%.20lf time=%.6lf\n", 4 * Finalsum, ((double)TimeEnd - TimeStart) / CLOCKS_PER_SEC);
 
    return EXIT_SUCCESS;
}