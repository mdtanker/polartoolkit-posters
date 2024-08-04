install:
	mamba env update --name polartoolkit_binder --file environment.yml --prune
remove:
	mamba remove --name polartoolkit_binder --all
