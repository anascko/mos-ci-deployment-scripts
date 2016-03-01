sudo rm -rf mos-ci-deployment-scripts
git clone https://github.com/Mirantis/mos-ci-deployment-scripts.git
PARSED_LINK='https://product-ci.infra.mirantis.net/view/9.0-mitaka/job/9.0-kilo.all/lastSuccessfulBuild/api/python'
ISO_DIR='/var/www/fuelweb-iso'
cd mos-ci-deployment-scripts/jenkins-job-builder/python_scripts/9.0_parse_jenkins_for_iso
sudo python parser.py --link "$PARSED_LINK" -d "$ISO_DIR"

set +e
sudo dos.py list > temp
while read -r line
do
set -e
sudo dos.py erase $line || true
done < temp