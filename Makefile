@PHONY: pc-setup

pc-setup:
	python-3.11.4 -m pip install --upgrade pip
	python-3.11.4 -m pip install -r requirements.txt

	# remove original welcome notebook
	rm -rf ../welcome.ipynb

	# copy over repo files to parent directory
	cp -rf worksheets ..
