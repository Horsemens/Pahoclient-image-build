# remove temp directory if exist
if [ -d temp ]
then
    echo "Deleting temp........."
    rm -rf temp
fi

if [ -z $1]
then 
    branch="development"
else
    branch=$1
fi

echo "Cloning repo.........."
git clone https://github.com/Horsemens/Predictive-Maintenance.git  temp/
cd temp
echo "${branch} branch will be used"
git checkout $branch


docker login -u horsemens -p horsemen@123
docker build -t horsemens/horsemens-pahoclient:$branch .
docker push horsemens/horsemens-pahoclient:$branch
cd ../
if [ -d temp ]
then
    echo "Deleting temp........."
    rm -rf temp
fi

echo "Done......................"