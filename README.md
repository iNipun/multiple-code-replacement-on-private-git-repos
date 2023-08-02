# multiple-code-replacement-on-private-git-repos
Creating pull requests in remote Git repositories requires interacting with the repository's hosting service API (e.g., GitHub, GitLab). Below is a script that uses the GitHub API to create a pull request to replace code in multiple repositories. This example assumes you're using GitHub, but you can adapt it for other Git hosting services as well.

To use this script, you'll need a personal access token from GitHub. Make sure you keep your token secure and never hardcode it directly into your script. Instead, you can store it in a secure environment variable or a separate configuration file.


This repo contains a bash script to update all git repos public/private repeatative code in one go. It also creates a Pull request for all repos.

#Note
Replace "YOUR_GITHUB_TOKEN" with your actual GitHub personal access token.

Remember that this script interacts with your GitHub repositories via API requests, so it's essential to use it responsibly and securely. Always be cautious when automating actions that affect remote repositories.

