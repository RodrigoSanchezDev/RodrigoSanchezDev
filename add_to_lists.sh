#!/bin/bash

add_repo_to_list() {
  local list_id=$1
  local owner=$2
  local name=$3
  
  repo_id=$(gh api graphql -f query="query { repository(owner: \"$owner\", name: \"$name\") { id } }" --jq '.data.repository.id' 2>/dev/null)
  
  if [ -n "$repo_id" ]; then
    gh api graphql -f query="mutation { addStarredRepositoryToList(input: {listId: \"$list_id\", starredRepositoryId: \"$repo_id\"}) { starredRepositoryList { name } } }" >/dev/null 2>&1 && echo "Added $name"
  fi
}

# List IDs
BACKEND="UL_kwDOCd3i_c4AZ6La"
FRONTEND="UL_kwDOCd3i_c4AZ6Lb"
CLOUD="UL_kwDOCd3i_c4AZ6Le"
SECURITY="UL_kwDOCd3i_c4AZ6Lh"
DATABASES="UL_kwDOCd3i_c4AZ6Li"

echo "Adding to Backend & Java..."
add_repo_to_list $BACKEND "spring-projects" "spring-boot"
add_repo_to_list $BACKEND "spring-projects" "spring-security"
add_repo_to_list $BACKEND "JetBrains" "kotlin"
add_repo_to_list $BACKEND "ReactiveX" "RxJava"
add_repo_to_list $BACKEND "google" "gson"
add_repo_to_list $BACKEND "square" "retrofit"

echo "Adding to Frontend & UI..."
add_repo_to_list $FRONTEND "facebook" "react"
add_repo_to_list $FRONTEND "vitejs" "vite"
add_repo_to_list $FRONTEND "tailwindlabs" "tailwindcss"
add_repo_to_list $FRONTEND "graphql" "graphql-js"

echo "Adding to Cloud & DevOps..."
add_repo_to_list $CLOUD "aws" "aws-sdk-java-v2"
add_repo_to_list $CLOUD "docker" "compose"
add_repo_to_list $CLOUD "kubernetes" "kubernetes"
add_repo_to_list $CLOUD "helm" "helm"
add_repo_to_list $CLOUD "grafana" "grafana"
add_repo_to_list $CLOUD "prometheus" "prometheus"
add_repo_to_list $CLOUD "microsoft" "vscode"

echo "Adding to Security & Testing..."
add_repo_to_list $SECURITY "OWASP" "CheatSheetSeries"
add_repo_to_list $SECURITY "auth0" "java-jwt"
add_repo_to_list $SECURITY "mockito" "mockito"
add_repo_to_list $SECURITY "junit-team" "junit5"
add_repo_to_list $SECURITY "testcontainers" "testcontainers-java"

echo "Adding to Databases & Messaging..."
add_repo_to_list $DATABASES "postgres" "postgres"
add_repo_to_list $DATABASES "redis" "redis"
add_repo_to_list $DATABASES "mongodb" "mongo"
add_repo_to_list $DATABASES "apache" "kafka"

echo "Done!"
