#!/bin/bash
gfortran -o ph_ef_fn_generate_data ph_ef_fn_generate_data.f90
./ph_ef_fn_generate_data
gnuplot plot_v_lambda.gp
