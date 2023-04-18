mkdir eps 					# Creates a folder for the eps files
mkdir pdf 					# Creates a foledr for the old pdf files

for FILE in ./*.eps; 		# For all .eps files
	do epstopdf "${FILE}";  # Converts the files to pdf
    mv "$FILE" eps;			# Moves them to the eps folder
done

for FILE in ./*.pdf;		# For all the .pdf files created
	do pdfcrop "${FILE}";	# Crops the pdf files
	mv "$FILE" pdf          # Move them to the pdf folder
done

# Remove original pdf files
rm -rf pdf

# Rename cropped files
rename 's/-crop//' *.pdf