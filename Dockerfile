FROM  docker.io/continuumio/miniconda3

# Install conda packages.
RUN conda update -y conda \
    && conda update --all -y \
    && conda clean --all --yes

# pymol runtime
RUN	apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
	DEBIAN_FRONTEND=noninteractive apt-get -y autoremove

WORKDIR /opt
RUN	\
	git clone https://github.com/rsanchezgarc/deepEMhancer  && \
	cd deepEMhancer && \
	conda env create -f deepEMhancer_env.yml  -n deepEMhancer_env && \
	conda activate deepEMhancer_env && \
	conda env config vars set LD_LIBRARY_PATH=${CONDA_PREFIX}/lib/python3.9/site-packages/nvidia/cudnn/lib:${CONDA_PREFIX}/lib/:$LD_LIBRARY_PATH && \
	conda activate deepEMhancer_env && \
	python -m pip install . --no-deps && \
	deepemhancer --download
