#!/usr/bin/env bash
anaconda_path=`which python | rev | cut -f 3- -d"/" | rev` &&
rm $anaconda_path/conda-bld/linux-64/*

conda-build . -c anaconda -c conda-forge --python=3.6 # &&

#conda install --use-local deepEMhancer -c anaconda -c conda-forge
#conda install   deepEMhancer -c file:///home/ruben/app/anaconda3/envs/deepEMhancer_env/conda-bld/ -c anaconda -c conda-forge
# echo rsanchez1369 | anaconda upload $anaconda_path/conda-bld/linux-64/deepEMhancer-*.bz2  # && conda build purge
#xxxXxx
