# Zig_vs_C_FFTW
Example of Zig calls to FFTW are slower than C calls to FFTW (roughly by a factor of 2).

Zig slower than C when calling FFTW libraries.

![comparison](https://github.com/user-attachments/assets/e4d109a7-d6c7-424e-b8e3-94827ea2f992)


To recreate timing results,

Dependencies:

   i   - FFTW library 

   ii  - hyperfine benchmarking tool

   iii - (optional for plotting) gnuplot

   iv  - c compiler

Steps:

1) run "zig build", to build the zig version 
2) run "compile_c_version.sh" to build analogous c code version
3) run "run_benchmarks.sh":
   
   a - this uses hyperfine to run 5000 repetitions of fft computations of sizes 2^10 .. 2^15
   
   b - resulting csv files are humanly readable in results directory
   
   c - to plot these run "plot_results.sh"
   


