fileid="1SGwIP3DyCghESgI65bL0-jil0hh1GqGT"
filename="DIV2K_TRAIN.zip"

#
export fileid="1x1iAImSPnSwNRcgFbrpWZBqiMP37rIbN"
export filename="DIV2K_VAL.zip"


wget --save-cookies cookies.txt 'https://docs.google.com/uc?export=download&id='$fileid -O- \
         | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p' > confirm.txt

wget --load-cookies cookies.txt -O $filename \
         'https://docs.google.com/uc?export=download&id='$fileid'&confirm='$(<confirm.txt)
