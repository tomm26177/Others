//SO IS1 214B LAB09
//TOMASZ KAMINSKI
// kt53661@zut.edu.pl


#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void printErrorAndExit(const char* message) {
    fprintf(stderr, "%s\n", message);
    exit(1);
}
int main(int argc, char* argv[]) {
    if (strlen(argv[1]) < 1 || strlen(argv[1]) > 25) {
        printErrorAndExit("nieprawidlowa liczba argumentow");
    }
    for (size_t i = 0; i < strlen(argv[1]); ++i) {
        if (!isdigit(argv[1][i])) {
            printErrorAndExit("argument zawiera niedozwolone znaki");
        }
    }
    if (strlen(argv[1]) == 1) {
        int exitCode = argv[1][0] - '0';
        exit(exitCode);
    }
    size_t length = strlen(argv[1]);
    size_t half = length / 2;
    size_t secondHalf = length - half;
    STARTUPINFO si1, si2;
    PROCESS_INFORMATION pi1, pi2;
    DWORD exitCodeSum = 0;

    ZeroMemory(&si1, sizeof(STARTUPINFO));
    si1.cb = sizeof(STARTUPINFO);
    ZeroMemory(&pi1, sizeof(PROCESS_INFORMATION));
    char childArg1[26];
    strncpy(childArg1, argv[1], half);
    childArg1[half] = '\0';
    const char* arguments1 = childArg1;
    const char* commandLine1 = "SOzad3 ";
    char* fullCommandLine1 = malloc(strlen(commandLine1) + strlen(arguments1) + 1);
    sprintf(fullCommandLine1, "%s%s", commandLine1, arguments1);
    if (!CreateProcessA(
        NULL,
        fullCommandLine1,
        NULL,
        NULL,
        FALSE,
        0,
        NULL,
        NULL,
        &si1,
        &pi1
    )) {
        printErrorAndExit("blad w tworzeniu procesu");
    }

    ZeroMemory(&si2, sizeof(STARTUPINFO));
    si2.cb = sizeof(STARTUPINFO);
    ZeroMemory(&pi2, sizeof(PROCESS_INFORMATION));
    char childArg2[26];
    strncpy(childArg2, argv[1] + half, secondHalf);
    childArg2[secondHalf] = '\0';
    const char* arguments2 = childArg2;
    const char* commandLine2 = "SOzad3 ";
    char* fullCommandLine2 = malloc(strlen(commandLine2) + strlen(arguments2) + 1);
    sprintf(fullCommandLine2, "%s%s", commandLine2, arguments2);
    if (!CreateProcessA(
        NULL,
        fullCommandLine2,
        NULL,
        NULL,
        FALSE,
        0,
        NULL,
        NULL,
        &si2,
        &pi2
    )) {
        printErrorAndExit("blad w tworzeniu 2 procesu");
    }
    WaitForSingleObject(pi1.hProcess, INFINITE);
    WaitForSingleObject(pi2.hProcess, INFINITE);
    DWORD exitCode1, exitCode2;
    if (!GetExitCodeProcess(pi1.hProcess, &exitCode1) || !GetExitCodeProcess(pi2.hProcess, &exitCode2)) {
        printErrorAndExit(" blad w exitcode procesu potomnego");
    }
    printf("%lu %lu %s %lu\n", GetCurrentProcessId(), pi1.dwProcessId, childArg1, exitCode1);
    printf("%lu %lu %s %lu\n", GetCurrentProcessId(), pi2.dwProcessId, childArg2, exitCode2);
    exitCodeSum = exitCode1 + exitCode2;
    CloseHandle(pi1.hProcess);
    CloseHandle(pi1.hThread);
    CloseHandle(pi2.hProcess);
    CloseHandle(pi2.hThread);
    exit(exitCodeSum);
}