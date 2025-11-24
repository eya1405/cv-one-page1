# CV One Page — CI/CD with Jenkins

## Repository structure
- src/: HTML/CSS static site
- docker/: Dockerfile (Nginx)
- jenkins/: Jenkinsfile pipeline

## Jenkins setup
1. Access Jenkins: http://<DEVOPS-LAB-IP>:8080
2. Install plugins: Pipeline, Git, Docker Pipeline, Credentials Binding.
3. Credentials:
   - dockerhub-creds: Docker Hub username/password
   - slack-webhook: Slack incoming webhook URL
4. Create Pipeline job pointing to this repo, branch main, script path jenkins/Jenkinsfile.

## Pipeline behavior
- Polls GitHub every 5 minutes (SCM polling).
- Builds Docker image from docker/Dockerfile.
- Pushes tags: `main-<BUILD_NUMBER>` and `latest`.
- Sends Slack notification on success or failure.

## Test locally
docker build -t cv-local -f docker/Dockerfile .
docker run -d -p 8081:80 --name cv-test cv-local
curl http://localhost:8081
# cv-one-page1
# cv-one-page1
