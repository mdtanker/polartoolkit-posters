install:
	mamba env update --name polartoolkit_binder --file environment.yml --prune
create:
	mamba env create --name polartoolkit_binder --file environment.yml
remove:
	mamba remove --name polartoolkit_binder --all
