# Task:

Build CI/CD solution for Spring-Petclinic project that is built by Maven.

Jenkins master, Jenkins slave instance and Nexus should be provisioned by Ansible roles.
Create Nexus proxy for Maven, Maven release and snapshot repos. Set Maven repo in Jenkins (Maven plugin settings). Create two Docker registries: first for snapshot versions, second for release. Release registry should avoid redeploys (versions should be unique)

Create Jenkins jobs which do the following:

### PreCommit job:

1. watch for changes being pushed to review to any branch;
build project with Maven, including unit tests (if any);
should NOT upload artifacts to Nexus.
 

### Build job:

1. watch for updates on "dev" branch;
2. build project with Maven, including unit tests (if any);
3. on successful build: upload artifacts to Nexus (snapshots repository);build Docker image with snapshot artifact and upload it to Nexus Docker  snapshot registry. Tag image like: petclinic:artifact-version (e.g petclinic:1.0.0-SNAPSHOT).

### Deployment job:

1. triggers by Build job;
2. receive artifact version as parameter from Build job;
3. run Docker container on the slave instance. Make sure that you are able to open the PetClinic start page on 80 port.

### Promotion job:

1. triggers manually;
2. take project version as input parameter;
3. Maven should perform "release:perform";
4. change project version to release one;
5. upload artifact(s) to Nexus (release repository);
6. Build Docker image with released artifact (pulls proper version from Nexus release repo). Tag it like: petclinic:release-artifact-version (e.g. petclinic:1.0.0) and push it to Nexus Docker release registry.

# Solution

Terraform was used to provision the following GCP infrastructure:

![Alt text](infrastructure-diagram.png?raw=true "Title")

Terraform configuration is split into build-vpc and dev-vpc. There are 3 modules for creating networks, compute instances and firewall rules
Terraform generates ssh keys and ansible inventory, and puts them in ansible folder for further use

Ansible is used to set up all Compute instances. app role is used on jenkins-agent for deploying the application from Nexus to app-server.

Jenkins precommit job runs maven and docker builds whenever a pull request is opened. Github will show the status of the build on the pull request page.

Jenkins build pipeline triggers on push to dev branch. It builds the project using maven, auto-increments minor snapshot version, runs a docker build. Application artifacts and docker image are pushed to Nexus repository. Then, deploy job is triggered.

Jenkins deploy pipeline triggers by build job. It recieves artifact version from build job and runs an Ansible playbook which pulls corresponding docker image from Nexus and runs it as a container.

Jenkins promotion pipeline triggers manually. It takes project version as input parameter, perform a release, and pushes release maven artifacts and docker image to Nexus.
