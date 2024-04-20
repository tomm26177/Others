#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>
#include <time.h>

float* array;
float global_sum = 0;
CRITICAL_SECTION sum_lock;


DWORD WINAPI ThreadFunc(LPVOID lpParam) {
    int* thread_params = (int*)lpParam;
    int thread_id = thread_params[0];
    int start_index = thread_params[1];
    int end_index = thread_params[2];

    printf("Thread #%d size=%d\n", thread_id, end_index - start_index);  

    float partial_sum = 0;
    for (int i = start_index; i < end_index; i++) {
        partial_sum += array[i];
    }

    EnterCriticalSection(&sum_lock);
    global_sum += partial_sum;
    LeaveCriticalSection(&sum_lock);

    printf("Thread #%d sum=%f\n", thread_id, partial_sum);

    return 0;
}

int main(int argc, char* argv[]) {
    
   

    if (argc != 3) {
        fprintf(stderr, "Błąd: Program przyjmuje dokładnie 2 argumenty.\n");
        return 1;
    }

    for (int i = 0; i < strlen(argv[1]); i++) {
        if (!isdigit(argv[1][i])) {
            fprintf(stderr, "Błąd: Argument powinien składać się tylko z cyfr dziesiętnych.\n");
            return 1;
        }
    }



    int n = atoi(argv[1]);
    int w = atoi(argv[2]);

    array = (float*)malloc(n * sizeof(float));

    srand(0);
    for (int i = 0; i < n; i++)
        array[i] = 1000. * rand() / RAND_MAX;


    InitializeCriticalSection(&sum_lock);

    int* thread_params = new int[w * 3];
    HANDLE* threads = new HANDLE[w];




    double start_time = clock();


    int thread_index = 0;
    int elements_per_thread = n / w;
    int extra_elements = n % w;

    for (int i = 0; i < w; i++) {
        int start_index = thread_index;
        int end_index = start_index + elements_per_thread + (i < extra_elements ? 1 : 0); 

        thread_params[i * 3] = i + 1;
        thread_params[i * 3 + 1] = start_index;
        thread_params[i * 3 + 2] = end_index;

        threads[i] = CreateThread(NULL, 0, ThreadFunc, &thread_params[i * 3], 0, NULL);

        thread_index = end_index;
    }

    WaitForMultipleObjects(w, threads, TRUE, INFINITE);


    double end_time = clock();
    double elapsed_time = ((double)(end_time - start_time)) / CLOCKS_PER_SEC;

    DeleteCriticalSection(&sum_lock);



    double start_time2 = clock();

    float sum_without_threads = 0;
    for (int i = 0; i < n; i++) {
        sum_without_threads += array[i];
    }

    double end_time2 = clock();
    double elapsed_time2 = ((double)(end_time2 - start_time2)) / CLOCKS_PER_SEC;



    printf("w/Threads: sum=%f, time=%.3fsec\n", global_sum, elapsed_time );
    printf("wo/Threads: sum=%f, time=%.3fsec\n", sum_without_threads, elapsed_time2 );

    free(array);
    delete[] thread_params;
    delete[] threads;

    return 0;
}
