@PHONY: pc-setup qrslides render preview publish clean

pc-setup:
	python-3.11.4 -m pip install --upgrade pip
	python-3.11.4 -m pip install -r requirements.txt

	# remove original welcome notebook
	rm -rf ../welcome.ipynb

	# copy over repo files to parent directory
	cp -rf worksheets ..

slides:
	find ./materials/slides/ -type f -name *.qmd -exec quarto render {} \;

render:
	quarto render

preview:
	quarto preview index.qmd --port 8888

publish:
	# run the below once before runing this target
	# you only need to run this target once if ci is setup

	# git checkout --orphan gh-pages
	# git reset --hard # make sure all changes are committed before running this!
	# git commit --allow-empty -m "Initialising gh-pages branch"
	# git push origin gh-pages

	make render
	quarto publish gh-pages

clean:
	rm -rf docs/ _site/

	rm -rf materials/slides/*_files
	rm -rf materials/slides/*.html
