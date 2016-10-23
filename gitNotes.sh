
# ALL COMMANDS EXECUTED IN REPOSITORY DIR

# Clone
git clone taylorcooper@github.com/project

# Clone Bare (this did not work....)
git clone --bare https://github.com/MistyWest/project

# Commit
git add .
read -p "Commit description: " desc
git commit -m "$desc"
git push origin master

# Pull
git pull

# Force Pull
git stash
git fetch -f

# Initialize
git init
touch # Updates time stamp on target
git add . # Adds everything in folder
git commit -a -m "Initial commit."
git remote add origin taylorcooper@https://github.com/taylorcooper/PROJECTNAME
git remote -v
git push origin master

