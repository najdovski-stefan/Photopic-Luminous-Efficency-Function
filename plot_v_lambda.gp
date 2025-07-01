# plot_v_lambda.gp

set terminal pngcairo size 1000,600 enhanced font 'Arial,12'
set output 'v_lambda_plot.png'

set title "V(λ) - Spectral Luminous Efficiency Function"
set xlabel "Wavelength (nm)"
set ylabel "V(λ)"
set grid
set key off

# Optional: set xrange [370:780] if needed
plot 'v_lambda_data.dat' using 1:2 with lines lw 2 lc rgb 'blue'
