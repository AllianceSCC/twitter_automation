
######################################################
#Generate the folder for the new post on the website
#######################################################

date=$(date +"%F")

cd ~/ASCC_wowchemy_migration #move to the website repo

git status #check addition of new file

git add .

git commit -m "add new blog"

######################################################
#Rebuild the webpage & publish
#######################################################

hugo #rebuild website

cd public

git status #check rebuild

git add . 

git commit -m "rebuild with new blog"

git push origin master #push new digest to the website

echo "blog published on $date"

######################################################
#Trigger automatic tweets
#######################################################

cd ~/twitter_automation

Rscript code/get_article_links.R #run the code to randomly select links to tweet for the next week
