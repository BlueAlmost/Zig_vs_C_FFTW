#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h>
#include <string.h>
#include <math.h>
#include <fftw3.h>

int main(int argc, char** argv) {

    if(argc != 3){
        printf("2 input arguments expected, number of reps, and m\n");
        printf("received %d input arguments\n", argc);
        return(1);
    }

    char *s1, *s2;
    long N_REP = strtol(argv[1], &s1, 10);
    long m = strtol(argv[2], &s2, 10);

    if(m>21){
        printf("excessive m, limited to max m of 21, received m: %d \n", m);
        return(1);
    }

    long N, M;

    N = 1 << m;
    M = 1 << m-1;
    printf("N_REP: %d, m: %d, N: %d\n", N_REP, m, N);

    double* in = (double*) malloc(N*sizeof(double));
    fftw_complex* out = (fftw_complex*) malloc(M*sizeof(fftw_complex));

    fftw_plan p;
    p = fftw_plan_dft_r2c_1d(N, in, out, FFTW_ESTIMATE);

    /* prepare a cosine wave */
    for (int i = 0; i < N; i++) {
        in[i] = cos(0.321 * 2*M_PI*i/N);
    }

    for (int i = 0; i < N_REP; i++) {
        fftw_execute(p);
    }

    return 0;
}
