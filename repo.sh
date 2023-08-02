#!/bin/bash

# GitHub Personal Access Token
# Replace with your actual GitHub token
GITHUB_TOKEN=""

# Define the list of Git repositories (format: "username/repo")
repos=(
  "repo1"
  "repo2"
  # Add more repository identifiers as needed
)

# Temporary directory to clone repositories
temp_dir=$(mktemp -d)

# Function to update code and create pull request in a repository
update_repo() {
  local repo="$1"
  
  # Clone the repository to the temporary directory
  git clone "git@github.com:<username/org-name>/$repo.git" "$temp_dir/$repo"
  
  # Navigate to the cloned repository directory
  cd "$temp_dir/$repo" || exit
  
  # Perform your code replacement or modification here
  # For example, replace all occurrences of "old_string" with "new_string"
  find . -type f -exec sed -i 's/old_string/new_string/g' {} +  
  
  # Commit the changes
  git add .
  git commit -m "helm API migration"
  
  # Push the changes to a new branch
  git checkout -b code-replacement
  git push origin code-replacement
  
  # Create a pull request using the GitHub API
  curl -X POST \
    -H "Authorization: Bearer $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    "https://api.github.com/repos/$repo/pulls" \
    -d '{
      "title": "Code Replacement",
      "body": "code replacement",
      "head": "code-replacement",
      "base": "master"
    }'
  
  echo "Pull request created for $repo"
}

# Loop through each repository and update code
for repo in "${repos[@]}"; do
  update_repo "$repo"
done

# Clean up temporary directory
rm -rf "$temp_dir"

echo "Code replacement and pull requests in all repositories complete."
