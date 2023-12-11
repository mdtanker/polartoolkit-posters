install:
	mamba env update --name antarctic_plots_binder --file environment.yml --prune
remove:
	mamba remove --name antarctic_plots_binder --all
